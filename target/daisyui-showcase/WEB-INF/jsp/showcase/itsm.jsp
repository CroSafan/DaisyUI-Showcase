<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">SELECTED INCIDENT</span>
      <h2>INC-4821 · VPN access intermittent</h2>
      <div class="component-row">
        <span class="badge badge-error">P1 · Escalated</span>
        <span class="badge badge-warning">38m to SLA</span>
        <span class="badge badge-outline">Network</span>
      </div>
      <p>Users in the Zagreb office intermittently lose access after authentication. Assigned engineer: Nina Perić.</p>
      <div class="alert alert-error">⚠ Escalation warning: response target is approaching.</div>
      <label for="ticket-comment" class="field-hint">Internal comment</label>
      <textarea id="ticket-comment" class="textarea textarea-bordered" placeholder="Add an investigation note..."></textarea>
      <button class="btn btn-primary btn-sm" data-toast="Comment added in demo">Add comment</button>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">TICKET TIMELINE</span>
      <h2>Investigation history</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Escalated to network team</strong><small>09:24 · Automated SLA rule</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Nina Perić assigned</strong><small>09:12 · Service desk</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Incident created</strong><small>09:06 · Employee portal</small></div>
        </li>
      </ul>
      <div class="alert alert-success">✓ Core services remain healthy.</div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
