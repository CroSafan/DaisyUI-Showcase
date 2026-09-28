package com.example.daisyshowcase.service;

import com.example.daisyshowcase.model.Metric;
import org.springframework.stereotype.Service;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.*;

@Service
public class TimeManagementService {
    public static final YearMonth DEFAULT_MONTH = YearMonth.of(2026, 9);
    private static final DateTimeFormatter DAY_FORMAT = DateTimeFormatter.ofPattern("EEE, dd MMM", Locale.ENGLISH);
    private static final DateTimeFormatter MONTH_FORMAT = DateTimeFormatter.ofPattern("MMMM yyyy", Locale.ENGLISH);
    private static final List<Employee> EMPLOYEES = List.of(
        new Employee("E-1042","Mia Kovač","Operations","Operations lead","MK","corporate",40),
        new Employee("E-1048","Noah Petrović","Operations","Service coordinator","NP","info",40),
        new Employee("E-1051","Sara Novak","Operations","Operations analyst","SN","secondary",40),
        new Employee("E-1063","Leo Marić","Operations","Facilities specialist","LM","warning",40),
        new Employee("E-1077","Ana Marić","Operations","Planning manager","AM","success",40),
        new Employee("E-1082","Luka Horvat","Operations","Dispatch coordinator","LH","accent",40),
        new Employee("E-1104","Iva Kovač","Product","Product manager","IK","primary",40),
        new Employee("E-1112","Ema Vuković","Product","UX researcher","EV","secondary",40),
        new Employee("E-1120","Marko Babić","Product","Product analyst","MB","info",40),
        new Employee("E-1131","Petra Jurić","Product","Designer","PJ","accent",32),
        new Employee("E-1201","Nina Perić","Support","Support lead","NP","warning",40),
        new Employee("E-1207","Tomislav Barić","Support","Support specialist","TB","success",40),
        new Employee("E-1212","Ivan Radić","Support","Support specialist","IR","primary",40),
        new Employee("E-1218","Marina Radić","Support","Service analyst","MR","secondary",32)
    );
    private static final List<String> TEAMS = List.of("Operations","Product","Support");

    public List<String> teams() { return TEAMS; }
    public String team(String raw) { return raw != null && TEAMS.contains(raw) ? raw : "Operations"; }
    public YearMonth month(String raw) {
        try { YearMonth value = YearMonth.parse(raw); return value.getYear() >= 2025 && value.getYear() <= 2028 ? value : DEFAULT_MONTH; }
        catch (RuntimeException ignored) { return DEFAULT_MONTH; }
    }
    public String monthLabel(YearMonth month) { return month.format(MONTH_FORMAT); }
    public List<Employee> employees() { return EMPLOYEES; }
    public List<Employee> employees(String team) { return EMPLOYEES.stream().filter(e->e.team().equals(team)).toList(); }
    public Employee employee(String id) { return EMPLOYEES.stream().filter(e->e.id().equals(id)).findFirst().orElse(EMPLOYEES.getFirst()); }

    public MonthGrid grid(String team, YearMonth month) {
        List<DayHeader> days = new ArrayList<>();
        for (int d=1; d<=month.lengthOfMonth(); d++) {
            LocalDate date=month.atDay(d);
            days.add(new DayHeader(date.toString(),String.valueOf(d),date.getDayOfWeek().getDisplayName(TextStyle.SHORT,Locale.ENGLISH),
                date.getDayOfWeek().getValue() >= 6, isCompanyHoliday(date)));
        }
        List<MonthRow> rows = new ArrayList<>();
        double[] dailyHours=new double[days.size()]; int[] dailyPresent=new int[days.size()];
        int index=0;
        for (Employee employee : employees(team)) {
            List<DayCell> cells=new ArrayList<>(); double total=0; int worked=0,leave=0,exceptions=0;
            for (int d=1;d<=days.size();d++) {
                DayHeader header=days.get(d-1);
                DayCell cell=cell(employee,index,month.atDay(d),header);
                cells.add(cell); total+=cell.hours();
                if (cell.code().equals("WORK") || cell.code().equals("OT")) { worked++; dailyPresent[d-1]++; }
                if (cell.code().equals("PTO")) leave++;
                if (cell.code().equals("MISS") || cell.code().equals("LATE")) exceptions++;
                dailyHours[d-1]+=cell.hours();
            }
            rows.add(new MonthRow(employee,List.copyOf(cells),round(total),worked,leave,exceptions)); index++;
        }
        List<DailyTotal> totals=new ArrayList<>();
        for (int i=0;i<days.size();i++) totals.add(new DailyTotal(days.get(i),round(dailyHours[i]),dailyPresent[i]));
        double totalHours=rows.stream().mapToDouble(MonthRow::totalHours).sum();
        int totalLeave=rows.stream().mapToInt(MonthRow::leaveDays).sum();
        int totalExceptions=rows.stream().mapToInt(MonthRow::exceptions).sum();
        int workdays=(int)days.stream().filter(d->!d.weekend()&&!d.holiday()).count();
        return new MonthGrid(team,month.toString(),monthLabel(month),List.copyOf(days),List.copyOf(rows),List.copyOf(totals),
            round(totalHours),workdays,totalLeave,totalExceptions);
    }

