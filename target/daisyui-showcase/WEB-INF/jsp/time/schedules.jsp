<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="time-filter">
  <div class="time-filter-left">
    <span class="section-kicker">WEEK VIEW</span>
    <strong>${weekStart} → ${weekEnd}</strong>
    <span class="badge badge-ghost"><c:out value="${team}"/></span>
  </div>
  <form class="time-filter-actions" method="get" action="${pageContext.request.contextPath}/time/schedules">
    <label class="sr-only" for="schedule-week">Week starting</label>
    <input id="schedule-week" class="input input-bordered input-sm" type="date" name="week" value="${weekStart}">
    <label class="sr-only" for="schedule-team">Team</label>
    <select id="schedule-team" class="select select-bordered select-sm" name="team">
      <c:forEach items="${teams}" var="option">
        <option value="${option}" ${team eq option ? 'selected' : ''}>${option}</option>
      </c:forEach>
    </select>
    <button class="btn btn-primary btn-sm">Apply</button>
  </form>
</div>
<div class="metric-grid">
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Assigned shifts</span>
      <strong class="metric-value">${shifts.size()}</strong>
      <span class="badge badge-info badge-soft">7-day plan</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Core coverage</span>
      <strong class="metric-value">100%</strong>
      <span class="badge badge-success badge-soft">Weekdays covered</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Open slots</span>
      <strong class="metric-value">1</strong>
      <span class="badge badge-error badge-soft">Thursday late</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">On-call</span>
      <strong class="metric-value">2</strong>
      <span class="badge badge-warning badge-soft">Weekend rotation</span>
    </div>
  </article>
</div>
<section class="time-panel">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker">COVERAGE BOARD</span>
      <h2><c:out value="${team}"/> · week of ${weekStart}</h2>
    </div>
    <span class="badge badge-outline">Early · Core · Late</span>
  </div>
  <div class="time-panel-body">
    <div class="shift-grid">
      <c:forEach items="${weekDays}" var="day">
        <div class="shift-day">
          <strong><c:out value="${day.label}"/></strong>
          <c:forEach items="${shifts}" var="shift">
            <c:if test="${shift.date eq day.date}">
              <div class="shift-card ${shift.status eq 'Open slot' ? 'open' : ''}">
                <small><c:out value="${shift.label}"/> · ${shift.start}–${shift.end}</small>
                <strong><c:out value="${shift.employee}"/></strong>
                <span class="badge badge-${shift.tone} badge-soft badge-xs"><c:out value="${shift.status}"/></span>
              </div>
            </c:if>
          </c:forEach>
        </div>
      </c:forEach>
    </div>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">COVERAGE WATCH</span>
        <h2>Planning notes</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="alert alert-warning">⚠ Thursday's late shift is open. Assign a qualified teammate before publishing.</div>
      <ul class="time-insight-list">
        <li><strong>Leave overlap</strong><small>Review upcoming leave before confirming the next week.</small></li>
        <li><strong>Weekend standby</strong><small>Two named colleagues provide limited coverage.</small></li>
        <li><strong>Shift handover</strong><small>15-minute overlap between early and core teams.</small></li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">CONNECTED WORKFLOW</span>
        <h2>Plan, work, reconcile</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <p>
        Schedules define expected hours. The time terminal captures actual punches. The department month compares both, and exceptions expose discrepancies.
      </p>
      <div class="component-row">
        <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/access">Open time access</a>
        <a class="btn btn-outline btn-sm" href="${pageContext.request.contextPath}/time/department">Compare clockings</a>
      </div>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
