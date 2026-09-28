<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">DAILY TREND</span>
        <h2>Paid hours · <c:out value="${team}"/></h2>
      </div>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/reports/export?month=${period}&amp;team=${team}">
        Download CSV ↓
      </a>
    </div>
    <div class="time-panel-body">
      <div class="time-chart" role="img" aria-label="Daily department paid hours across the selected month">
        <c:forEach items="${grid.totals}" var="day">
          <span class="${day.day.weekend ? 'weekend' : ''}" style="--bar-height:${day.hours * 1.5}%" title="${day.day.date}: ${day.hours} hours">
          </span>
        </c:forEach>
      </div>
      <div class="chart-legend"><span>1 ${periodLabel}</span><span>Mid-month</span><span>Month end</span></div>
      <p class="time-small">Weekends and the company closure appear as zero worked hours. Hover a bar for its daily total.</p>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">CROSS-TEAM COMPARISON</span>
        <h2>Hours by department</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <c:forEach items="${allTeamGrids}" var="department">
        <div class="time-report-row">
          <strong><c:out value="${department.team}"/></strong>
          <progress class="progress progress-primary" value="${department.totalHours}" max="${department.workdays * department.rows.size() * 9}" aria-label="${department.team} hours">
          </progress>
          <strong>${department.totalHours}h</strong>
        </div>
      </c:forEach>
      <div class="divider"></div>
      <table class="time-stat-table">
        <thead>
          <tr>
            <th>Team</th>
            <th>People</th>
            <th>Leave</th>
            <th>Exceptions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${allTeamGrids}" var="department">
            <tr>
              <td><c:out value="${department.team}"/></td>
              <td>${department.rows.size()}</td>
              <td>${department.totalLeave}</td>
              <td>${department.totalExceptions}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </section>
</div>
<div class="three-grid time-section">
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">ATTENDANCE</span>
      <h3>Person-days</h3>
      <strong class="metric-value">${grid.workdays * grid.rows.size()}</strong>
      <p>Scheduled workday capacity before individual leave.</p>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">ABSENCE</span>
      <h3>Leave days</h3>
      <strong class="metric-value">${grid.totalLeave}</strong>
      <p>Approved leave is separate from worked hours.</p>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker">QUALITY</span>
      <h3>Exceptions</h3>
      <strong class="metric-value">${grid.totalExceptions}</strong>
      <p>Reconciliation cases requiring human review.</p>
    </div>
  </article>
</div>
<div class="alert alert-info time-section">
  ⓘ CSV rows reconcile to the department month totals. Figures are generated from the same deterministic clocking ledger, with no charting library.
</div>
<%@ include file="../fragments/foot.jspf" %>
