package com.example.daisyshowcase.controller;

import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@RestController
public class MessageCatalogController {
    private final MessageSource messages;
    public MessageCatalogController(MessageSource messages) { this.messages = messages; }

    @GetMapping("/i18n/catalog")
    public List<Translation> catalog(@RequestParam(defaultValue = "hr") String lang) {
        Locale locale = "en".equalsIgnoreCase(lang) ? Locale.ENGLISH : Locale.forLanguageTag("hr");
        int count = Integer.parseInt(messages.getMessage("ui.count", null, Locale.ENGLISH));
        List<Translation> result = new ArrayList<>(count);
        for (int i = 1; i <= count; i++) {
            String id = String.format(Locale.ROOT, "ui.%03d", i);
            result.add(new Translation(messages.getMessage(id, null, Locale.ENGLISH),
                messages.getMessage(id, null, locale)));
        }
        return result;
    }

    public record Translation(String source, String target) { }
}
