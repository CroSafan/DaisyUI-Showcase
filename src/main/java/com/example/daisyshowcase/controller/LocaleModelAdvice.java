package com.example.daisyshowcase.controller;

import com.example.daisyshowcase.service.UiMessageCodes;
import java.util.Locale;
import java.util.Map;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class LocaleModelAdvice {
    private final UiMessageCodes messageCodes;

    public LocaleModelAdvice(UiMessageCodes messageCodes) {
        this.messageCodes = messageCodes;
    }

    @ModelAttribute("currentLanguage")
    public String currentLanguage(Locale locale) {
        return "en".equals(locale.getLanguage()) ? "en" : "hr";
    }

    @ModelAttribute("messageCodes")
    public Map<String, String> messageCodes() {
        return messageCodes.byEnglishText();
    }
}
