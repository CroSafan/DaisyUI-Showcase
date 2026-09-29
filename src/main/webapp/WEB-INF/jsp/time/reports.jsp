<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<spring:message code="ui.1160" var="msg_ui_1160"/>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1087"/></span>
        <h2><spring:message code="ui.1088"/> <spring:message code="${messageCodes[team]}" text="${team}" htmlEscape="true"/></h2>
      </div>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/reports/export?month=${period}&amp;team=${team}">
        <spring:message code="ui.1089"/>
      </a>
    </div>
    <div class="time-panel-body">
      <div class="time-chart" role="img" aria-label="${msg_ui_1160}">
        <c:forEach items="${grid.totals}" var="day">
          <span class="${day.day.weekend ? 'weekend' : ''}" style="--bar-height:${day.hours * 1.5}%" title="${day.day.date}: ${day.hours} hours">
          </span>
        </c:forEach>
      </div>
      <div class="chart-legend"><span>1 ${periodLabel}</span><span><spring:message code="ui.1090"/></span><span><spring:message code="ui.1091"/></span></div>
      <p class="time-small"><spring:message code="ui.1092"/></p>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1093"/></span>
        <h2><spring:message code="ui.1094"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <c:forEach items="${allTeamGrids}" var="department">
        <div class="time-report-row">
          <strong><spring:message code="${messageCodes[department.team]}" text="${department.team}" htmlEscape="true"/></strong>
          <progress class="progress progress-primary" value="${department.totalHours}" max="${department.workdays * department.rows.size() * 9}" aria-label="${department.team} hours">
          </progress>
          <strong>${department.totalHours}h</strong>
        </div>
      </c:forEach>
      <div class="divider"></div>
      <table class="time-stat-table">
        <thead>
          <tr>
            <th><spring:message code="ui.089"/></th>
            <th><spring:message code="ui.055"/></th>
            <th><spring:message code="ui.1188"/></th>
            <th><spring:message code="ui.097"/></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${allTeamGrids}" var="department">
            <tr>
              <td><spring:message code="${messageCodes[department.team]}" text="${department.team}" htmlEscape="true"/></td>
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
      <span class="section-kicker"><spring:message code="ui.633"/></span>
      <h3><spring:message code="ui.660"/></h3>
      <strong class="metric-value">${grid.workdays * grid.rows.size()}</strong>
      <p><spring:message code="ui.1095"/></p>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.1096"/></span>
      <h3><spring:message code="ui.634"/></h3>
      <strong class="metric-value">${grid.totalLeave}</strong>
      <p><spring:message code="ui.1097"/></p>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.1098"/></span>
      <h3><spring:message code="ui.097"/></h3>
      <strong class="metric-value">${grid.totalExceptions}</strong>
      <p><spring:message code="ui.1099"/></p>
    </div>
  </article>
</div>
<div class="alert alert-info time-section">
  <spring:message code="ui.1100"/>
</div>
<%@ include file="../fragments/foot.jspf" %>
