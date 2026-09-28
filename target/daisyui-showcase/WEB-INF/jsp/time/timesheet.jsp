<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">EMPLOYEE VIEW</span>
        <h2><c:out value="${person.name}"/></h2>
      </div>
      <span class="badge badge-primary badge-soft"><c:out value="${person.role}"/></span>
    </div>
    <div class="time-panel-body">
      <div class="time-person">
        <span class="avatar-circle"><c:out value="${person.initials}"/></span>
        <span>
          <strong><c:out value="${person.name}"/></strong>
          <small><c:out value="${person.id}"/> · <c:out value="${person.team}"/> · ${person.weeklyHours}h/week</small>
        </span>
      </div>
      <div class="divider"></div>
      <form method="get" action="${pageContext.request.contextPath}/time/timesheet" class="component-row">
        <input type="hidden" name="month" value="${period}">
        <label class="sr-only" for="sheet-employee">Employee</label>
        <select id="sheet-employee" class="select select-bordered select-sm" name="employee">
          <c:forEach items="${employees}" var="option">
            <option value="${option.id}" ${person.id eq option.id ? 'selected' : ''}><c:out value="${option.name}"/></option>
          </c:forEach>
        </select>
        <button class="btn btn-primary btn-sm">View employee</button>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">TIMESHEET STATUS</span>
        <h2>Ready for review</h2>
      </div>
      <span class="badge badge-warning">1 correction example</span>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small>Contract</small><strong>${person.weeklyHours} h</strong></div>
        <div class="time-kpi"><small>Period</small><strong>${grid.workdays} d</strong></div>
        <div class="time-kpi"><small>Entries</small><strong>${clockings.size()}</strong></div>
      </div>
      <p class="time-small">Paid hours exclude breaks. PTO and company holidays are shown separately from worked time.</p>
    </div>
  </section>
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker">DAILY LEDGER</span>
      <h2>Clockings for <c:out value="${periodLabel}"/></h2>
    </div>
    <span class="badge badge-outline">Full month</span>
  </div>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col">Day</th>
          <th scope="col">In</th>
          <th scope="col">Out</th>
          <th scope="col">Break</th>
          <th scope="col">Paid hours</th>
          <th scope="col">State</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${clockings}" var="entry">
          <tr>
            <td><strong><c:out value="${entry.day}"/></strong><small><c:out value="${entry.date}"/></small></td>
            <td class="mono"><c:out value="${entry.start}"/></td>
            <td class="mono"><c:out value="${entry.end}"/></td>
            <td><c:out value="${entry.breakLength}"/></td>
            <td class="mono">${entry.hours}</td>
            <td><span class="badge badge-${entry.tone} badge-soft"><c:out value="${entry.label}"/></span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">SELF-SERVICE CORRECTION</span>
        <h2>Request a clocking fix</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <form class="time-form" method="post" action="${pageContext.request.contextPath}/time/timesheet/correction">
        <label>Date<input class="input input-bordered" type="date" name="date" required></label>
        <label>
          Reason
          <input class="input input-bordered" type="text" name="reason" maxlength="300" placeholder="Missing clock-out" required>
        </label>
        <label>Corrected start<input class="input input-bordered" type="time" name="start" required></label>
        <label>Corrected end<input class="input input-bordered" type="time" name="end" required></label>
        <div class="form-actions">
          <button class="btn btn-primary btn-sm">Submit correction</button>
          <small>A manager reviews changes before payroll.</small>
        </div>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">REQUEST HISTORY</span>
        <h2>Corrections in this session</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <c:choose>
        <c:when test="${empty corrections}">
          <div class="alert alert-info">No correction requests in this session.</div>
        </c:when>
        <c:otherwise>
          <ul class="time-insight-list">
            <c:forEach items="${corrections}" var="item">
              <li>
                <strong><c:out value="${item.date}"/> · <c:out value="${item.start}"/>–<c:out value="${item.end}"/></strong>
                <small><c:out value="${item.reason}"/> · <c:out value="${item.status}"/></small>
              </li>
            </c:forEach>
          </ul>
        </c:otherwise>
      </c:choose>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/approvals">How approvals work ↗</a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
