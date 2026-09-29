<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:message code="error.language" var="languageLabel"/>
<!doctype html>
<html lang="${currentLanguage}" data-theme="enterprise">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title><spring:message code="error.${errorCategory}.title"/> · DaisyUI Showcase</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/daisyui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/enterprise.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error-page.css?v=1.0.0">
    <script src="${pageContext.request.contextPath}/js/error-page.js?v=1.0.0" defer></script>
  </head>
  <body>
    <a class="error-skip" href="#error-main"><spring:message code="ui.001"/></a>
    <div class="error-page">
      <header class="error-header">
        <a class="error-brand" href="${pageContext.request.contextPath}/" aria-label="DaisyUI Showcase">
          <span class="error-brand-mark">D<span>/</span>L</span>
          <span class="error-brand-copy"><strong>DAISY/LAB</strong><small><spring:message code="error.brandSub"/></small></span>
        </a>
        <div class="error-header-context"><span class="error-header-divider"></span><spring:message code="error.headerSection"/></div>
        <div class="error-header-actions">
          <span class="error-system-state"><span aria-hidden="true"></span><spring:message code="error.systemState"/></span>
          <label class="error-language">
            <span class="error-visually-hidden">${languageLabel}</span>
            <select class="select select-bordered select-sm" data-language-select aria-label="${languageLabel}">
              <option value="hr" ${currentLanguage eq 'hr' ? 'selected' : ''}>Hrvatski</option>
              <option value="en" ${currentLanguage eq 'en' ? 'selected' : ''}>English</option>
            </select>
          </label>
        </div>
      </header>

      <main id="error-main" class="error-main">
        <div class="error-breadcrumb"><spring:message code="error.breadcrumbHome"/><span aria-hidden="true">/</span><spring:message code="error.breadcrumbCurrent"/></div>
        <div class="error-overline"><span class="error-overline-bar"></span><spring:message code="error.overline"/></div>
        <div class="error-layout">
          <section class="error-primary" aria-labelledby="error-title">
            <div class="error-primary-top"><span class="error-code-label"><spring:message code="error.codeLabel"/></span><span class="error-code">${errorStatus}</span></div>
            <span class="error-category"><spring:message code="error.${errorCategory}.category"/></span>
            <h1 id="error-title"><spring:message code="error.${errorCategory}.title"/></h1>
            <p class="error-description"><spring:message code="error.${errorCategory}.description"/></p>
            <div class="error-actions">
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/"><spring:message code="error.homeAction"/></a>
              <a class="btn btn-outline" href="${pageContext.request.contextPath}/showcase/components"><spring:message code="error.catalogAction"/></a>
            </div>
          </section>

          <aside class="error-details" aria-labelledby="error-details-title">
            <div class="error-details-heading"><span class="error-details-icon" aria-hidden="true">i</span><h2 id="error-details-title"><spring:message code="error.detailsTitle"/></h2></div>
            <dl class="error-record">
              <div><dt><spring:message code="error.statusLabel"/></dt><dd>HTTP ${errorStatus}</dd></div>
              <div><dt><spring:message code="error.pathLabel"/></dt><dd class="error-path"><c:out value="${errorPath}"/></dd></div>
              <div><dt><spring:message code="error.stateLabel"/></dt><dd><span class="error-state-pill"><spring:message code="error.stateValue"/></span></dd></div>
            </dl>
            <div class="error-next">
              <h3><spring:message code="error.nextTitle"/></h3>
              <div><span>01</span><p><spring:message code="error.nextFirst"/></p></div>
              <div><span>02</span><p><spring:message code="error.nextSecond"/></p></div>
            </div>
          </aside>
        </div>
        <div class="error-shortcuts"><strong><spring:message code="error.shortcutsTitle"/></strong><a href="${pageContext.request.contextPath}/showcase/workspace-form"><spring:message code="error.shortcutForm"/> <span aria-hidden="true">↗</span></a><a href="${pageContext.request.contextPath}/time/overview"><spring:message code="error.shortcutTime"/> <span aria-hidden="true">↗</span></a></div>
      </main>

      <footer class="error-footer"><span>© DaisyUI Enterprise Showcase</span><span><spring:message code="error.footer"/></span></footer>
    </div>
  </body>
</html>
