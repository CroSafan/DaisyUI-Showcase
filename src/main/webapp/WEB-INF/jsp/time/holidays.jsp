<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="alert alert-info">
  <spring:message code="ui.1048"/>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1049"/></span>
        <h2><spring:message code="ui.170"/></h2>
      </div>
      <span class="badge badge-outline">2026</span>
    </div>
    <div class="time-panel-body">
      <div class="holiday-list">
        <c:forEach items="${holidays}" var="item">
          <div class="holiday-item">
            <span class="holiday-date">
              <spring:message code="${messageCodes[fn:substring(item.date,5,7)]}" text="${fn:substring(item.date,5,7)}" htmlEscape="true"/>
              <br>
              <spring:message code="${messageCodes[fn:substring(item.date,8,10)]}" text="${fn:substring(item.date,8,10)}" htmlEscape="true"/>
            </span>
            <span>
              <strong><spring:message code="${messageCodes[item.title]}" text="${item.title}" htmlEscape="true"/></strong>
              <small><spring:message code="${messageCodes[item.type]}" text="${item.type}" htmlEscape="true"/> · <spring:message code="${messageCodes[item.date]}" text="${item.date}" htmlEscape="true"/></small>
            </span>
            <span class="badge badge-${item.tone} badge-soft"><spring:message code="${messageCodes[item.region]}" text="${item.region}" htmlEscape="true"/></span>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.171"/></span>
        <h2><spring:message code="ui.172"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-status-line"><span><spring:message code="ui.565"/></span><strong><spring:message code="ui.1050"/></strong></div>
      <div class="time-status-line" style="margin-top:.5rem"><span><spring:message code="ui.566"/></span><strong><spring:message code="ui.569"/></strong></div>
      <div class="time-status-line" style="margin-top:.5rem">
        <span><spring:message code="ui.567"/></span>
        <strong><spring:message code="ui.1051"/></strong>
      </div>
      <div class="divider"></div>
      <h3><spring:message code="ui.1052"/></h3>
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.173"/></strong><small><spring:message code="ui.174"/></small></li>
        <li><strong><spring:message code="ui.175"/></strong><small><spring:message code="ui.176"/></small></li>
        <li><strong><spring:message code="ui.177"/></strong><small><spring:message code="ui.178"/></small></li>
      </ul>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.179"/></span>
        <h2><spring:message code="ui.180"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <table class="time-stat-table">
        <thead>
          <tr>
            <th><spring:message code="ui.1053"/></th>
            <th><spring:message code="ui.181"/></th>
            <th><spring:message code="ui.1054"/></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><spring:message code="ui.073"/></td>
            <td><spring:message code="ui.1055"/></td>
            <td><spring:message code="ui.557"/></td>
          </tr>
          <tr>
            <td><spring:message code="ui.074"/></td>
            <td><spring:message code="ui.1056"/></td>
            <td><spring:message code="ui.557"/></td>
          </tr>
          <tr>
            <td><spring:message code="ui.182"/></td>
            <td><spring:message code="ui.183"/></td>
            <td><spring:message code="ui.184"/></td>
          </tr>
          <tr>
            <td><spring:message code="ui.075"/></td>
            <td><spring:message code="ui.1057"/></td>
            <td><spring:message code="ui.558"/></td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.185"/></span>
        <h2><spring:message code="ui.186"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small><spring:message code="ui.562"/></small><strong>1</strong></div>
        <div class="time-kpi"><small><spring:message code="ui.563"/></small><strong>3</strong></div>
        <div class="time-kpi"><small><spring:message code="ui.187"/></small><strong>H</strong></div>
      </div>
      <p>
        <spring:message code="ui.1058"/>
      </p>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/department"><spring:message code="ui.1059"/></a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
