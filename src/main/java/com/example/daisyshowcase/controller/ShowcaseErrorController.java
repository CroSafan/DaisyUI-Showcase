package com.example.daisyshowcase.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowcaseErrorController implements ErrorController {
    @RequestMapping("/error")
    public String error(HttpServletRequest request, HttpServletResponse response, Model model) {
        Object value = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        int status = value instanceof Number number ? number.intValue() : 404;
        if (status < 400 || status > 599) {
            status = 500;
        }

        Object requestedUri = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
        String path = requestedUri instanceof String uri && !uri.isBlank() ? uri : request.getRequestURI();
        if (path.length() > 180) {
            path = path.substring(0, 177) + "…";
        }

        String category = status == 404 ? "notFound" : status == 403 ? "forbidden" : status >= 500 ? "server" : "other";
        model.addAttribute("errorStatus", status);
        model.addAttribute("errorCategory", category);
        model.addAttribute("errorPath", path);
        response.setStatus(status);
        return "error";
    }
}
