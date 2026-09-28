<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">REVENUE TREND</span>
      <h2>12-month performance</h2>
      <div class="chart" role="img" aria-label="Revenue generally rises across twelve months">
        <span style="--h:32%"></span>
        <span style="--h:38%"></span>
        <span style="--h:35%"></span>
        <span style="--h:47%"></span>
        <span style="--h:52%"></span>
        <span style="--h:49%"></span>
        <span style="--h:62%"></span>
        <span style="--h:65%"></span>
        <span style="--h:68%"></span>
        <span style="--h:76%"></span>
        <span style="--h:79%"></span>
        <span style="--h:91%"></span>
      </div>
      <div class="chart-legend"><span>OCT</span><span>JAN</span><span>APR</span><span>JUL</span><span>SEP</span></div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">ACTIVITY FEED</span>
      <h2>Recent signals</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Expansion opportunity created</strong><small>Meridian Group · 18 minutes ago</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Quarterly goal reached</strong><small>Central region · 2 hours ago</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Conversion rate improved</strong><small>Digital channel · Yesterday</small></div>
        </li>
      </ul>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
