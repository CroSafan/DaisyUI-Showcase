<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1142" var="msg_ui_1142"/>
<spring:message code="ui.1143" var="msg_ui_1143"/>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.452"/></span>
      <h2><spring:message code="ui.453"/></h2>
      <div class="chart" role="img" aria-label="${msg_ui_1142}">
        <span style="--h:36%"></span>
        <span style="--h:39%"></span>
        <span style="--h:45%"></span>
        <span style="--h:47%"></span>
        <span style="--h:51%"></span>
        <span style="--h:54%"></span>
        <span style="--h:61%"></span>
        <span style="--h:66%"></span>
        <span style="--h:72%"></span>
        <span style="--h:75%"></span>
        <span style="--h:83%"></span>
        <span style="--h:90%"></span>
      </div>
      <div class="chart-legend"><span><spring:message code="ui.1193"/></span><span><spring:message code="ui.1194"/></span><span><spring:message code="ui.1195"/></span><span><spring:message code="ui.1196"/></span></div>
      <div class="component-row">
        <span class="badge badge-success"><spring:message code="ui.898"/></span>
        <span class="badge badge-info"><spring:message code="ui.899"/></span>
      </div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.454"/></span>
      <h2><spring:message code="ui.455"/></h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.900"/></strong><small><spring:message code="ui.901"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.902"/></strong><small><spring:message code="ui.903"/></small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong><spring:message code="ui.904"/></strong><small><spring:message code="ui.905"/></small></div>
        </li>
      </ul>
      <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1143}"><spring:message code="ui.456"/></button>
    </div>
  </section>
</div>
<div class="three-grid section-block">
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.457"/></span>
      <h3><spring:message code="ui.460"/></h3>
      <strong class="metric-value">94.2%</strong>
      <span class="badge badge-success"><spring:message code="ui.461"/></span>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.055"/></span>
      <h3><spring:message code="ui.906"/></h3>
      <strong class="metric-value">82%</strong>
      <span class="badge badge-info"><spring:message code="ui.907"/></span>
    </div>
  </article>
  <article class="card feature-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.459"/></span>
      <h3><spring:message code="ui.908"/></h3>
      <strong class="metric-value">99.94%</strong>
      <span class="badge badge-success"><spring:message code="ui.445"/></span>
    </div>
  </article>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
