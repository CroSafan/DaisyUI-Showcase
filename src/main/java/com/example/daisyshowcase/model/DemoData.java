package com.example.daisyshowcase.model;

import java.util.List;

public record DemoData(List<Metric> metrics, List<DemoRecord> records, String tableTitle, String primaryAction,
                       String insightTitle, String insightBody, int progress) {
    public List<Metric> getMetrics() { return metrics; }
    public List<DemoRecord> getRecords() { return records; }
    public String getTableTitle() { return tableTitle; }
    public String getPrimaryAction() { return primaryAction; }
    public String getInsightTitle() { return insightTitle; }
    public String getInsightBody() { return insightBody; }
    public int getProgress() { return progress; }
}
