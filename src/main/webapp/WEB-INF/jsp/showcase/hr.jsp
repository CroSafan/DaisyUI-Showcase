<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">EMPLOYEE SPOTLIGHT</span>
      <h2>Mia Kovač</h2>
      <p>Senior Product Designer · Zagreb office</p>
      <div class="component-row">
        <span class="avatar-circle">MK</span>
        <span class="badge badge-success">Available</span>
        <span class="badge badge-outline">Design team</span>
      </div>
      <div class="divider"></div>
      <div class="two-grid">
        <div>
          <small>LEAVE BALANCE</small>
          <strong>18 days</strong>
          <p>2 days booked this month</p>
        </div>
        <div>
          <small>PERFORMANCE</small>
          <strong>Exceeds goals</strong>
          <p>Next check-in 12 Oct</p>
        </div>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">PEOPLE CALENDAR</span>
      <h2>Coming up</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>New starter orientation</strong><small>Monday · 2 new colleagues</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Team learning day</strong><small>Wednesday · All departments</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Leave requests to review</strong><small>7 waiting · People team</small></div>
        </li>
      </ul>
      <div class="alert alert-info">ⓘ Onboarding completion: 91%</div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
