<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1148" var="msg_ui_1148"/>
<spring:message code="ui.1149" var="msg_ui_1149"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.417"/></span>
      <h2><spring:message code="ui.1181"/></h2>
      <div class="component-row">
        <span class="badge badge-error"><spring:message code="ui.1182"/></span>
        <span class="badge badge-warning"><spring:message code="ui.1183"/></span>
        <span class="badge badge-outline"><spring:message code="ui.936"/></span>
      </div>
      <p><spring:message code="ui.937"/></p>
      <div class="alert alert-error"><spring:message code="ui.938"/></div>
      <label for="ticket-comment" class="field-hint"><spring:message code="ui.420"/></label>
      <textarea id="ticket-comment" class="textarea textarea-bordered" placeholder="${msg_ui_1148}"></textarea>
      <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1149}"><spring:message code="ui.421"/></button>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.422"/></span>
      <h2><spring:message code="ui.423"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.939"/></strong><small><spring:message code="ui.940"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.941"/></strong><small><spring:message code="ui.942"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.424"/></strong><small><spring:message code="ui.943"/></small></div>
        </li>
      </ul>
      <div class="alert alert-success"><spring:message code="ui.944"/></div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
