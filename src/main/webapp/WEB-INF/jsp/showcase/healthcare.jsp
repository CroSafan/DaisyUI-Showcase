<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.919"/></span>
      <h2><spring:message code="ui.410"/></h2>
      <div class="timeline-track">
        <div class="timeline-step"><span></span><strong>09:30</strong><small><spring:message code="ui.411"/></small></div>
        <div class="timeline-step"><span></span><strong>10:00</strong><small><spring:message code="ui.412"/></small></div>
        <div class="timeline-step pending"><span></span><strong>10:30</strong><small><spring:message code="ui.413"/></small></div>
        <div class="timeline-step pending"><span></span><strong>11:00</strong><small><spring:message code="ui.413"/></small></div>
      </div>
      <div class="alert alert-info"><spring:message code="ui.920"/></div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.414"/></span>
      <h2><spring:message code="ui.415"/></h2>
      <div class="component-stack">
        <div>
          <div class="progress-label"><span><spring:message code="ui.921"/></span><strong>8 / 12 rooms</strong></div>
          <progress class="progress progress-primary" value="67" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span><spring:message code="ui.922"/></span><strong>4 / 6 rooms</strong></div>
          <progress class="progress progress-info" value="67" max="100"></progress>
        </div>
        <div>
          <div class="progress-label"><span><spring:message code="ui.923"/></span><strong>3 / 4 rooms</strong></div>
          <progress class="progress progress-warning" value="75" max="100"></progress>
        </div>
      </div>
      <span class="badge badge-success"><spring:message code="ui.924"/></span>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
