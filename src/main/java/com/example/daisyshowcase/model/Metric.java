package com.example.daisyshowcase.model;

public record Metric(String label, String value, String change, String tone) {
    public String getLabel() { return label; }
    public String getValue() { return value; }
    public String getChange() { return change; }
    public String getTone() { return tone; }
}
