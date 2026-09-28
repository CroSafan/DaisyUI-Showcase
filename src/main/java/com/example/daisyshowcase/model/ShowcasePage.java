package com.example.daisyshowcase.model;

public record ShowcasePage(String slug, String title, String category, String eyebrow, String description, String icon) {
    public String getSlug() { return slug; }
    public String getTitle() { return title; }
    public String getCategory() { return category; }
    public String getEyebrow() { return eyebrow; }
    public String getDescription() { return description; }
    public String getIcon() { return icon; }
    public String getPath() { return category.equals("Time management") ? "/time/" + (slug.equals("approvals-time") ? "approvals" : slug) : "/showcase/" + slug; }
}
