<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:message code="workspace.form.namePlaceholder" var="namePlaceholder"/>
<spring:message code="workspace.form.emailPlaceholder" var="emailPlaceholder"/>
<spring:message code="workspace.form.websitePlaceholder" var="websitePlaceholder"/>
<spring:message code="workspace.form.searchPlaceholder" var="searchPlaceholder"/>
<spring:message code="workspace.form.fileEmpty" var="fileEmpty"/>
<spring:message code="workspace.form.draftSaved" var="draftSaved"/>
<spring:message code="workspace.form.draftRestored" var="draftRestored"/>
<spring:message code="workspace.form.submitted" var="submittedMessage"/>
<spring:message code="workspace.form.cleared" var="clearedMessage"/>
<spring:message code="workspace.form.companyFallback" var="companyFallback"/>
<spring:message code="workspace.form.sections" var="sectionsLabel"/>
<spring:message code="workspace.form.manufacturing" var="manufacturingOption"/>
<spring:message code="workspace.form.technology" var="technologyOption"/>
<spring:message code="workspace.form.professionalServices" var="professionalServicesOption"/>
<spring:message code="workspace.form.healthcare" var="healthcareOption"/>
<spring:message code="ui.009" var="themeLabel"/>
<!doctype html>
<html lang="${currentLanguage}" data-theme="enterprise">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><spring:message code="workspace.form.title"/> · DaisyUI Showcase</title>
    <script>
      try {
        const savedTheme = localStorage.getItem("showcase-theme");
        if (["light", "dark", "corporate", "enterprise", "business", "black", "synthwave", "neutral", "cupcake"].includes(savedTheme)) {
          document.documentElement.dataset.theme = savedTheme;
        }
      } catch (_) {}
    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/daisyui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themes.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/enterprise.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/workspace-form.css?v=1.1.0">
    <script src="${pageContext.request.contextPath}/js/workspace-form.js?v=1.1.0" defer></script>
  </head>
  <body>
    <a class="wf-skip" href="#application-form"><spring:message code="ui.001"/></a>
    <div class="wf-page">
      <header class="wf-header">
        <div class="wf-header-brand">
          <a class="wf-mark" href="${pageContext.request.contextPath}/" aria-label="DaisyUI Showcase">D<span>/</span>L</a>
          <div>
            <div class="wf-product"><spring:message code="workspace.form.product"/></div>
            <div class="wf-product-sub"><spring:message code="workspace.form.productSub"/></div>
          </div>
        </div>
        <div class="wf-header-context">
          <span class="wf-environment"><span class="wf-dot"></span><spring:message code="workspace.form.environment"/></span>
          <span class="wf-header-divider" aria-hidden="true"></span>
          <span><spring:message code="workspace.form.applicationId"/></span>
        </div>
        <div class="wf-header-actions">
          <label class="wf-theme">
            <span class="wf-visually-hidden">${themeLabel}</span>
            <select class="select select-bordered select-sm" data-theme-select aria-label="${themeLabel}">
              <option value="light"><spring:message code="ui.616"/></option>
              <option value="dark"><spring:message code="ui.617"/></option>
              <option value="corporate"><spring:message code="ui.618"/></option>
              <option value="enterprise"><spring:message code="ui.469"/></option>
              <option value="business"><spring:message code="ui.619"/></option>
              <option value="black"><spring:message code="ui.594"/></option>
              <option value="synthwave"><spring:message code="ui.595"/></option>
              <option value="neutral"><spring:message code="ui.492"/></option>
              <option value="cupcake"><spring:message code="ui.596"/></option>
            </select>
          </label>
          <label class="wf-language">
            <span class="wf-visually-hidden"><spring:message code="ui.277"/></span>
            <select class="select select-bordered select-sm" data-language-select>
              <option value="hr" ${currentLanguage eq 'hr' ? 'selected' : ''}>Hrvatski</option>
              <option value="en" ${currentLanguage eq 'en' ? 'selected' : ''}>English</option>
            </select>
          </label>
          <a class="btn btn-outline btn-sm wf-return" href="${pageContext.request.contextPath}/"><spring:message code="workspace.form.back"/></a>
        </div>
      </header>

      <div class="wf-layout">
        <aside class="wf-sidebar" aria-label="${sectionsLabel}">
          <div class="wf-sidebar-intro">
            <span class="wf-kicker"><spring:message code="workspace.form.navigation"/></span>
            <h2><spring:message code="workspace.form.sideTitle"/></h2>
            <p><spring:message code="workspace.form.sideDescription"/></p>
          </div>
          <nav class="wf-nav" aria-label="${sectionsLabel}">
            <a class="wf-nav-link is-active" href="#organization" aria-current="step"><span class="wf-nav-index">01</span><span><spring:message code="workspace.form.organization"/></span></a>
            <a class="wf-nav-link" href="#contact"><span class="wf-nav-index">02</span><span><spring:message code="workspace.form.contact"/></span></a>
            <a class="wf-nav-link" href="#commercial"><span class="wf-nav-index">03</span><span><spring:message code="workspace.form.commercial"/></span></a>
            <a class="wf-nav-link" href="#operations"><span class="wf-nav-index">04</span><span><spring:message code="workspace.form.operations"/></span></a>
            <a class="wf-nav-link" href="#documents"><span class="wf-nav-index">05</span><span><spring:message code="workspace.form.documents"/></span></a>
            <a class="wf-nav-link" href="#review"><span class="wf-nav-index">06</span><span><spring:message code="workspace.form.review"/></span></a>
          </nav>
          <div class="wf-sidebar-help">
            <span class="wf-help-icon" aria-hidden="true">?</span>
            <div><strong><spring:message code="workspace.form.helpTitle"/></strong><small><spring:message code="workspace.form.helpBody"/></small></div>
          </div>
        </aside>

        <main class="wf-main" id="application-form">
          <div class="wf-titlebar">
            <div>
              <div class="wf-breadcrumb"><spring:message code="workspace.form.product"/><span aria-hidden="true">/</span><spring:message code="workspace.form.newApplication"/></div>
              <h1><spring:message code="workspace.form.title"/></h1>
              <p><spring:message code="workspace.form.intro"/></p>
            </div>
            <div class="wf-titlebar-actions">
              <span class="badge badge-neutral badge-soft"><spring:message code="workspace.form.demoBadge"/></span>
              <button class="btn btn-outline btn-sm" type="button" data-save-draft><spring:message code="workspace.form.saveDraft"/></button>
            </div>
          </div>

          <form id="supplier-form" data-draft-saved="${draftSaved}" data-draft-restored="${draftRestored}" data-submitted="${submittedMessage}" data-cleared="${clearedMessage}" data-company-fallback="${companyFallback}" data-file-empty="${fileEmpty}">
            <section class="wf-section" id="organization" aria-labelledby="organization-title">
              <div class="wf-section-head"><span class="wf-section-number">01</span><div><h2 id="organization-title"><spring:message code="workspace.form.organization"/></h2><p><spring:message code="workspace.form.organizationHelp"/></p></div></div>
              <div class="wf-fields">
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.legalName"/> <em>*</em></span><input class="input input-bordered" name="legalName" type="text" autocomplete="organization" placeholder="${namePlaceholder}" maxlength="100" required></label>
                <label class="wf-field"><span><spring:message code="workspace.form.businessType"/> <em>*</em></span><select class="select select-bordered" name="businessType" required><option value=""><spring:message code="workspace.form.selectOption"/></option><option value="company"><spring:message code="workspace.form.company"/></option><option value="nonprofit"><spring:message code="workspace.form.nonprofit"/></option><option value="soleTrader"><spring:message code="workspace.form.soleTrader"/></option></select></label>
                <label class="wf-field"><span><spring:message code="workspace.form.registration"/></span><input class="input input-bordered" name="registration" type="text" inputmode="numeric" maxlength="30" placeholder="HR-12345678"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.industry"/></span><input class="input input-bordered" name="industry" type="search" list="industry-options" placeholder="${searchPlaceholder}"><datalist id="industry-options"><option value="${manufacturingOption}"></option><option value="${technologyOption}"></option><option value="${professionalServicesOption}"></option><option value="${healthcareOption}"></option></datalist></label>
                <label class="wf-field"><span><spring:message code="workspace.form.founded"/></span><input class="input input-bordered" name="founded" type="date"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.website"/></span><input class="input input-bordered" name="website" type="url" placeholder="${websitePlaceholder}" autocomplete="url"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.employees"/></span><input class="input input-bordered" name="employees" type="number" min="1" max="1000000" step="1" placeholder="250"></label>
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.summary"/></span><textarea class="textarea textarea-bordered" name="summary" rows="3" maxlength="600"></textarea><small><spring:message code="workspace.form.summaryHelp"/></small></label>
              </div>
            </section>

            <section class="wf-section" id="contact" aria-labelledby="contact-title">
              <div class="wf-section-head"><span class="wf-section-number">02</span><div><h2 id="contact-title"><spring:message code="workspace.form.contact"/></h2><p><spring:message code="workspace.form.contactHelp"/></p></div></div>
              <div class="wf-fields">
                <label class="wf-field"><span><spring:message code="workspace.form.firstName"/> <em>*</em></span><input class="input input-bordered" name="firstName" type="text" autocomplete="given-name" required></label>
                <label class="wf-field"><span><spring:message code="workspace.form.lastName"/> <em>*</em></span><input class="input input-bordered" name="lastName" type="text" autocomplete="family-name" required></label>
                <label class="wf-field"><span><spring:message code="workspace.form.email"/> <em>*</em></span><input class="input input-bordered" name="email" type="email" autocomplete="email" placeholder="${emailPlaceholder}" required></label>
                <label class="wf-field"><span><spring:message code="workspace.form.phone"/></span><input class="input input-bordered" name="phone" type="tel" autocomplete="tel" placeholder="+385 91 555 0100"></label>
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.address"/></span><input class="input input-bordered" name="address" type="text" autocomplete="street-address"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.city"/></span><input class="input input-bordered" name="city" type="text" autocomplete="address-level2"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.postal"/></span><input class="input input-bordered" name="postal" type="text" autocomplete="postal-code" inputmode="numeric"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.country"/></span><select class="select select-bordered" name="country" autocomplete="country"><option value="HR"><spring:message code="workspace.form.croatia"/></option><option value="SI"><spring:message code="workspace.form.slovenia"/></option><option value="DE"><spring:message code="workspace.form.germany"/></option><option value="other"><spring:message code="workspace.form.other"/></option></select></label>
                <label class="wf-field"><span><spring:message code="workspace.form.timezone"/></span><select class="select select-bordered" name="timezone"><option value="Europe/Zagreb">Europe/Zagreb (UTC+1/+2)</option><option value="Europe/London">Europe/London (UTC+0/+1)</option><option value="America/New_York">America/New_York (UTC−5/−4)</option></select></label>
                <fieldset class="wf-choice-group wf-span-2"><legend><spring:message code="workspace.form.contactMethod"/></legend><label><input class="radio radio-primary radio-sm" type="radio" name="contactMethod" value="email" checked> <spring:message code="workspace.form.email"/></label><label><input class="radio radio-primary radio-sm" type="radio" name="contactMethod" value="phone"> <spring:message code="workspace.form.phone"/></label><label><input class="radio radio-primary radio-sm" type="radio" name="contactMethod" value="video"> <spring:message code="workspace.form.video"/></label></fieldset>
              </div>
            </section>

            <section class="wf-section" id="commercial" aria-labelledby="commercial-title">
              <div class="wf-section-head"><span class="wf-section-number">03</span><div><h2 id="commercial-title"><spring:message code="workspace.form.commercial"/></h2><p><spring:message code="workspace.form.commercialHelp"/></p></div></div>
              <div class="wf-fields">
                <label class="wf-field"><span><spring:message code="workspace.form.currency"/></span><select class="select select-bordered" name="currency"><option value="EUR">EUR — <spring:message code="workspace.form.euro"/></option><option value="USD">USD — <spring:message code="workspace.form.dollar"/></option><option value="GBP">GBP — <spring:message code="workspace.form.pound"/></option></select></label>
                <label class="wf-field"><span><spring:message code="workspace.form.annualSpend"/></span><span class="wf-money"><span aria-hidden="true">€</span><input name="annualSpend" type="number" min="0" max="999999999" step="0.01" inputmode="decimal" placeholder="125000.00"></span></label>
                <label class="wf-field"><span><spring:message code="workspace.form.discount"/></span><span class="wf-suffix"><input class="input input-bordered" name="discount" type="number" min="0" max="100" step="0.1" inputmode="decimal" placeholder="5.0"><span aria-hidden="true">%</span></span></label>
                <label class="wf-field"><span><spring:message code="workspace.form.orders"/></span><input class="input input-bordered" name="orders" type="number" min="0" max="10000" step="1" placeholder="24"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.taxId"/></span><input class="input input-bordered" name="taxId" type="text" maxlength="24" placeholder="HR12345678901"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.paymentTerms"/></span><select class="select select-bordered" name="paymentTerms"><option value="15"><spring:message code="workspace.form.days15"/></option><option value="30" selected><spring:message code="workspace.form.days30"/></option><option value="60"><spring:message code="workspace.form.days60"/></option></select></label>
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.iban"/></span><input class="input input-bordered" name="iban" type="text" autocomplete="off" maxlength="34" placeholder="HR12 3456 7890 1234 5678 9"></label>
              </div>
            </section>

            <section class="wf-section" id="operations" aria-labelledby="operations-title">
              <div class="wf-section-head"><span class="wf-section-number">04</span><div><h2 id="operations-title"><spring:message code="workspace.form.operations"/></h2><p><spring:message code="workspace.form.operationsHelp"/></p></div></div>
              <div class="wf-fields">
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.services"/></span><select class="select select-bordered wf-multiselect" name="services" multiple size="4"><option value="consulting"><spring:message code="workspace.form.consulting"/></option><option value="software"><spring:message code="workspace.form.software"/></option><option value="logistics"><spring:message code="workspace.form.logistics"/></option><option value="support"><spring:message code="workspace.form.support"/></option></select><small><spring:message code="workspace.form.multiselectHelp"/></small></label>
                <label class="wf-field"><span><spring:message code="workspace.form.startDate"/></span><input class="input input-bordered" name="startDate" type="date"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.kickoff"/></span><input class="input input-bordered" name="kickoff" type="datetime-local"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.billingMonth"/></span><input class="input input-bordered" name="billingMonth" type="month"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.deliveryWeek"/></span><input class="input input-bordered" name="deliveryWeek" type="week"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.contactTime"/></span><input class="input input-bordered" name="contactTime" type="time"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.brandColor"/></span><input class="wf-color" name="brandColor" type="color" value="#3166a2"></label>
                <fieldset class="wf-choice-group wf-span-2"><legend><spring:message code="workspace.form.priority"/></legend><label><input class="radio radio-primary radio-sm" type="radio" name="priority" value="standard" checked> <spring:message code="workspace.form.standard"/></label><label><input class="radio radio-primary radio-sm" type="radio" name="priority" value="expedited"> <spring:message code="workspace.form.expedited"/></label><label><input class="radio radio-primary radio-sm" type="radio" name="priority" value="critical"> <spring:message code="workspace.form.critical"/></label></fieldset>
                <fieldset class="wf-choice-group wf-span-2"><legend><spring:message code="workspace.form.regions"/></legend><label><input class="checkbox checkbox-primary checkbox-sm" type="checkbox" name="regions" value="eu" checked> <spring:message code="workspace.form.europe"/></label><label><input class="checkbox checkbox-primary checkbox-sm" type="checkbox" name="regions" value="uk"> <spring:message code="workspace.form.uk"/></label><label><input class="checkbox checkbox-primary checkbox-sm" type="checkbox" name="regions" value="us"> <spring:message code="workspace.form.us"/></label></fieldset>
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.sla"/> <output id="sla-value" for="sla-range">95%</output></span><input id="sla-range" class="range range-primary range-sm" name="sla" type="range" min="90" max="100" value="95"></label>
              </div>
            </section>

            <section class="wf-section" id="documents" aria-labelledby="documents-title">
              <div class="wf-section-head"><span class="wf-section-number">05</span><div><h2 id="documents-title"><spring:message code="workspace.form.documents"/></h2><p><spring:message code="workspace.form.documentsHelp"/></p></div></div>
              <div class="wf-fields">
                <label class="wf-field wf-span-2"><span><spring:message code="workspace.form.files"/></span><input class="file-input file-input-bordered" name="files" type="file" accept=".pdf,.png,.jpg,.jpeg,.docx" multiple><small id="file-summary" aria-live="polite">${fileEmpty}</small></label>
                <label class="wf-field"><span><spring:message code="workspace.form.portalUser"/></span><input class="input input-bordered" name="portalUser" type="text" autocomplete="username"></label>
                <label class="wf-field"><span><spring:message code="workspace.form.portalPassword"/></span><input class="input input-bordered" name="portalPassword" type="password" autocomplete="new-password" minlength="8"><small><spring:message code="workspace.form.passwordHelp"/></small></label>
                <label class="wf-switch-row wf-span-2"><span><strong><spring:message code="workspace.form.notifications"/></strong><small><spring:message code="workspace.form.notificationsHelp"/></small></span><input class="toggle toggle-primary" name="notifications" type="checkbox" checked></label>
                <label class="wf-switch-row wf-span-2"><span><strong><spring:message code="workspace.form.audit"/></strong><small><spring:message code="workspace.form.auditHelp"/></small></span><input class="toggle toggle-primary" name="audit" type="checkbox"></label>
              </div>
            </section>

            <section class="wf-section" id="review" aria-labelledby="review-title">
              <div class="wf-section-head"><span class="wf-section-number">06</span><div><h2 id="review-title"><spring:message code="workspace.form.review"/></h2><p><spring:message code="workspace.form.reviewHelp"/></p></div></div>
              <div class="wf-review-card"><span><spring:message code="workspace.form.reviewLabel"/></span><strong id="review-company">${companyFallback}</strong><small><spring:message code="workspace.form.reviewNote"/></small></div>
              <label class="wf-consent"><input class="checkbox checkbox-primary checkbox-sm" name="confirm" type="checkbox" required><span><spring:message code="workspace.form.confirm"/> <em>*</em></span></label>
              <div class="wf-form-actions"><button class="btn btn-ghost" type="reset"><spring:message code="workspace.form.clear"/></button><button class="btn btn-outline" type="button" data-save-draft><spring:message code="workspace.form.saveDraft"/></button><button class="btn btn-primary" type="submit"><spring:message code="workspace.form.submit"/></button></div>
              <div class="wf-status" id="form-status" role="status" aria-live="polite" hidden></div>
            </section>
          </form>
        </main>
      </div>
    </div>
  </body>
</html>
