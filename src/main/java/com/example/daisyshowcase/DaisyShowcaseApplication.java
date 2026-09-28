package com.example.daisyshowcase;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class DaisyShowcaseApplication extends SpringBootServletInitializer {
    public static void main(String[] args) { SpringApplication.run(DaisyShowcaseApplication.class, args); }
    @Override protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DaisyShowcaseApplication.class);
    }
}