    private DayCell cell(Employee employee,int employeeIndex,LocalDate date,DayHeader header) {
        if (header.weekend()) return new DayCell("OFF","—",0,"Weekend","neutral",false);
        if (header.holiday()) return new DayCell("HOL","H",0,"Company holiday","secondary",false);
        int day=date.getDayOfMonth();
        if (day == 8 + employeeIndex % 8 || day == 19 + employeeIndex % 7) return new DayCell("PTO","P",0,"Approved leave","info",false);
        if (day == 14 && employeeIndex == 3) return new DayCell("MISS","!",0,"Missing clock-out","error",true);
        if (day == 22 && employeeIndex == 1) return new DayCell("LATE","7.0",7,"Late arrival","warning",true);
        double hours=employee.weeklyHours()==32 ? 6.5 : 8;
        boolean overtime=(day+employeeIndex)%11==0;
        if (overtime) hours+=1.5;
        if ((day+employeeIndex)%9==0) hours-=0.5;
        return new DayCell(overtime?"OT":"WORK",String.format(Locale.ROOT,"%.1f",hours),hours,
            overtime?"Overtime recorded":"Worked hours",overtime?"warning":"success",false);
    }
    private boolean isCompanyHoliday(LocalDate date) { return date.getYear()==2026 && date.getMonthValue()==9 && date.getDayOfMonth()==18; }
    private double round(double value) { return Math.round(value*10)/10.0; }

    public List<Clocking> timesheet(Employee employee, YearMonth month) {
        MonthGrid grid=grid(employee.team(),month);
        MonthRow row=grid.rows().stream().filter(r->r.employee().id().equals(employee.id())).findFirst().orElseThrow();
        List<Clocking> result=new ArrayList<>();
        for(int i=0;i<grid.days().size();i++) {
            DayHeader day=grid.days().get(i); DayCell cell=row.cells().get(i);
            String start=cell.hours()>0? (cell.code().equals("LATE")?"09:30":"08:30") : "—";
            String end=cell.hours()>0? (cell.code().equals("OT")?"18:30":employee.weeklyHours()==32?"15:30":"17:00") : "—";
            result.add(new Clocking(day.date(),day.weekday()+" "+day.day(),start,end,cell.hours()>0?"00:30":"—",cell.hours(),cell.code(),cell.label(),cell.tone()));
        }
        return List.copyOf(result);
    }

    public List<Metric> metrics(MonthGrid grid) {
        int scheduled=grid.workdays()*grid.rows().size();
        int worked=grid.rows().stream().mapToInt(MonthRow::workedDays).sum();
        return List.of(new Metric("Hours recorded",String.format(Locale.ROOT,"%.1f h",grid.totalHours()),"Across "+grid.rows().size()+" people","primary"),
            new Metric("Attendance",scheduled==0?"0%":String.format(Locale.ROOT,"%.0f%%",100.0*worked/scheduled),worked+" of "+scheduled+" person-days","success"),
            new Metric("Leave days",String.valueOf(grid.totalLeave()),"Approved in month","info"),
            new Metric("Exceptions",String.valueOf(grid.totalExceptions()),"Require review","warning"));
    }

