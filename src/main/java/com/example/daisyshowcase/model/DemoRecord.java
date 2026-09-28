package com.example.daisyshowcase.model;

public record DemoRecord(String id, String name, String detail, String owner, String status, String tone, String value) {
    public String getId() { return id; }
    public String getName() { return name; }
    public String getDetail() { return detail; }
    public String getOwner() { return owner; }
    public String getStatus() { return status; }
    public String getTone() { return tone; }
    public String getValue() { return value; }
}
