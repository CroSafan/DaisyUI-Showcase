<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1125" var="msg_ui_1125"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.337"/></span>
      <h2><spring:message code="ui.338"/></h2>
      <div class="chart" role="img" aria-label="${msg_ui_1125}">
        <span style="--h:32%"></span>
        <span style="--h:38%"></span>
        <span style="--h:35%"></span>
        <span style="--h:47%"></span>
        <span style="--h:52%"></span>
        <span style="--h:49%"></span>
        <span style="--h:62%"></span>
        <span style="--h:65%"></span>
        <span style="--h:68%"></span>
        <span style="--h:76%"></span>
        <span style="--h:79%"></span>
        <span style="--h:91%"></span>
      </div>
      <div class="chart-legend"><span><spring:message code="ui.679"/></span><span><spring:message code="ui.1161"/></span><span><spring:message code="ui.1162"/></span><span><spring:message code="ui.1163"/></span><span><spring:message code="ui.678"/></span></div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.339"/></span>
      <h2><spring:message code="ui.340"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.341"/></strong><small><spring:message code="ui.1164"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.342"/></strong><small><spring:message code="ui.1165"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.343"/></strong><small><spring:message code="ui.1166"/></small></div>
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
