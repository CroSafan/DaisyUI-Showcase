<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1144" var="msg_ui_1144"/>
<spring:message code="ui.1145" var="msg_ui_1145"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <div class="section-head">
        <div>
          <span class="section-kicker"><spring:message code="ui.589"/></span>
          <h2><spring:message code="ui.375"/></h2>
        </div>
        <select class="select select-sm" aria-label="${msg_ui_1144}"><option><spring:message code="ui.716"/></option><option>Q2 2026</option></select>
      </div>
      <div class="component-stack">
        <div>
          <div class="progress-label"><span><spring:message code="ui.326"/></span><strong>€412K / €550K</strong></div>
          <progress class="progress progress-primary" value="75" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span><spring:message code="ui.459"/></span><strong>€298K / €350K</strong></div>
          <progress class="progress progress-warning" value="85" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span><spring:message code="ui.055"/></span><strong>€186K / €300K</strong></div>
          <progress class="progress progress-success" value="62" max="100"></progress>
        </div>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.591"/></span>
      <h2><spring:message code="ui.377"/></h2>
      <div class="stats stats-vertical bg-base-200">
        <div class="stat">
          <div class="stat-title"><spring:message code="ui.909"/></div>
          <div class="stat-value text-success">€428K</div>
        </div>
        <div class="stat">
          <div class="stat-title"><spring:message code="ui.910"/></div>
          <div class="stat-value text-warning">€312K</div>
        </div>
      </div>
      <button class="btn btn-outline btn-sm" data-toast="${msg_ui_1145}"><spring:message code="ui.378"/></button>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