    public List<LeaveRequest> leaveRequests() { return List.of(
        new LeaveRequest("LV-2408","Mia Kovač","Operations","Annual leave","2026-10-12","2026-10-16",5,"Pending","warning","Noah Petrović","Family holiday"),
        new LeaveRequest("LV-2409","Noah Petrović","Operations","Annual leave","2026-10-26","2026-10-27",2,"Pending","warning","Sara Novak","Short break"),
        new LeaveRequest("LV-2410","Sara Novak","Operations","Personal day","2026-10-09","2026-10-09",1,"Approved","success","Leo Marić","Personal appointment"),
        new LeaveRequest("LV-2411","Leo Marić","Operations","Annual leave","2026-11-02","2026-11-06",5,"Pending","warning","Ana Marić","Travel"),
        new LeaveRequest("LV-2412","Iva Kovač","Product","Annual leave","2026-10-19","2026-10-23",5,"Pending","warning","Ema Vuković","Holiday"),
        new LeaveRequest("LV-2413","Nina Perić","Support","Annual leave","2026-10-05","2026-10-07",3,"Approved","success","Tomislav Barić","Family time")
    ); }

    public List<Holiday> holidays() { return List.of(
        new Holiday("2026-09-18","Company Recharge Day","Company-wide closure","All teams","secondary"),
        new Holiday("2026-10-12","Autumn Regional Day","Example regional calendar","Central region","info"),
        new Holiday("2026-11-05","Community Service Day","Optional company observance","All teams","primary"),
        new Holiday("2026-12-24","Winter Closure Eve","Company-wide closure","All teams","secondary"),
        new Holiday("2026-12-31","Year-end Closure","Company-wide closure","All teams","secondary")
    ); }

    public List<Shift> shifts(String team, LocalDate weekStart) {
        List<Employee> staff=employees(team); List<Shift> shifts=new ArrayList<>();
        for(int d=0;d<7;d++) {
            LocalDate date=weekStart.plusDays(d);
            if(d>=5) { shifts.add(new Shift(date.toString(),date.format(DAY_FORMAT),"On-call rotation",staff.get(d%staff.size()).name(),"10:00","16:00","Standby","warning")); continue; }
            shifts.add(new Shift(date.toString(),date.format(DAY_FORMAT),"Early coverage",staff.get(d%staff.size()).name(),"07:00","15:00","Confirmed","success"));
            shifts.add(new Shift(date.toString(),date.format(DAY_FORMAT),"Core coverage",staff.get((d+2)%staff.size()).name(),"09:00","17:00","Confirmed","success"));
            shifts.add(new Shift(date.toString(),date.format(DAY_FORMAT),"Late coverage",staff.get((d+4)%staff.size()).name(),"12:00","20:00",d==3?"Open slot":"Confirmed",d==3?"error":"success"));
        }
        return List.copyOf(shifts);
    }

    public LocalDate week(String raw) {
        try { LocalDate date=LocalDate.parse(raw); return date.with(DayOfWeek.MONDAY); }
        catch(RuntimeException ignored) { return LocalDate.of(2026,9,28); }
    }

    public List<ExceptionItem> exceptions() { return List.of(
        new ExceptionItem("EX-184","Leo Marić","Operations","2026-09-14","Missing clock-out","Critical","error","No end punch after shift handover","Open"),
        new ExceptionItem("EX-185","Noah Petrović","Operations","2026-09-22","Late arrival","Medium","warning","Clock-in 60 minutes after start","Open"),
        new ExceptionItem("EX-186","Sara Novak","Operations","2026-09-25","Overtime threshold","Medium","warning","9.5 hours recorded against 8-hour plan","Investigating"),
        new ExceptionItem("EX-187","Iva Kovač","Product","2026-09-16","Unplanned absence","High","error","No clocking or leave request found","Open"),
        new ExceptionItem("EX-188","Nina Perić","Support","2026-09-21","Short break","Low","info","Break was 15 minutes below policy","Resolved"),
        new ExceptionItem("EX-189","Mia Kovač","Operations","2026-09-24","Overtime threshold","Low","info","Team lead review recommended","Open")
    ); }

    public List<ApprovalItem> approvals() { return List.of(
        new ApprovalItem("AP-301","Leave","Mia Kovač","Operations","12–16 Oct","5 days","Noah available as cover","Pending","warning"),
        new ApprovalItem("AP-302","Clock correction","Leo Marić","Operations","14 Sep","Missing clock-out","Evidence: shift handover note","Pending","error"),
        new ApprovalItem("AP-303","Overtime","Sara Novak","Operations","25 Sep","1.5 hours","Project launch support","Pending","warning"),
        new ApprovalItem("AP-304","Leave","Iva Kovač","Product","19–23 Oct","5 days","One team overlap","Pending","warning"),
        new ApprovalItem("AP-305","Shift swap","Nina Perić","Support","30 Sep","Late → Early","Tomislav confirms cover","Approved","success")
    ); }

