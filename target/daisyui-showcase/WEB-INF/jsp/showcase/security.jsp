<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">INCIDENT DETAIL</span>
      <h2>Unusual privileged sign-in</h2>
      <div class="component-row">
        <span class="badge badge-error">HIGH severity</span>
        <span class="badge badge-warning">Investigating</span>
        <span class="badge badge-outline">IAM</span>
      </div>
      <p>
        A privileged identity signed in from an unfamiliar location. The session was challenged and is under analyst review.
      </p>
      <div class="alert alert-error">⚠ High severity · 1 affected identity · 2 related assets.</div>
      <button class="btn btn-primary btn-sm" data-toast="Investigation opened in demo">Open investigation</button>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">DETECTION TIMELINE</span>
      <h2>From signal to response</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Challenge applied</strong><small>10:18 · Identity control</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Analyst notified</strong><small>10:16 · Security operations</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Sign-in detected</strong><small>10:14 · IAM monitoring</small></div>
        </li>
      </ul>
      <div class="progress-label"><span>Security controls operational</span><strong>96%</strong></div>
      <progress class="progress progress-success" value="96" max="100"></progress>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
