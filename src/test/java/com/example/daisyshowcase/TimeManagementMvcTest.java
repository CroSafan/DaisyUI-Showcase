package com.example.daisyshowcase;

import com.example.daisyshowcase.service.ShowcaseService;
import com.example.daisyshowcase.service.TimeManagementService;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;

import java.time.YearMonth;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class TimeManagementMvcTest {
    @Autowired MockMvc mvc;
    @Autowired ShowcaseService showcase;
    @Autowired TimeManagementService time;

    @Test void allTenPagesResolveWithNavigationAndSharedData() throws Exception {
        assertThat(showcase.pages().stream().filter(p->p.category().equals("Time management"))).hasSize(10);
        for (String slug : "overview access timesheet department schedules leave holidays approvals exceptions reports".split(" ")) {
            mvc.perform(get("/time/"+slug))
                .andExpect(status().isOk()).andExpect(view().name("time/"+slug))
                .andExpect(model().attributeExists("navigation","timeNavigation","current","grid","timeMetrics"));
        }
        mvc.perform(get("/time/access;jsessionid=demo"))
            .andExpect(status().isOk()).andExpect(view().name("time/access"));
    }

    @Test void monthGridReconcilesEmployeeAndDailyTotals() {
        var grid=time.grid("Operations",YearMonth.of(2026,9));
        assertThat(grid.days()).hasSize(30);
        assertThat(grid.rows()).hasSize(6);
        assertThat(grid.rows().stream().mapToDouble(TimeManagementService.MonthRow::totalHours).sum()).isEqualTo(grid.totalHours());
        assertThat(grid.totals().stream().mapToDouble(TimeManagementService.DailyTotal::hours).sum()).isEqualTo(grid.totalHours());
        assertThat(grid.days().get(17).holiday()).isTrue();
    }

    @Test void clockSequenceAndLeaveRequestWorkWithinSession() throws Exception {
        MockHttpSession session=new MockHttpSession();
        mvc.perform(post("/time/access/clock").session(session).param("action","in"))
            .andExpect(status().is3xxRedirection());
        assertThat(session.getAttribute("clockStatus")).isEqualTo("WORKING");
        mvc.perform(post("/time/access/clock").session(session).param("action","break"))
            .andExpect(status().is3xxRedirection());
        assertThat(session.getAttribute("clockStatus")).isEqualTo("BREAK");
        mvc.perform(post("/time/access/clock").session(session).param("action","resume"))
            .andExpect(status().is3xxRedirection());
        mvc.perform(post("/time/access/clock").session(session).param("action","out"))
            .andExpect(status().is3xxRedirection());
        assertThat(session.getAttribute("clockStatus")).isEqualTo("OUT");
        mvc.perform(post("/time/leave/request").session(session).param("type","Annual leave")
                .param("from","2026-10-12").param("to","2026-10-16").param("note","Handover ready"))
            .andExpect(status().is3xxRedirection());
        assertThat(session.getAttribute("leaveRequests")).asList().hasSize(1);
        mvc.perform(post("/time/approvals/decision").session(session).param("id","LV-DEMO-1").param("decision","Approved"))
            .andExpect(status().is3xxRedirection());
        var result=mvc.perform(get("/time/leave").session(session)).andExpect(model().attributeExists("leaveRequests")).andReturn();
        @SuppressWarnings("unchecked") var requests=(java.util.List<TimeManagementService.LeaveRequest>)result.getModelAndView().getModel().get("leaveRequests");
        assertThat(requests).filteredOn(r -> r.id().equals("LV-DEMO-1"))
            .extracting(TimeManagementService.LeaveRequest::status).containsExactly("Approved");
        mvc.perform(post("/time/leave/request").session(session).param("type","Annual leave")
                .param("from","2026-10-16").param("to","2026-10-12").param("note","Invalid"))
            .andExpect(flash().attributeExists("error"));
    }

    @Test void approvalAndExportWork() throws Exception {
        MockHttpSession session=new MockHttpSession();
        mvc.perform(post("/time/approvals/decision").session(session).param("id","AP-301").param("decision","Approved"))
            .andExpect(status().is3xxRedirection());
        mvc.perform(get("/time/approvals").session(session)).andExpect(model().attributeExists("approvals"));
        mvc.perform(get("/time/department/export").param("team","Operations").param("month","2026-09"))
            .andExpect(status().isOk()).andExpect(header().string("Content-Type","text/csv;charset=UTF-8"))
            .andExpect(content().string(org.hamcrest.Matchers.containsString("Mia Kovač")));
    }
}
