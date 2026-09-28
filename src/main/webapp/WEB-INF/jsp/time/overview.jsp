<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<div class="time-summary-hero">
  <section class="time-hero-panel">
    <span class="eyebrow">TODAY'S OPERATING PICTURE</span>
    <h2>Know where every hour goes.</h2>
    <p>
      Attendance, cover, approved absence and payroll readiness connect across all ten screens. Start with the full department clocking ledger or review the actions needing attention.
    </p>
    <div class="component-row">
      <a class="btn btn-neutral btn-sm" href="${pageContext.request.contextPath}/time/department?month=${period}&amp;team=${team}">
        Open department month ↗
      </a>
      <a class="btn btn-outline btn-sm" href="${pageContext.request.contextPath}/time/exceptions">Review exceptions</a>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">WORKFORCE READINESS</span>
        <h2><c:out value="${team}"/> at a glance</h2>
      </div>
      <span class="badge badge-success">Live scenario</span>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small>People</small><strong>${grid.rows.size()}</strong></div>
        <div class="time-kpi"><small>Workdays</small><strong>${grid.workdays}</strong></div>
        <div class="time-kpi"><small>Hours</small><strong>${grid.totalHours}</strong></div>
      </div>
      <div class="divider"></div>
      <div class="time-status-line">
        <span>Payroll readiness</span>
        <strong>${grid.totalExceptions == 0 ? 'Ready' : 'Review needed'}</strong>
      </div>
      <progress class="progress progress-primary" value="${grid.totalExceptions == 0 ? 100 : 86}" max="100" aria-label="Payroll readiness">
      </progress>
      <p class="time-small">
        Exceptions must be reconciled before final approval. The data is fictional and intentionally shows edge cases.
      </p>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">ACTIONS TO TAKE</span>
        <h2>Attention queue</h2>
      </div>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/approvals">All approvals ↗</a>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong>Missing clock-out · Leo Marić</strong><small>14 Sep · Correct before payroll close</small></li>
        <li><strong>Leave cover · Mia Kovač</strong><small>12–16 Oct · Noah is proposed as cover</small></li>
        <li><strong>Open late shift · Thursday</strong><small>Operations · Coverage gap needs an owner</small></li>
        <li><strong>Overtime review · Sara Novak</strong><small>1.5 hours · Project launch support</small></li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">TEAM ABSENCE</span>
        <h2>Upcoming time away</h2>
      </div>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/leave">Leave planner ↗</a>
    </div>
    <div class="time-panel-body">
      <div class="holiday-list">
        <div class="holiday-item">
          <span class="holiday-date">09<br>OCT</span>
          <span><strong>Sara Novak</strong><small>Personal day · Approved</small></span>
          <span class="badge badge-success badge-soft">Covered</span>
        </div>
        <div class="holiday-item">
          <span class="holiday-date">12<br>OCT</span>
          <span><strong>Mia Kovač</strong><small>Annual leave · 5 days</small></span>
          <span class="badge badge-warning badge-soft">Pending</span>
        </div>
        <div class="holiday-item">
          <span class="holiday-date">26<br>OCT</span>
          <span><strong>Noah Petrović</strong><small>Annual leave · 2 days</small></span>
          <span class="badge badge-warning badge-soft">Pending</span>
        </div>
      </div>
    </div>
  </section>
</div>
<section class="time-section">
  <div class="section-head">
    <div>
      <span class="section-kicker">FOLLOW THE WORKFLOW</span>
      <h2>Explore the connected workspaces</h2>
    </div>
  </div>
  <div class="time-link-grid">
    <c:forEach items="${timeNavigation}" var="item">
      <c:if test="${item.slug ne 'overview'}">
        <a class="time-link-card" href="${pageContext.request.contextPath}${item.path}">
          <strong><span aria-hidden="true">${item.icon}</span> <c:out value="${item.title}"/></strong>
          <small><c:out value="${item.description}"/></small>
          <span class="arrow">Open workspace ↗</span>
        </a>
      </c:if>
    </c:forEach>
  </div>
</section>
<%@ include file="../fragments/foot.jspf" %>
