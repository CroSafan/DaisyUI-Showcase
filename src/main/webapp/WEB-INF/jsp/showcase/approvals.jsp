<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1126" var="msg_ui_1126"/>
<spring:message code="ui.1127" var="msg_ui_1127"/>
<div class="two-grid section-block">
  <section class="card surface-card" data-approval-row>
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.846"/></span>
      <h2><spring:message code="ui.847"/></h2>
      <div class="component-row">
        <span class="badge badge-error"><spring:message code="ui.848"/></span>
        <span class="badge badge-warning" data-approval-status><spring:message code="ui.849"/></span>
        <span class="badge badge-outline">€24,800</span>
      </div>
      <p><spring:message code="ui.850"/></p>
      <label for="approval-comment" class="field-hint"><spring:message code="ui.851"/></label>
      <textarea id="approval-comment" class="textarea textarea-bordered" placeholder="${msg_ui_1126}"></textarea>
      <div class="component-row">
        <button class="btn btn-success btn-sm" data-approve="yes"><spring:message code="ui.231"/></button>
        <button class="btn btn-error btn-outline btn-sm" data-approve="no"><spring:message code="ui.232"/></button>
        <button class="btn btn-ghost btn-sm" data-toast="${msg_ui_1127}"><spring:message code="ui.852"/></button>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.592"/></span>
      <h2><spring:message code="ui.246"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.853"/></strong><small><spring:message code="ui.854"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.855"/></strong><small><spring:message code="ui.856"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.247"/></strong><small><spring:message code="ui.1167"/></small></div>
        </li>
      </ul>
      <div class="alert alert-warning"><spring:message code="ui.857"/></div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
