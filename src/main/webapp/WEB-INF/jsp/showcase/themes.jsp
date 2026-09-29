<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<spring:message code="ui.1156" var="msg_ui_1156"/>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.432"/></span>
      <h2><spring:message code="ui.710"/></h2>
    </div>
    <span class="badge badge-primary badge-soft"><spring:message code="ui.434"/></span>
  </div>
  <div class="component-pad">
    <div class="theme-swatches">
      <c:forEach items="${fn:split('light|dark|corporate|enterprise|business|black|synthwave|neutral|cupcake','|')}" var="theme">
        <button type="button" class="theme-swatch" data-set-theme="${theme}" aria-label="Use ${theme} theme">
          <strong><spring:message code="${messageCodes[theme]}" text="${theme}" htmlEscape="true"/></strong>
          <div class="swatch-colors" data-theme="${theme}"><i></i><i></i><i></i><i></i></div>
        </button>
      </c:forEach>
    </div>
  </div>
</section>
<div class="content-grid">
  <section class="card panel-card">
    <div class="panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.995"/></span>
        <h2><spring:message code="ui.435"/></h2>
      </div>
      <div class="tabs tabs-box"><button class="tab tab-active"><spring:message code="ui.005"/></button><button class="tab"><spring:message code="ui.436"/></button></div>
    </div>
    <div class="component-pad component-stack">
      <div class="alert alert-info"><spring:message code="ui.996"/></div>
      <div class="three-grid">
        <div class="card bg-base-200">
          <div class="card-body">
            <small><spring:message code="ui.438"/></small>
            <strong class="metric-value">1,284</strong>
            <span class="badge badge-success">↑ 8.1%</span>
          </div>
        </div>
        <div class="card bg-base-200">
          <div class="card-body">
            <small><spring:message code="ui.997"/></small>
            <strong class="metric-value">€428K</strong>
            <span class="badge badge-primary"><spring:message code="ui.288"/></span>
          </div>
        </div>
        <div class="card bg-base-200">
          <div class="card-body">
            <small><spring:message code="ui.439"/></small>
            <strong class="metric-value">12</strong>
            <span class="badge badge-warning"><spring:message code="ui.667"/></span>
          </div>
        </div>
      </div>
      <div class="form-grid">
        <div class="field">
          <label for="theme-email"><spring:message code="ui.440"/></label>
          <input id="theme-email" class="input input-bordered" placeholder="name@company.com">
        </div>
        <div class="field">
          <label for="theme-status"><spring:message code="ui.441"/></label>
          <select id="theme-status" class="select select-bordered"><option><spring:message code="ui.674"/></option><option><spring:message code="ui.076"/></option></select>
        </div>
      </div>
      <div class="component-row">
        <button class="btn btn-primary" data-toast="${msg_ui_1156}"><spring:message code="ui.442"/></button>
        <button class="btn btn-outline"><spring:message code="ui.443"/></button>
        <span class="badge badge-error badge-soft"><spring:message code="ui.444"/></span>
        <span class="badge badge-success badge-soft"><spring:message code="ui.445"/></span>
      </div>
    </div>
  </section>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/foot.jspf" %>
