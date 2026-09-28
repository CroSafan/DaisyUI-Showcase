<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="fragments/head.jspf" %>
<section class="hero">
  <div class="hero-content">
    <span class="eyebrow">30 PAGES. ONE DESIGN SYSTEM.</span>
    <h1>Serious software.<br>Remarkably good UI.</h1>
    <p>A hands-on gallery of DaisyUI patterns for real enterprise work, built entirely with Spring Boot, JSP, and Maven.</p>
    <div class="hero-actions">
      <a class="btn btn-neutral" href="${pageContext.request.contextPath}/showcase/components">Explore components ↗</a>
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/time/overview">Explore time management</a>
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/showcase/executive">See the command center</a>
    </div>
  </div>
</section>
<section class="card panel-card section-block">
  <div class="panel-head">
    <div>
      <span class="section-kicker">NEW DEEP DIVE · 10 CONNECTED PAGES</span>
      <h2>Time Management workspace</h2>
      <p>
        Clock access, complete department months, shift coverage, leave, holidays, approvals, exceptions and reports—using one reconciled Java dataset.
      </p>
    </div>
    <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/overview">Open workspace ↗</a>
  </div>
</section>
<div class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker">START EXPLORING</span>
      <h2>From components to complete products</h2>
    </div>
    <p>Choose a destination to see the patterns in context.</p>
  </div>
  <div class="home-grid">
    <c:forEach items="${navigation}" var="item">
      <a class="card feature-card home-card" href="${pageContext.request.contextPath}${item.path}">
        <div class="card-body">
          <span class="home-icon" aria-hidden="true">${item.icon}</span>
          <span class="badge badge-ghost badge-sm"><c:out value="${item.category}"/></span>
          <strong><c:out value="${item.title}"/></strong>
          <small><c:out value="${item.description}"/></small>
          <span class="arrow" aria-hidden="true">Explore ↗</span>
        </div>
      </a>
    </c:forEach>
  </div>
</div>
<%@ include file="fragments/foot.jspf" %>
