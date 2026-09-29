<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1155" var="msg_ui_1155"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.984"/></span>
      <h2><spring:message code="ui.985"/></h2>
      <div class="component-row">
        <span class="badge badge-error"><spring:message code="ui.463"/></span>
        <span class="badge badge-warning"><spring:message code="ui.464"/></span>
        <span class="badge badge-outline">IAM</span>
      </div>
      <p>
        <spring:message code="ui.986"/>
      </p>
      <div class="alert alert-error"><spring:message code="ui.987"/></div>
      <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1155}"><spring:message code="ui.500"/></button>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.465"/></span>
      <h2><spring:message code="ui.988"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.989"/></strong><small><spring:message code="ui.990"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.991"/></strong><small><spring:message code="ui.992"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.993"/></strong><small><spring:message code="ui.994"/></small></div>
        </li>
      </ul>
      <div class="progress-label"><span><spring:message code="ui.466"/></span><strong>96%</strong></div>
      <progress class="progress progress-success" value="96" max="100"></progress>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
