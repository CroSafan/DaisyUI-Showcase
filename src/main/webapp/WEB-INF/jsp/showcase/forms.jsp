<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<spring:message code="ui.1146" var="msg_ui_1146"/>
<spring:message code="ui.1147" var="msg_ui_1147"/>
<spring:message code="ui.084" var="msg_ui_084"/>
<spring:message code="ui.1586" var="departmentPrompt"/>
<spring:message code="ui.654" var="operationsLabel"/>
<spring:message code="ui.706" var="financeLabel"/>
<spring:message code="ui.655" var="productLabel"/>
<spring:message code="ui.055" var="peopleLabel"/>
<c:if test="${submitted}">
  <div class="alert alert-success showcase-section" role="status">
    <spring:message code="ui.911"/>
    <strong><spring:message code="${messageCodes[intakeForm.name]}" text="${intakeForm.name}" htmlEscape="true"/></strong>
    <spring:message code="ui.213"/>
    <spring:message code="${messageCodes[intakeForm.department]}" text="${intakeForm.department}" htmlEscape="true"/>
    <spring:message code="ui.912"/>
    <spring:message code="${messageCodes[intakeForm.email]}" text="${intakeForm.email}" htmlEscape="true"/>
    .
  </div>
</c:if>
<div class="content-grid">
  <section class="card panel-card">
    <div class="panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.403"/></span>
        <h2><spring:message code="ui.404"/></h2>
      </div>
      <span class="badge badge-info badge-soft"><spring:message code="ui.405"/></span>
    </div>
    <div class="component-pad">
      <form:form method="post" modelAttribute="intakeForm" action="${pageContext.request.contextPath}/showcase/forms">
        <div class="form-grid">
          <div class="field">
            <label for="name"><spring:message code="ui.387"/> <span aria-hidden="true">*</span></label>
            <form:input path="name" id="name" cssClass="input input-bordered" cssErrorClass="input input-bordered input-error" required="required" placeholder="Jordan Davis"/>
            <form:errors path="name" cssClass="field-error"/>
          </div>
          <div class="field">
            <label for="email"><spring:message code="ui.388"/> <span aria-hidden="true">*</span></label>
            <form:input path="email" id="email" type="email" cssClass="input input-bordered" cssErrorClass="input input-bordered input-error" required="required" placeholder="jordan@company.com"/>
            <form:errors path="email" cssClass="field-error"/>
          </div>
          <div class="field">
            <label for="department"><spring:message code="ui.282"/> <span aria-hidden="true">*</span></label>
            <form:select path="department" id="department" cssClass="select select-bordered">
              <form:option value="" label="${departmentPrompt}"/>
              <form:option value="Operations" label="${operationsLabel}"/>
              <form:option value="Finance" label="${financeLabel}"/>
              <form:option value="Product" label="${productLabel}"/>
              <form:option value="People" label="${peopleLabel}"/>
            </form:select>
            <form:errors path="department" cssClass="field-error"/>
          </div>
          <div class="field">
            <label for="budget"><spring:message code="ui.913"/> <span aria-hidden="true">*</span></label>
            <form:input path="budget" id="budget" type="number" min="0" cssClass="input input-bordered" placeholder="2500"/>
            <form:errors path="budget" cssClass="field-error"/>
            <span class="field-hint"><spring:message code="ui.914"/></span>
          </div>
          <div class="field full">
            <label for="description"><spring:message code="ui.390"/></label>
            <form:textarea path="description" id="description" cssClass="textarea textarea-bordered" rows="4" placeholder="${msg_ui_1146}"/>
            <form:errors path="description" cssClass="field-error"/>
          </div>
          <div class="field full">
            <label class="component-row"><form:checkbox path="urgent" cssClass="toggle toggle-warning"/> <spring:message code="ui.391"/></label>
          </div>
        </div>
        <div class="divider"></div>
        <div class="component-row">
          <button class="btn btn-primary" type="submit"><spring:message code="ui.915"/></button>
          <button class="btn btn-ghost" type="reset"><spring:message code="ui.080"/></button>
        </div>
      </form:form>
    </div>
  </section>
  <section class="card insight-card">
    <div class="card-body">
      <span class="section-kicker"><spring:message code="ui.916"/></span>
      <h2><spring:message code="ui.406"/></h2>
      <div class="field">
        <label for="state-success"><spring:message code="ui.394"/></label>
        <input id="state-success" class="input input-success" value="Verified account">
        <span class="field-hint"><spring:message code="ui.917"/></span>
      </div>
      <div class="field">
        <label for="state-warning"><spring:message code="ui.395"/></label>
        <input id="state-warning" class="input input-warning" value="Review before saving">
        <span class="field-hint"><spring:message code="ui.408"/></span>
      </div>
      <div class="field">
        <label for="state-error"><spring:message code="ui.396"/></label>
        <input id="state-error" class="input input-error" value="Invalid reference" aria-describedby="error-message">
        <span id="error-message" class="field-error"><spring:message code="ui.409"/></span>
      </div>
      <div class="field">
        <label for="state-readonly"><spring:message code="ui.397"/></label>
        <input id="state-readonly" class="input input-bordered" value="Generated by system" readonly>
      </div>
      <div class="field">
        <label for="state-disabled"><spring:message code="ui.398"/></label>
        <input id="state-disabled" class="input input-bordered" value="Unavailable" disabled>
      </div>
      <div class="field">
        <label for="state-date"><spring:message code="ui.090"/></label>
        <input id="state-date" class="input input-bordered" type="date">
      </div>
      <div class="field">
        <label for="state-password"><spring:message code="ui.918"/></label>
        <input id="state-password" class="input input-bordered" type="password" placeholder="${msg_ui_1147}">
      </div>
      <div class="field">
        <label for="state-search"><spring:message code="ui.327"/></label>
        <input id="state-search" class="input input-bordered" type="search" placeholder="${msg_ui_084}">
      </div>
      <div class="field">
        <label for="state-range"><spring:message code="ui.446"/></label>
        <input id="state-range" class="range range-primary" type="range" value="65">
      </div>
      <fieldset class="field">
        <legend><spring:message code="ui.331"/></legend>
        <label class="component-row"><input type="radio" class="radio radio-primary" name="priority" checked> <spring:message code="ui.399"/></label>
        <label class="component-row"><input type="radio" class="radio radio-primary" name="priority"> <spring:message code="ui.400"/></label>
      </fieldset>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
