<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">DAILY SCHEDULE</span>
      <h2>Appointment flow</h2>
      <div class="timeline-track">
        <div class="timeline-step"><span></span><strong>09:30</strong><small>Checked in</small></div>
        <div class="timeline-step"><span></span><strong>10:00</strong><small>Waiting</small></div>
        <div class="timeline-step pending"><span></span><strong>10:30</strong><small>Scheduled</small></div>
        <div class="timeline-step pending"><span></span><strong>11:00</strong><small>Scheduled</small></div>
      </div>
      <div class="alert alert-info">ⓘ Fictional patients and appointments for UI demonstration only.</div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">RESOURCE CAPACITY</span>
      <h2>Departments and rooms</h2>
      <div class="component-stack">
        <div>
          <div class="progress-label"><span>General care</span><strong>8 / 12 rooms</strong></div>
          <progress class="progress progress-primary" value="67" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span>Imaging</span><strong>4 / 6 rooms</strong></div>
          <progress class="progress progress-info" value="67" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span>Cardiology</span><strong>3 / 4 rooms</strong></div>
          <progress class="progress progress-warning" value="75" max="100"></progress>
        </div>
      </div>
      <span class="badge badge-success">38 staff on duty</span>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
