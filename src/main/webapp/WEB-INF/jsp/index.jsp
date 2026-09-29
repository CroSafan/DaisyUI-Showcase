<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="fragments/head.jspf" %>
<section class="hero">
  <div class="hero-content">
    <span class="eyebrow"><spring:message code="ui.502"/></span>
    <h1><spring:message code="ui.834"/><br><spring:message code="ui.835"/></h1>
    <p><spring:message code="ui.504"/></p>
    <div class="hero-actions">
      <a class="btn btn-neutral" href="${pageContext.request.contextPath}/showcase/components"><spring:message code="ui.836"/></a>
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/time/overview"><spring:message code="ui.506"/></a>
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/showcase/executive"><spring:message code="ui.507"/></a>
    </div>
  </div>
</section>
<section class="card panel-card section-block">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.508"/></span>
      <h2><spring:message code="ui.509"/></h2>
      <p>
        <spring:message code="ui.510"/>
      </p>
    </div>
    <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/overview"><spring:message code="ui.838"/></a>
  </div>
</section>
<div class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.511"/></span>
      <h2><spring:message code="ui.512"/></h2>
    </div>
    <p><spring:message code="ui.513"/></p>
  </div>
  <div class="home-grid">
    <c:forEach items="${navigation}" var="item">
      <a class="card feature-card home-card" href="${pageContext.request.contextPath}${item.path}">
        <div class="card-body">
          <span class="home-icon" aria-hidden="true">${item.icon}</span>
          <span class="badge badge-ghost badge-sm"><spring:message code="${messageCodes[item.category]}" text="${item.category}" htmlEscape="true"/></span>
          <strong><spring:message code="${messageCodes[item.title]}" text="${item.title}" htmlEscape="true"/></strong>
          <small><spring:message code="${messageCodes[item.description]}" text="${item.description}" htmlEscape="true"/></small>
          <span class="arrow" aria-hidden="true"><spring:message code="ui.837"/></span>
        </div>
      </a>
    </c:forEach>
  </div>
</div>
<%@ include file="fragments/foot.jspf" %>
