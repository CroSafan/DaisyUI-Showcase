<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">CAPACITY</span>
      <h2>Resource utilization</h2>
      <div class="component-stack">
        <div>
          <div class="progress-label"><span>CPU · 43%</span><strong>Healthy</strong></div>
          <progress class="progress progress-success" value="43" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span>Memory · 68%</span><strong>Watch</strong></div>
          <progress class="progress progress-warning" value="68" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span>Storage · 57%</span><strong>Healthy</strong></div>
          <progress class="progress progress-info" value="57" max="100"></progress>
        </div>
      </div>
      <div class="component-row">
        <span class="badge badge-success">Production healthy</span>
        <span class="badge badge-info">Staging deploying</span>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">RECENT DEPLOYMENTS</span>
      <h2>Release activity</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>api-gateway v2.8.4</strong><small>Production · Healthy · 18m ago</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>search-index v1.12.0</strong><small>Staging · Deploying · 42m ago</small></div>
        </li>
      </ul>
      <span class="section-kicker">LOG PREVIEW</span>
      <div class="code-preview">
        09:42:18 INFO healthcheck passed · api-gateway
09:41:56 INFO 12 instances ready · eu-central
09:40:22 WARN retrying index sync · staging
      </div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
