<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<spring:message code="ui.064" var="msg_ui_064"/>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.201"/></span>
        <h2><spring:message code="${messageCodes[person.name]}" text="${person.name}" htmlEscape="true"/></h2>
      </div>
      <span class="badge badge-primary badge-soft"><spring:message code="${messageCodes[person.role]}" text="${person.role}" htmlEscape="true"/></span>
    </div>
    <div class="time-panel-body">
      <div class="time-person">
        <span class="avatar-circle"><spring:message code="${messageCodes[person.initials]}" text="${person.initials}" htmlEscape="true"/></span>
        <span>
          <strong><spring:message code="${messageCodes[person.name]}" text="${person.name}" htmlEscape="true"/></strong>
          <small><spring:message code="${messageCodes[person.id]}" text="${person.id}" htmlEscape="true"/> · <spring:message code="${messageCodes[person.team]}" text="${person.team}" htmlEscape="true"/> · <spring:message code="ui.1201" arguments="${person.weeklyHours}"/></small>
        </span>
      </div>
      <div class="divider"></div>
      <form method="get" action="${pageContext.request.contextPath}/time/timesheet" class="component-row">
        <input type="hidden" name="month" value="${period}">
        <label class="sr-only" for="sheet-employee"><spring:message code="ui.088"/></label>
        <select id="sheet-employee" class="select select-bordered select-sm" name="employee">
          <c:forEach items="${employees}" var="option">
            <option value="${option.id}" ${person.id eq option.id ? 'selected' : ''}><spring:message code="${messageCodes[option.name]}" text="${option.name}" htmlEscape="true"/></option>
          </c:forEach>
        </select>
        <button class="btn btn-primary btn-sm"><spring:message code="ui.202"/></button>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.203"/></span>
        <h2><spring:message code="ui.204"/></h2>
      </div>
      <span class="badge badge-warning"><spring:message code="ui.1115"/></span>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small><spring:message code="ui.205"/></small><strong>${person.weeklyHours} h</strong></div>
        <div class="time-kpi"><small><spring:message code="ui.206"/></small><strong><spring:message code="ui.1202" arguments="${grid.workdays}"/></strong></div>
        <div class="time-kpi"><small><spring:message code="ui.207"/></small><strong>${clockings.size()}</strong></div>
      </div>
      <p class="time-small"><spring:message code="ui.1116"/></p>
    </div>
  </section>
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.210"/></span>
      <h2><spring:message code="ui.211"/> <spring:message code="${messageCodes[periodLabel]}" text="${periodLabel}" htmlEscape="true"/></h2>
    </div>
    <span class="badge badge-outline"><spring:message code="ui.1117"/></span>
  </div>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col"><spring:message code="ui.212"/></th>
          <th scope="col"><spring:message code="ui.213"/></th>
          <th scope="col"><spring:message code="ui.214"/></th>
          <th scope="col"><spring:message code="ui.215"/></th>
          <th scope="col"><spring:message code="ui.216"/></th>
          <th scope="col"><spring:message code="ui.217"/></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${clockings}" var="entry">
          <tr>
            <td><strong><spring:message code="${messageCodes[entry.day]}" text="${entry.day}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[entry.date]}" text="${entry.date}" htmlEscape="true"/></small></td>
            <td class="mono"><spring:message code="${messageCodes[entry.start]}" text="${entry.start}" htmlEscape="true"/></td>
            <td class="mono"><spring:message code="${messageCodes[entry.end]}" text="${entry.end}" htmlEscape="true"/></td>
            <td><spring:message code="${messageCodes[entry.breakLength]}" text="${entry.breakLength}" htmlEscape="true"/></td>
            <td class="mono">${entry.hours}</td>
            <td><span class="badge badge-${entry.tone} badge-soft"><spring:message code="${messageCodes[entry.label]}" text="${entry.label}" htmlEscape="true"/></span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.218"/></span>
        <h2><spring:message code="ui.219"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <form class="time-form" method="post" action="${pageContext.request.contextPath}/time/timesheet/correction">
        <label><spring:message code="ui.090"/><input class="input input-bordered" type="date" name="date" required></label>
        <label>
          <spring:message code="ui.1118"/>
          <input class="input input-bordered" type="text" name="reason" maxlength="300" placeholder="${msg_ui_064}" required>
        </label>
        <label><spring:message code="ui.220"/><input class="input input-bordered" type="time" name="start" required></label>
        <label><spring:message code="ui.221"/><input class="input input-bordered" type="time" name="end" required></label>
        <div class="form-actions">
          <button class="btn btn-primary btn-sm"><spring:message code="ui.222"/></button>
          <small><spring:message code="ui.223"/></small>
        </div>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.224"/></span>
        <h2><spring:message code="ui.225"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <c:choose>
        <c:when test="${empty corrections}">
          <div class="alert alert-info"><spring:message code="ui.226"/></div>
        </c:when>
        <c:otherwise>
          <ul class="time-insight-list">
            <c:forEach items="${corrections}" var="item">
              <li>
                <strong><spring:message code="${messageCodes[item.date]}" text="${item.date}" htmlEscape="true"/> · <spring:message code="${messageCodes[item.start]}" text="${item.start}" htmlEscape="true"/>–<spring:message code="${messageCodes[item.end]}" text="${item.end}" htmlEscape="true"/></strong>
                <small><spring:message code="${messageCodes[item.reason]}" text="${item.reason}" htmlEscape="true"/> · <spring:message code="${messageCodes[item.status]}" text="${item.status}" htmlEscape="true"/></small>
              </li>
            </c:forEach>
          </ul>
        </c:otherwise>
      </c:choose>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/approvals"><spring:message code="ui.1119"/></a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
