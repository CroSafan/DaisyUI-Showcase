<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.428"/></span>
      <h2><spring:message code="ui.951"/></h2>
    </div>
    <div class="avatar-stack"><span>MK</span><span>NP</span><span>SN</span><span>+3</span></div>
  </div>
  <div class="kanban">
    <div class="kanban-column">
      <h3><spring:message code="ui.431"/> <span class="badge badge-ghost badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-neutral badge-sm"><spring:message code="ui.952"/></span>
        <strong><spring:message code="ui.953"/></strong>
        <small><spring:message code="ui.1184"/></small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-warning badge-sm"><spring:message code="ui.671"/></span>
        <strong><spring:message code="ui.954"/></strong>
        <small><spring:message code="ui.1185"/></small>
      </div>
    </div>
    <div class="kanban-column">
      <h3><spring:message code="ui.429"/> <span class="badge badge-info badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-error badge-sm"><spring:message code="ui.670"/></span>
        <strong><spring:message code="ui.955"/></strong>
        <small>PRJ-386 · Noah Petrović</small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-primary badge-sm"><spring:message code="ui.956"/></span>
        <strong><spring:message code="ui.957"/></strong>
        <small>PRJ-419 · Mia Kovač</small>
      </div>
    </div>
    <div class="kanban-column">
      <h3><spring:message code="ui.430"/> <span class="badge badge-success badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-warning badge-sm"><spring:message code="ui.667"/></span>
        <strong><spring:message code="ui.958"/></strong>
        <small><spring:message code="ui.1186"/></small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-success badge-sm"><spring:message code="ui.540"/></span>
        <strong><spring:message code="ui.959"/></strong>
        <small><spring:message code="ui.1187"/></small>
      </div>
    </div>
  </div>
</section>
<div class="alert alert-info section-block">
  <spring:message code="ui.960"/>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
