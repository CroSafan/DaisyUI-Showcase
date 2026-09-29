<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<spring:message code="ui.1151" var="msg_ui_1151"/>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.961"/></span>
      <h2><spring:message code="ui.962"/></h2>
    </div>
  </div>
  <div class="component-pad">
    <div class="responsive-demo">
      <div class="device-card">
        <div class="device-frame phone"><i></i><i></i><i></i></div>
        <strong><spring:message code="ui.963"/></strong>
        <small><spring:message code="ui.964"/></small>
      </div>
      <div class="device-card">
        <div class="device-frame tablet"><i></i><i></i></div>
        <strong><spring:message code="ui.965"/></strong>
        <small><spring:message code="ui.966"/></small>
      </div>
      <div class="device-card">
        <div class="device-frame desktop"><i></i><i></i><i></i></div>
        <strong><spring:message code="ui.967"/></strong>
        <small><spring:message code="ui.968"/></small>
      </div>
    </div>
  </div>
</section>
<%@ include file="../fragments/metrics.jspf" %>
<div class="content-grid">
  <%@ include file="../fragments/record-table.jspf" %>
  <section class="card insight-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.969"/></span>
      <h2><spring:message code="ui.970"/></h2>
      <p>
        <spring:message code="ui.971"/>
      </p>
      <div class="form-grid">
        <div class="field">
          <label for="responsive-name"><spring:message code="ui.972"/></label>
          <input class="input input-bordered" id="responsive-name" placeholder="Project Atlas">
        </div>
        <div class="field">
          <label for="responsive-team"><spring:message code="ui.089"/></label>
          <select class="select select-bordered" id="responsive-team"><option><spring:message code="ui.326"/></option><option><spring:message code="ui.325"/></option></select>
        </div>
      </div>
      <button class="btn btn-primary" data-toast="${msg_ui_1151}"><spring:message code="ui.973"/></button>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
