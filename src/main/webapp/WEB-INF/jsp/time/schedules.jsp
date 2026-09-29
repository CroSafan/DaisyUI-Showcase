<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="time-filter">
  <div class="time-filter-left">
    <span class="section-kicker"><spring:message code="ui.1101"/></span>
    <strong>${weekStart} → ${weekEnd}</strong>
    <span class="badge badge-ghost"><spring:message code="${messageCodes[team]}" text="${team}" htmlEscape="true"/></span>
  </div>
  <form class="time-filter-actions" method="get" action="${pageContext.request.contextPath}/time/schedules">
    <label class="sr-only" for="schedule-week"><spring:message code="ui.577"/></label>
    <input id="schedule-week" class="input input-bordered input-sm" type="date" name="week" value="${weekStart}">
    <label class="sr-only" for="schedule-team"><spring:message code="ui.089"/></label>
    <select id="schedule-team" class="select select-bordered select-sm" name="team">
      <c:forEach items="${teams}" var="option">
        <option value="${option}" ${team eq option ? 'selected' : ''}>${option}</option>
      </c:forEach>
    </select>
    <button class="btn btn-primary btn-sm"><spring:message code="ui.079"/></button>
  </form>
</div>
<div class="metric-grid">
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.578"/></span>
      <strong class="metric-value">${shifts.size()}</strong>
      <span class="badge badge-info badge-soft"><spring:message code="ui.579"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.580"/></span>
      <strong class="metric-value">100%</strong>
      <span class="badge badge-success badge-soft"><spring:message code="ui.581"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.582"/></span>
      <strong class="metric-value">1</strong>
      <span class="badge badge-error badge-soft"><spring:message code="ui.1102"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.1103"/></span>
      <strong class="metric-value">2</strong>
      <span class="badge badge-warning badge-soft"><spring:message code="ui.583"/></span>
    </div>
  </article>
</div>
<section class="time-panel">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.575"/></span>
      <h2><spring:message code="${messageCodes[team]}" text="${team}" htmlEscape="true"/> · <spring:message code="ui.1203" arguments="${weekStart}"/></h2>
    </div>
    <span class="badge badge-outline"><spring:message code="ui.1104"/></span>
  </div>
  <div class="time-panel-body">
    <div class="shift-grid">
      <c:forEach items="${weekDays}" var="day">
        <div class="shift-day">
          <strong><spring:message code="${messageCodes[day.label]}" text="${day.label}" htmlEscape="true"/></strong>
          <c:forEach items="${shifts}" var="shift">
            <c:if test="${shift.date eq day.date}">
              <div class="shift-card ${shift.status eq 'Open slot' ? 'open' : ''}">
                <small><spring:message code="${messageCodes[shift.label]}" text="${shift.label}" htmlEscape="true"/> · ${shift.start}–${shift.end}</small>
                <strong><spring:message code="${messageCodes[shift.employee]}" text="${shift.employee}" htmlEscape="true"/></strong>
                <span class="badge badge-${shift.tone} badge-soft badge-xs"><spring:message code="${messageCodes[shift.status]}" text="${shift.status}" htmlEscape="true"/></span>
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
        <span class="section-kicker"><spring:message code="ui.576"/></span>
        <h2><spring:message code="ui.584"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="alert alert-warning"><spring:message code="ui.1105"/></div>
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.175"/></strong><small><spring:message code="ui.1106"/></small></li>
        <li><strong><spring:message code="ui.1107"/></strong><small><spring:message code="ui.1108"/></small></li>
        <li><strong><spring:message code="ui.585"/></strong><small><spring:message code="ui.1109"/></small></li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1110"/></span>
        <h2><spring:message code="ui.1111"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <p>
        <spring:message code="ui.1112"/>
      </p>
      <div class="component-row">
        <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/access"><spring:message code="ui.1113"/></a>
        <a class="btn btn-outline btn-sm" href="${pageContext.request.contextPath}/time/department"><spring:message code="ui.1114"/></a>
      </div>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
