<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<spring:message code="ui.058" var="msg_ui_058"/>
<div class="time-summary-hero">
  <section class="time-hero-panel">
    <span class="eyebrow"><spring:message code="ui.637"/></span>
    <h2><spring:message code="ui.048"/></h2>
    <p>
      <spring:message code="ui.1070"/>
    </p>
    <div class="component-row">
      <a class="btn btn-neutral btn-sm" href="${pageContext.request.contextPath}/time/department?month=${period}&amp;team=${team}">
        <spring:message code="ui.1071"/>
      </a>
      <a class="btn btn-outline btn-sm" href="${pageContext.request.contextPath}/time/exceptions"><spring:message code="ui.052"/></a>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.053"/></span>
        <h2><spring:message code="${messageCodes[team]}" text="${team}" htmlEscape="true"/> <spring:message code="ui.1072"/></h2>
      </div>
      <span class="badge badge-success"><spring:message code="ui.054"/></span>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small><spring:message code="ui.055"/></small><strong>${grid.rows.size()}</strong></div>
        <div class="time-kpi"><small><spring:message code="ui.056"/></small><strong>${grid.workdays}</strong></div>
        <div class="time-kpi"><small><spring:message code="ui.057"/></small><strong>${grid.totalHours}</strong></div>
      </div>
      <div class="divider"></div>
      <div class="time-status-line">
        <span><spring:message code="ui.058"/></span>
        <strong>${grid.totalExceptions == 0 ? 'Ready' : 'Review needed'}</strong>
      </div>
      <progress class="progress progress-primary" value="${grid.totalExceptions == 0 ? 100 : 86}" max="100" aria-label="${msg_ui_058}">
      </progress>
      <p class="time-small">
        <spring:message code="ui.1073"/>
      </p>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.061"/></span>
        <h2><spring:message code="ui.062"/></h2>
      </div>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/approvals"><spring:message code="ui.1074"/></a>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.1075"/></strong><small><spring:message code="ui.1076"/></small></li>
        <li><strong><spring:message code="ui.1077"/></strong><small><spring:message code="ui.1078"/></small></li>
        <li><strong><spring:message code="ui.1079"/></strong><small><spring:message code="ui.1080"/></small></li>
        <li><strong><spring:message code="ui.1081"/></strong><small><spring:message code="ui.1082"/></small></li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.070"/></span>
        <h2><spring:message code="ui.071"/></h2>
      </div>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/leave"><spring:message code="ui.1083"/></a>
    </div>
    <div class="time-panel-body">
      <div class="holiday-list">
        <div class="holiday-item">
          <span class="holiday-date">09<br><spring:message code="ui.679"/></span>
          <span><strong>Sara Novak</strong><small><spring:message code="ui.1084"/></small></span>
          <span class="badge badge-success badge-soft"><spring:message code="ui.666"/></span>
        </div>
        <div class="holiday-item">
          <span class="holiday-date">12<br><spring:message code="ui.679"/></span>
          <span><strong>Mia Kovač</strong><small><spring:message code="ui.1085"/></small></span>
          <span class="badge badge-warning badge-soft"><spring:message code="ui.076"/></span>
        </div>
        <div class="holiday-item">
          <span class="holiday-date">26<br><spring:message code="ui.679"/></span>
          <span><strong>Noah Petrović</strong><small><spring:message code="ui.1086"/></small></span>
          <span class="badge badge-warning badge-soft"><spring:message code="ui.076"/></span>
        </div>
      </div>
    </div>
  </section>
</div>
<section class="time-section">
  <div class="section-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.640"/></span>
      <h2><spring:message code="ui.641"/></h2>
    </div>
  </div>
  <div class="time-link-grid">
    <c:forEach items="${timeNavigation}" var="item">
      <c:if test="${item.slug ne 'overview'}">
        <a class="time-link-card" href="${pageContext.request.contextPath}${item.path}">
          <strong><span aria-hidden="true">${item.icon}</span> <spring:message code="${messageCodes[item.title]}" text="${item.title}" htmlEscape="true"/></strong>
          <small><spring:message code="${messageCodes[item.description]}" text="${item.description}" htmlEscape="true"/></small>
          <span class="arrow"><spring:message code="ui.838"/></span>
        </a>
      </c:if>
    </c:forEach>
  </div>
</section>
<%@ include file="../fragments/foot.jspf" %>
