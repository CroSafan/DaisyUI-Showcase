package com.example.daisyshowcase.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

@Component
public class UiMessageCodes {
    private final Map<String, String> byEnglishText;

    public UiMessageCodes() throws IOException {
        Map<String, String> codes = new LinkedHashMap<>();
        ClassPathResource resource = new ClassPathResource("i18n/messages.properties");
        try (BufferedReader lines = new BufferedReader(
                new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = lines.readLine()) != null) {
                int separator = line.indexOf('=');
                if (separator < 0 || !line.startsWith("ui.") || line.startsWith("ui.count=")) {
                    continue;
                }
                codes.putIfAbsent(line.substring(separator + 1), line.substring(0, separator));
            }
        }
        byEnglishText = Map.copyOf(codes);
    }

    public Map<String, String> byEnglishText() {
        return byEnglishText;
    }
}
