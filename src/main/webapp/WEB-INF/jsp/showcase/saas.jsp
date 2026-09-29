<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1152" var="msg_ui_1152"/>
<spring:message code="ui.1153" var="msg_ui_1153"/>
<spring:message code="ui.1154" var="msg_ui_1154"/>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.974"/></span>
      <h2><spring:message code="ui.474"/></h2>
    </div>
    <span class="badge badge-success"><spring:message code="ui.975"/></span>
  </div>
  <div class="three-grid">
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-ghost"><spring:message code="ui.467"/></span>
        <h3><spring:message code="ui.976"/></h3>
        <strong class="metric-value">€29<small>/mo</small></strong>
        <p><spring:message code="ui.977"/></p>
        <button class="btn btn-outline btn-sm" data-toast="${msg_ui_1152}"><spring:message code="ui.471"/></button>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-primary"><spring:message code="ui.468"/></span>
        <h3><spring:message code="ui.978"/></h3>
        <strong class="metric-value">€99<small>/mo</small></strong>
        <p><spring:message code="ui.979"/></p>
        <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1153}"><spring:message code="ui.472"/></button>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-secondary"><spring:message code="ui.469"/></span>
        <h3><spring:message code="ui.980"/></h3>
        <strong class="metric-value"><spring:message code="ui.981"/></strong>
        <p><spring:message code="ui.982"/></p>
        <button class="btn btn-outline btn-sm" data-toast="${msg_ui_1154}"><spring:message code="ui.473"/></button>
      </div>
    </article>
  </div>
</section>
<div class="alert alert-info section-block">
  <spring:message code="ui.983"/>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
