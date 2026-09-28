<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card" data-approval-row>
    <div class="card-body">
      <span class="section-kicker">REQUEST DETAIL</span>
      <h2>Network equipment purchase</h2>
      <div class="component-row">
        <span class="badge badge-error">High risk</span>
        <span class="badge badge-warning" data-approval-status>Pending review</span>
        <span class="badge badge-outline">€24,800</span>
      </div>
      <p>Requested by Nina Perić for a capacity upgrade. The amount exceeds the standard department limit.</p>
      <label for="approval-comment" class="field-hint">Reviewer comment</label>
      <textarea id="approval-comment" class="textarea textarea-bordered" placeholder="Add a decision note..."></textarea>
      <div class="component-row">
        <button class="btn btn-success btn-sm" data-approve="yes">Approve</button>
        <button class="btn btn-error btn-outline btn-sm" data-approve="no">Reject</button>
        <button class="btn btn-ghost btn-sm" data-toast="Delegation opened in demo">Delegate</button>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">APPROVAL HISTORY</span>
      <h2>Decision trail</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Finance review complete</strong><small>Today · Budget available</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Manager endorsed</strong><small>Yesterday · Operations</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Request submitted</strong><small>25 Sep · Nina Perić</small></div>
        </li>
      </ul>
      <div class="alert alert-warning">⚠ Delegation active for 4 requests this week.</div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