    public record Employee(String id,String name,String team,String role,String initials,String tone,int weeklyHours) {
        public String getId(){return id;} public String getName(){return name;} public String getTeam(){return team;}
        public String getRole(){return role;} public String getInitials(){return initials;} public String getTone(){return tone;}
        public int getWeeklyHours(){return weeklyHours;}
    }
    public record DayHeader(String date,String day,String weekday,boolean weekend,boolean holiday) {
        public String getDate(){return date;} public String getDay(){return day;} public String getWeekday(){return weekday;}
        public boolean isWeekend(){return weekend;} public boolean isHoliday(){return holiday;}
    }
    public record DayCell(String code,String display,double hours,String label,String tone,boolean exception) {
        public String getCode(){return code;} public String getDisplay(){return display;} public double getHours(){return hours;}
        public String getLabel(){return label;} public String getTone(){return tone;} public boolean isException(){return exception;}
    }
    public record MonthRow(Employee employee,List<DayCell> cells,double totalHours,int workedDays,int leaveDays,int exceptions) {
        public Employee getEmployee(){return employee;} public List<DayCell> getCells(){return cells;} public double getTotalHours(){return totalHours;}
        public int getWorkedDays(){return workedDays;} public int getLeaveDays(){return leaveDays;} public int getExceptions(){return exceptions;}
    }
    public record DailyTotal(DayHeader day,double hours,int present) {
        public DayHeader getDay(){return day;} public double getHours(){return hours;} public int getPresent(){return present;}
    }
    public record MonthGrid(String team,String period,String label,List<DayHeader> days,List<MonthRow> rows,List<DailyTotal> totals,
                            double totalHours,int workdays,int totalLeave,int totalExceptions) {
        public String getTeam(){return team;} public String getPeriod(){return period;} public String getLabel(){return label;}
        public List<DayHeader> getDays(){return days;} public List<MonthRow> getRows(){return rows;} public List<DailyTotal> getTotals(){return totals;}
        public double getTotalHours(){return totalHours;} public int getWorkdays(){return workdays;}
        public int getTotalLeave(){return totalLeave;} public int getTotalExceptions(){return totalExceptions;}
    }
    public record Clocking(String date,String day,String start,String end,String breakLength,double hours,String code,String label,String tone) {
        public String getDate(){return date;} public String getDay(){return day;} public String getStart(){return start;}
        public String getEnd(){return end;} public String getBreakLength(){return breakLength;} public double getHours(){return hours;}
        public String getCode(){return code;} public String getLabel(){return label;} public String getTone(){return tone;}
    }
    public record LeaveRequest(String id,String employee,String team,String type,String from,String to,int days,String status,String tone,String cover,String note) {
        public String getId(){return id;} public String getEmployee(){return employee;} public String getTeam(){return team;}
        public String getType(){return type;} public String getFrom(){return from;} public String getTo(){return to;}
        public int getDays(){return days;} public String getStatus(){return status;} public String getTone(){return tone;}
        public String getCover(){return cover;} public String getNote(){return note;}
    }
    public record Holiday(String date,String title,String type,String region,String tone) {
        public String getDate(){return date;} public String getTitle(){return title;} public String getType(){return type;}
        public String getRegion(){return region;} public String getTone(){return tone;}
    }
    public record Shift(String date,String day,String label,String employee,String start,String end,String status,String tone) {
        public String getDate(){return date;} public String getDay(){return day;} public String getLabel(){return label;}
        public String getEmployee(){return employee;} public String getStart(){return start;} public String getEnd(){return end;}
        public String getStatus(){return status;} public String getTone(){return tone;}
    }
    public record ExceptionItem(String id,String employee,String team,String date,String type,String severity,String tone,String detail,String status) {
        public String getId(){return id;} public String getEmployee(){return employee;} public String getTeam(){return team;}
        public String getDate(){return date;} public String getType(){return type;} public String getSeverity(){return severity;}
        public String getTone(){return tone;} public String getDetail(){return detail;} public String getStatus(){return status;}
    }
    public record ApprovalItem(String id,String type,String employee,String team,String when,String amount,String context,String status,String tone) {
        public String getId(){return id;} public String getType(){return type;} public String getEmployee(){return employee;}
        public String getTeam(){return team;} public String getWhen(){return when;} public String getAmount(){return amount;}
        public String getContext(){return context;} public String getStatus(){return status;} public String getTone(){return tone;}
    }
}
