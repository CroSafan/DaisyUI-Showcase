package com.example.daisyshowcase.controller;

import com.example.daisyshowcase.model.ShowcasePage;
import com.example.daisyshowcase.service.ShowcaseService;
import com.example.daisyshowcase.service.TimeManagementService;
import com.example.daisyshowcase.service.TimeManagementService.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.charset.StandardCharsets;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class TimeManagementController {
    private final ShowcaseService showcase;
    private final TimeManagementService time;
    public TimeManagementController(ShowcaseService showcase, TimeManagementService time) { this.showcase=showcase; this.time=time; }
    @ModelAttribute("navigation") public List<ShowcasePage> navigation() { return showcase.pages(); }

    @GetMapping({"/time/overview","/time/access","/time/timesheet","/time/department","/time/schedules",
        "/time/leave","/time/holidays","/time/approvals","/time/exceptions","/time/reports"})
    public String page(HttpServletRequest request, HttpSession session, Model model,
                       @RequestParam(required=false) String month, @RequestParam(required=false) String team,
                       @RequestParam(required=false) String week, @RequestParam(required=false) String severity,
                       @RequestParam(required=false) String employee) {
        String path=request.getRequestURI().substring(request.getContextPath().length());
        String slug=path.substring(path.lastIndexOf('/')+1).split(";",2)[0];
        String pageSlug=slug.equals("approvals") ? "approvals-time" : slug;
        YearMonth period=time.month(month);
        String selectedTeam=time.team(team);
        MonthGrid grid=time.grid(selectedTeam,period);
        model.addAttribute("current",showcase.page(pageSlug).orElseThrow());
        model.addAttribute("timeNavigation",showcase.pages().stream().filter(p->p.category().equals("Time management")).toList());
        model.addAttribute("period",period.toString());
        model.addAttribute("periodLabel",time.monthLabel(period));
        model.addAttribute("prevPeriod",period.minusMonths(1).toString());
        model.addAttribute("nextPeriod",period.plusMonths(1).toString());
        model.addAttribute("team",selectedTeam);
        model.addAttribute("teams",time.teams());
        model.addAttribute("grid",grid);
        model.addAttribute("timeMetrics",time.metrics(grid));
        model.addAttribute("employees",time.employees(selectedTeam));
        model.addAttribute("holidays",time.holidays());

        switch(slug) {
            case "access" -> {
                model.addAttribute("clockStatus",session.getAttribute("clockStatus") == null ? "OUT" : session.getAttribute("clockStatus"));
                model.addAttribute("clockEvents",clockEvents(session));
                model.addAttribute("person",time.employee("E-1042"));
                model.addAttribute("clockings",time.timesheet(time.employee("E-1042"),period));
            }
            case "timesheet" -> {
                Employee person=time.employees(selectedTeam).stream().filter(e->e.id().equals(employee)).findFirst()
                    .orElse(time.employees(selectedTeam).getFirst());
                model.addAttribute("person",person);
                model.addAttribute("clockings",time.timesheet(person,period));
                Map<String,String> decisions=decisions(session);
                model.addAttribute("corrections",corrections(session).stream().map(c -> new CorrectionRequest(c.id(),c.date(),c.start(),c.end(),c.reason(),
                    decisions.getOrDefault(c.id(),c.status()))).toList());
            }
            case "schedules" -> {
                LocalDate start=time.week(week);
                model.addAttribute("weekStart",start.toString());
                model.addAttribute("weekEnd",start.plusDays(6).toString());
                model.addAttribute("prevWeek",start.minusWeeks(1).toString());
                model.addAttribute("nextWeek",start.plusWeeks(1).toString());
                model.addAttribute("shifts",time.shifts(selectedTeam,start));
                model.addAttribute("weekDays",java.util.stream.IntStream.range(0,7).mapToObj(i->Map.of(
                    "date",start.plusDays(i).toString(),"label",start.plusDays(i).format(DateTimeFormatter.ofPattern("EEE d MMM",Locale.ENGLISH)))).toList());
            }
            case "leave" -> {
                List<LeaveRequest> requests=new ArrayList<>(time.leaveRequests());
                requests.addAll(leaveRequests(session));
                Map<String,String> decisions=decisions(session);
                model.addAttribute("leaveRequests",requests.stream().map(r -> new LeaveRequest(r.id(),r.employee(),r.team(),r.type(),r.from(),r.to(),r.days(),
                    decisions.getOrDefault(r.id(),r.status()),decisions.containsKey(r.id()) ? (decisions.get(r.id()).equals("Approved")?"success":"error") : r.tone(),r.cover(),r.note())).toList());
            }
            case "approvals" -> {
                Map<String,String> decisions=decisions(session);
                List<ApprovalItem> items=new ArrayList<>(time.approvals());
                for(LeaveRequest r:leaveRequests(session)) items.add(new ApprovalItem(r.id(),"Leave",r.employee(),r.team(),r.from()+" → "+r.to(),r.days()+" days",r.note().isBlank()?"Cover: "+r.cover():r.note(),"Pending","warning"));
                for(CorrectionRequest c:corrections(session)) items.add(new ApprovalItem(c.id(),"Clock correction","Mia Kovač","Operations",c.date(),c.start()+"–"+c.end(),c.reason(),"Pending","warning"));
                List<ApprovalItem> resolved=items.stream().map(a -> new ApprovalItem(a.id(),a.type(),a.employee(),a.team(),a.when(),a.amount(),a.context(),
                    decisions.getOrDefault(a.id(),a.status()),decisions.containsKey(a.id()) ? (decisions.get(a.id()).equals("Approved")?"success":"error") : a.tone())).toList();
                model.addAttribute("approvals",resolved);
                model.addAttribute("pendingCount",resolved.stream().filter(a->a.status().equals("Pending")).count());
                model.addAttribute("leaveApprovalCount",resolved.stream().filter(a->a.type().equals("Leave")&&a.status().equals("Pending")).count());
                model.addAttribute("correctionApprovalCount",resolved.stream().filter(a->a.type().equals("Clock correction")&&a.status().equals("Pending")).count());
                model.addAttribute("otherApprovalCount",resolved.stream().filter(a->!List.of("Leave","Clock correction").contains(a.type())&&a.status().equals("Pending")).count());
            }
            case "exceptions" -> {
                String filter=severity == null ? "all" : severity;
                model.addAttribute("severity",filter);
                model.addAttribute("exceptionTeam",team == null || team.isBlank() ? "" : selectedTeam);
                model.addAttribute("exceptions",time.exceptions().stream()
                    .filter(e->team == null || team.isBlank() || e.team().equals(selectedTeam))
                    .filter(e->filter.equals("all") || e.severity().equalsIgnoreCase(filter)).toList());
            }
            case "reports" -> {
                model.addAttribute("allTeamGrids",time.teams().stream().map(t->time.grid(t,period)).toList());
                model.addAttribute("reportBars",grid.totals().stream().filter(d->!d.day().weekend()).toList());
            }
            default -> { }
        }
        return "time/"+slug;
    }

    @PostMapping("/time/access/clock")
    public String clock(@RequestParam String action,HttpSession session,RedirectAttributes flash) {
        String state=String.valueOf(session.getAttribute("clockStatus") == null ? "OUT" : session.getAttribute("clockStatus"));
        Map<String,String> next=Map.of("in","WORKING","break","BREAK","resume","WORKING","out","OUT");
        boolean valid=switch(action) {
            case "in" -> state.equals("OUT"); case "break" -> state.equals("WORKING");
            case "resume" -> state.equals("BREAK"); case "out" -> state.equals("WORKING") || state.equals("BREAK");
            default -> false;
        };
        if(!valid) flash.addFlashAttribute("error","That action is unavailable from your current clock status.");
        else {
            session.setAttribute("clockStatus",next.get(action));
            clockEvents(session).add(0,new ClockEvent(LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm")),
                switch(action){case "in"->"Clocked in";case "break"->"Break started";case "resume"->"Break ended";default->"Clocked out";},"Web terminal"));
            flash.addFlashAttribute("notice","Time event recorded in this demo session.");
        }
        return "redirect:/time/access";
    }

    @PostMapping("/time/timesheet/correction")
    public String correction(@RequestParam String date,@RequestParam String start,@RequestParam String end,@RequestParam String reason,
                             HttpSession session,RedirectAttributes flash) {
        try {
            LocalDate day=LocalDate.parse(date); LocalTime from=LocalTime.parse(start),to=LocalTime.parse(end);
            if(!to.isAfter(from) || reason.isBlank() || reason.length()>300) throw new IllegalArgumentException();
            String id="TC-DEMO-"+(corrections(session).size()+1);
            corrections(session).add(0,new CorrectionRequest(id,day.toString(),start,end,reason.strip(),"Pending"));
            flash.addFlashAttribute("notice","Correction submitted for review in this demo session.");
        } catch(RuntimeException ex) { flash.addFlashAttribute("error","Enter a valid date, time range and reason (up to 300 characters)."); }
        return "redirect:/time/timesheet";
    }

    @PostMapping("/time/leave/request")
    public String requestLeave(@RequestParam String type,@RequestParam String from,@RequestParam String to,@RequestParam String note,
                               HttpSession session,RedirectAttributes flash) {
        try {
            LocalDate first=LocalDate.parse(from),last=LocalDate.parse(to);
            if(last.isBefore(first) || last.isAfter(first.plusDays(30))) throw new IllegalArgumentException();
            long days=first.datesUntil(last.plusDays(1)).filter(d->d.getDayOfWeek().getValue()<6).count();
            if(days<1 || days>20 || note.length()>300 || !List.of("Annual leave","Personal day","Unpaid leave").contains(type))
                throw new IllegalArgumentException();
            String id="LV-DEMO-"+(leaveRequests(session).size()+1);
            leaveRequests(session).add(0,new LeaveRequest(id,"Mia Kovač","Operations",type,from,to,(int)days,"Pending","warning","Noah Petrović",note.strip()));
            flash.addFlashAttribute("notice","Leave request "+id+" submitted for review in this demo session.");
        } catch(RuntimeException ex) { flash.addFlashAttribute("error","Enter a valid leave range of 1–20 weekdays and select a leave type."); }
        return "redirect:/time/leave";
    }

    @PostMapping("/time/approvals/decision")
    public String decide(@RequestParam String id,@RequestParam String decision,HttpSession session,RedirectAttributes flash) {
        boolean known=time.approvals().stream().anyMatch(a->a.id().equals(id)) || leaveRequests(session).stream().anyMatch(r->r.id().equals(id))
            || corrections(session).stream().anyMatch(c->c.id().equals(id));
        if(!known || !List.of("Approved","Rejected").contains(decision)) flash.addFlashAttribute("error","Invalid decision.");
        else { decisions(session).put(id,decision); flash.addFlashAttribute("notice",id+" marked "+decision.toLowerCase(Locale.ROOT)+" in this demo session."); }
        return "redirect:/time/approvals";
    }

    @GetMapping({"/time/department/export","/time/reports/export"})
    public ResponseEntity<byte[]> export(@RequestParam(required=false) String month,@RequestParam(required=false) String team) {
        MonthGrid grid=time.grid(time.team(team),time.month(month));
        StringBuilder csv=new StringBuilder("Employee,Team,Month,Worked hours,Worked days,Leave days,Exceptions\r\n");
        for(MonthRow row:grid.rows()) csv.append(csv(row.employee().name())).append(',').append(csv(grid.team())).append(',')
            .append(csv(grid.period())).append(',').append(row.totalHours()).append(',').append(row.workedDays()).append(',')
            .append(row.leaveDays()).append(',').append(row.exceptions()).append("\r\n");
        byte[] body=("\uFEFF"+csv).getBytes(StandardCharsets.UTF_8);
        return ResponseEntity.ok().contentType(new MediaType("text","csv",StandardCharsets.UTF_8))
            .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"time-"+grid.team().toLowerCase(Locale.ROOT)+"-"+grid.period()+".csv\"")
            .body(body);
    }
    private static String csv(String value) { return "\""+value.replace("\"","\"\"")+"\""; }

    @SuppressWarnings("unchecked") private List<ClockEvent> clockEvents(HttpSession s) {
        List<ClockEvent> value=(List<ClockEvent>)s.getAttribute("clockEvents");
        if(value==null){value=new ArrayList<>();s.setAttribute("clockEvents",value);}return value;
    }
    @SuppressWarnings("unchecked") private List<CorrectionRequest> corrections(HttpSession s) {
        List<CorrectionRequest> value=(List<CorrectionRequest>)s.getAttribute("corrections");
        if(value==null){value=new ArrayList<>();s.setAttribute("corrections",value);}return value;
    }
    @SuppressWarnings("unchecked") private List<LeaveRequest> leaveRequests(HttpSession s) {
        List<LeaveRequest> value=(List<LeaveRequest>)s.getAttribute("leaveRequests");
        if(value==null){value=new ArrayList<>();s.setAttribute("leaveRequests",value);}return value;
    }
    @SuppressWarnings("unchecked") private Map<String,String> decisions(HttpSession s) {
        Map<String,String> value=(Map<String,String>)s.getAttribute("approvalDecisions");
        if(value==null){value=new HashMap<>();s.setAttribute("approvalDecisions",value);}return value;
    }
    public record ClockEvent(String time,String action,String source) {
        public String getTime(){return time;} public String getAction(){return action;} public String getSource(){return source;}
    }
    public record CorrectionRequest(String id,String date,String start,String end,String reason,String status) {
        public String getId(){return id;} public String getDate(){return date;} public String getStart(){return start;} public String getEnd(){return end;}
        public String getReason(){return reason;} public String getStatus(){return status;}
    }
}
