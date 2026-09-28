<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">COMPANY TRAJECTORY</span>
      <h2>Revenue and momentum</h2>
      <div class="chart" role="img" aria-label="Company revenue rises through the year">
        <span style="--h:36%"></span>
        <span style="--h:39%"></span>
        <span style="--h:45%"></span>
        <span style="--h:47%"></span>
        <span style="--h:51%"></span>
        <span style="--h:54%"></span>
        <span style="--h:61%"></span>
        <span style="--h:66%"></span>
        <span style="--h:72%"></span>
        <span style="--h:75%"></span>
        <span style="--h:83%"></span>
        <span style="--h:90%"></span>
      </div>
      <div class="chart-legend"><span>Q1</span><span>Q2</span><span>Q3</span><span>Q4</span></div>
      <div class="component-row">
        <span class="badge badge-success">Sales ↑ 14.6%</span>
        <span class="badge badge-info">Customers ↑ 8.1%</span>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">EXECUTIVE BRIEFING</span>
      <h2>What needs attention</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Supply chain delivery risk</strong><small>8 shipments delayed · COO review</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Security action items</strong><small>7 critical patches · CISO update</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Strategic expansion</strong><small>€4.2M qualified pipeline · CRO</small></div>
        </li>
      </ul>
      <button class="btn btn-primary btn-sm" data-toast="Briefing opened in demo">Review action items</button>
    </div>
  </section>
</div>
<div class="three-grid section-block">
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">CUSTOMERS</span>
      <h3>Retention</h3>
      <strong class="metric-value">94.2%</strong>
      <span class="badge badge-success">Above target</span>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">PEOPLE</span>
      <h3>Engagement</h3>
      <strong class="metric-value">82%</strong>
      <span class="badge badge-info">Up 3 points</span>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">TECHNOLOGY</span>
      <h3>Service uptime</h3>
      <strong class="metric-value">99.94%</strong>
      <span class="badge badge-success">Healthy</span>
    </div>
  </article>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
