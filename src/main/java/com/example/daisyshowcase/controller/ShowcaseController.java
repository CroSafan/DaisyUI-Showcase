package com.example.daisyshowcase.controller;

import com.example.daisyshowcase.model.IntakeForm;
import com.example.daisyshowcase.model.ShowcasePage;
import com.example.daisyshowcase.service.ShowcaseService;
import jakarta.validation.Valid;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import java.util.*;

@Controller
public class ShowcaseController {
    private final ShowcaseService showcase;
    public ShowcaseController(ShowcaseService showcase) { this.showcase=showcase; }

    @ModelAttribute("navigation") public List<ShowcasePage> navigation() { return showcase.pages(); }

    @GetMapping("/") public String home(Model model) {
        model.addAttribute("pageTitle","The enterprise UI, reimagined");
        return "index";
    }

    @GetMapping({"/showcase/components","/showcase/themes","/showcase/responsive","/showcase/forms",
        "/showcase/data","/showcase/analytics","/showcase/crm","/showcase/erp","/showcase/finance",
        "/showcase/hr","/showcase/projects","/showcase/itsm","/showcase/cloud","/showcase/security",
        "/showcase/ecommerce","/showcase/logistics","/showcase/healthcare","/showcase/saas",
        "/showcase/approvals","/showcase/executive"})
    public String page(HttpServletRequest request, Model model,
                       @RequestParam(required=false) String q, @RequestParam(required=false) String status,
                       @RequestParam(defaultValue="1") int page) {
        // A path variable is resolved from the final URI segment so every public route stays explicit.
        String path = request.getRequestURI().substring(request.getContextPath().length());
        return render(path.substring(path.lastIndexOf('/')+1), model, q, status, page);
    }

    private String render(String slug, Model model, String q, String status, int pageNumber) {
        ShowcasePage page = showcase.page(slug).orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND));
        model.addAttribute("current",page);
        model.addAttribute("demo",showcase.data(slug));
        model.addAttribute("query",q == null ? "" : q);
        model.addAttribute("filterStatus",status == null ? "all" : status);
        if (slug.equals("data")) {
            var all = java.util.stream.IntStream.rangeClosed(1,42).mapToObj(i ->
                new com.example.daisyshowcase.model.DemoRecord("REC-"+(1000+i),
                    new String[]{"Northstar account","Meridian renewal","Acme onboarding","Lumen contract","Atlas review"}[i%5],
                    new String[]{"Customer success","Sales operations","Account management"}[i%3],
                    new String[]{"Ana Marić","Mia Kovač","Leo Marić"}[i%3],
                    new String[]{"Active","Pending","Review"}[i%3],
                    new String[]{"success","warning","info"}[i%3],"€"+(1200+i*340))).toList();
            String needle = q == null ? "" : q.trim().toLowerCase(Locale.ROOT);
            String state = status == null ? "all" : status;
            var filtered = all.stream().filter(r->r.name().toLowerCase(Locale.ROOT).contains(needle) || r.id().toLowerCase(Locale.ROOT).contains(needle))
                .filter(r->state.equals("all") || r.status().equalsIgnoreCase(state)).toList();
            int totalPages = Math.max(1,(filtered.size()+9)/10);
            int safePage = Math.min(Math.max(pageNumber,1),totalPages);
            model.addAttribute("records",filtered.subList((safePage-1)*10,Math.min(safePage*10,filtered.size())));
            model.addAttribute("resultCount",filtered.size());
            model.addAttribute("pageNumber",safePage);
            model.addAttribute("totalPages",totalPages);
        }
        if (slug.equals("forms")) model.addAttribute("intakeForm",new IntakeForm());
        return "showcase/"+slug;
    }

    @PostMapping("/showcase/forms") public String submit(@Valid @ModelAttribute("intakeForm") IntakeForm form,
                                                          BindingResult errors, Model model) {
        ShowcasePage page = showcase.page("forms").orElseThrow();
        model.addAttribute("current",page);
        model.addAttribute("demo",showcase.data("forms"));
        if (!errors.hasErrors()) model.addAttribute("submitted",true);
        return "showcase/forms";
    }
}
