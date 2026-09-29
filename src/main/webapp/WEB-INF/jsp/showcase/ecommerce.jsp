<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1141" var="msg_ui_1141"/>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.884"/></span>
      <h2><spring:message code="ui.885"/></h2>
    </div>
    <button class="btn btn-outline btn-sm" data-toast="${msg_ui_1141}"><spring:message code="ui.886"/></button>
  </div>
  <div class="three-grid">
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-primary) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◈
        </div>
        <h3><spring:message code="ui.887"/></h3>
        <p><spring:message code="ui.888"/></p>
        <span class="badge badge-warning"><spring:message code="ui.889"/></span>
        <strong>€89</strong>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-secondary) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◧
        </div>
        <h3><spring:message code="ui.890"/></h3>
        <p><spring:message code="ui.891"/></p>
        <span class="badge badge-success"><spring:message code="ui.892"/></span>
        <strong>€42</strong>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-accent) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◬
        </div>
        <h3><spring:message code="ui.893"/></h3>
        <p><spring:message code="ui.894"/></p>
        <span class="badge badge-warning"><spring:message code="ui.895"/></span>
        <strong>€126</strong>
      </div>
    </article>
  </div>
</section>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
