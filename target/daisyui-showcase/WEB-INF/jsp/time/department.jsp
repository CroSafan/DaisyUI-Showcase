<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<section class="time-panel">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker">DAY-BY-DAY DEPARTMENT LEDGER</span>
      <h2><c:out value="${team}"/> · <c:out value="${periodLabel}"/></h2>
    </div>
    <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/department/export?month=${period}&amp;team=${team}">
      Export CSV ↓
    </a>
  </div>
  <div class="matrix-legend">
    <span><i></i> P = paid leave</span>
    <span><i class="hol"></i> H = company holiday</span>
    <span><i class="ot"></i> Overtime</span>
    <span><i class="ex"></i> Exception</span>
    <span>— = weekend / no hours</span>
  </div>
  <div class="month-matrix-wrap" role="region" aria-label="Scrollable monthly clocking matrix" tabindex="0">
    <table class="month-matrix">
      <thead>
        <tr>
          <th scope="col" class="person-col">Employee</th>
          <c:forEach items="${grid.days}" var="day">
            <th scope="col" class="${day.weekend ? 'off-day' : ''}" title="${day.date}">${day.weekday}<br>${day.day}</th>
          </c:forEach>
          <th scope="col" class="total-col">Total h</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${grid.rows}" var="row">
          <tr>
            <th scope="row" class="person-col">
              <strong><c:out value="${row.employee.name}"/></strong>
              <small><c:out value="${row.employee.role}"/></small>
            </th>
            <c:forEach items="${row.cells}" var="cell">
              <td class="cell-${cell.code} ${cell.code eq 'OFF' ? 'off-day' : ''}" title="${cell.label} · ${cell.hours} hours" aria-label="${cell.label}, ${cell.hours} hours">
                <c:out value="${cell.display}"/>
              </td>
            </c:forEach>
            <td class="total-col">${row.totalHours}</td>
          </tr>
        </c:forEach>
        <tr class="daily-total">
          <th scope="row" class="person-col">Department total<small>Paid hours each day</small></th>
          <c:forEach items="${grid.totals}" var="total">
            <td title="${total.present} present">${total.hours == 0 ? '—' : total.hours}</td>
          </c:forEach>
          <td class="total-col">${grid.totalHours}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="pagination-wrap">
    <span>${grid.rows.size()} employees · ${grid.days.size()} calendar days · ${grid.workdays} workdays</span>
    <span>Scroll table sideways to inspect every day →</span>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">RECONCILIATION</span>
        <h2>Employee month totals</h2>
      </div>
    </div>
    <div class="table-wrap">
      <table class="table">
        <thead>
          <tr>
            <th>Employee</th>
            <th>Worked days</th>
            <th>Paid leave</th>
            <th>Exceptions</th>
            <th>Hours</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${grid.rows}" var="row">
            <tr>
              <td><strong><c:out value="${row.employee.name}"/></strong></td>
              <td>${row.workedDays}</td>
              <td>${row.leaveDays}</td>
              <td>
                <span class="badge ${row.exceptions gt 0 ? 'badge-error' : 'badge-success'} badge-soft">${row.exceptions}</span>
              </td>
              <td class="mono">${row.totalHours}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">HOW TO READ IT</span>
        <h2>From clocking to payroll</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span>
            <strong>Capture daily punches</strong>
            <small>Access events and shift schedules create the source record.</small>
          </span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong>Reconcile exceptions</strong><small>Missing and late punches are flagged in the grid.</small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span>
            <strong>Confirm leave and holidays</strong>
            <small>Absence days remain visible without inflating worked hours.</small>
          </span>
        </li>
        <li>
          <span class="marker">4</span>
          <span><strong>Export for review</strong><small>CSV uses the exact totals shown in the table.</small></span>
        </li>
      </ul>
      <div class="alert alert-info">
        ⓘ All totals are calculated from the same fictional daily entries used by the timesheet and reports.
      </div>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
