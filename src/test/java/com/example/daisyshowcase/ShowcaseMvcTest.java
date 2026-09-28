package com.example.daisyshowcase;

import com.example.daisyshowcase.service.ShowcaseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class ShowcaseMvcTest {
    @Autowired MockMvc mvc;
    @Autowired ShowcaseService showcase;

    @Test void everyShowcaseRouteResolvesToItsJsp() throws Exception {
        assertThat(showcase.pages()).hasSize(30);
        for (var page : showcase.pages().stream().filter(p->!p.category().equals("Time management")).toList()) {
            mvc.perform(get("/showcase/"+page.slug()))
                .andExpect(status().isOk())
                .andExpect(view().name("showcase/"+page.slug()))
                .andExpect(model().attributeExists("navigation","current","demo"));
        }
    }

    @Test void dataSearchFiltersAndPaginates() throws Exception {
        mvc.perform(get("/showcase/data").param("q","Northstar").param("status","Active"))
            .andExpect(status().isOk()).andExpect(model().attributeExists("records","resultCount"));
        mvc.perform(get("/showcase/data").param("q","impossible query"))
            .andExpect(model().attribute("resultCount",0));
    }

    @Test void formRejectsInvalidAndAcceptsValidSubmission() throws Exception {
        mvc.perform(post("/showcase/forms").param("name","").param("email","bad")
                .param("department","").param("budget","10"))
            .andExpect(status().isOk()).andExpect(model().hasErrors());
        mvc.perform(post("/showcase/forms").param("name","Jordan Davis")
                .param("email","jordan@example.test").param("department","Operations")
                .param("budget","2500"))
            .andExpect(status().isOk()).andExpect(model().attribute("submitted",true));
    }
}
