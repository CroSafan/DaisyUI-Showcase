<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.379"/></span>
      <h2>Mia Kovač</h2>
      <p><spring:message code="ui.925"/></p>
      <div class="component-row">
        <span class="avatar-circle">MK</span>
        <span class="badge badge-success"><spring:message code="ui.142"/></span>
        <span class="badge badge-outline"><spring:message code="ui.381"/></span>
      </div>
      <div class="divider"></div>
      <div class="two-grid">
        <div>
          <small><spring:message code="ui.139"/></small>
          <strong><spring:message code="ui.926"/></strong>
          <p><spring:message code="ui.927"/></p>
        </div>
        <div>
          <small><spring:message code="ui.928"/></small>
          <strong><spring:message code="ui.929"/></strong>
          <p><spring:message code="ui.930"/></p>
        </div>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.931"/></span>
      <h2><spring:message code="ui.382"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.383"/></strong><small><spring:message code="ui.932"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.384"/></strong><small><spring:message code="ui.933"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.385"/></strong><small><spring:message code="ui.934"/></small></div>
        </li>
      </ul>
      <div class="alert alert-info"><spring:message code="ui.935"/></div>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
