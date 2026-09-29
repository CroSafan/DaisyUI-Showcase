<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1150" var="msg_ui_1150"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.425"/></span>
      <h2><spring:message code="ui.945"/></h2>
      <p><spring:message code="ui.946"/></p>
      <div class="route-map" role="img" aria-label="${msg_ui_1150}">
        <span class="route-node"></span>
        <span class="route-line"></span>
        <span class="route-node"></span>
        <span class="route-line"></span>
        <span class="route-node"></span>
      </div>
      <div class="route-labels"><span>Zagreb</span><span>Vienna</span><span>Munich</span></div>
      <div class="alert alert-warning"><spring:message code="ui.947"/></div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.948"/></span>
      <h2><spring:message code="ui.426"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.949"/></strong><small><spring:message code="ui.1191"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.950"/></strong><small><spring:message code="ui.1192"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.427"/></strong><small>Orion Supply · 11:30</small></div>
        </li>
      </ul>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
