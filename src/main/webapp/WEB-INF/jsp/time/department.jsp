<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<%@ include file="../fragments/time-filter.jspf" %>
<%@ include file="../fragments/time-metrics.jspf" %>
<spring:message code="ui.1157" var="msg_ui_1157"/>
<section class="time-panel">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.123"/></span>
      <h2><spring:message code="${messageCodes[team]}" text="${team}" htmlEscape="true"/> · <spring:message code="${messageCodes[periodLabel]}" text="${periodLabel}" htmlEscape="true"/></h2>
    </div>
    <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/department/export?month=${period}&amp;team=${team}">
      <spring:message code="ui.1022"/>
    </a>
  </div>
  <div class="matrix-legend">
    <span><i></i> <spring:message code="ui.1023"/></span>
    <span><i class="hol"></i> <spring:message code="ui.1024"/></span>
    <span><i class="ot"></i> <spring:message code="ui.570"/></span>
    <span><i class="ex"></i> <spring:message code="ui.1025"/></span>
    <span><spring:message code="ui.1026"/></span>
  </div>
  <div class="month-matrix-wrap" role="region" aria-label="${msg_ui_1157}" tabindex="0">
    <table class="month-matrix">
      <thead>
        <tr>
          <th scope="col" class="person-col"><spring:message code="ui.088"/></th>
          <c:forEach items="${grid.days}" var="day">
            <th scope="col" class="${day.weekend ? 'off-day' : ''}" title="${day.date}">${day.weekday}<br>${day.day}</th>
          </c:forEach>
          <th scope="col" class="total-col"><spring:message code="ui.1027"/></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${grid.rows}" var="row">
          <tr>
            <th scope="row" class="person-col">
              <strong><spring:message code="${messageCodes[row.employee.name]}" text="${row.employee.name}" htmlEscape="true"/></strong>
              <small><spring:message code="${messageCodes[row.employee.role]}" text="${row.employee.role}" htmlEscape="true"/></small>
            </th>
            <c:forEach items="${row.cells}" var="cell">
              <td class="cell-${cell.code} ${cell.code eq 'OFF' ? 'off-day' : ''}" title="${cell.label} · ${cell.hours} hours" aria-label="${cell.label}, ${cell.hours} hours">
                <spring:message code="${messageCodes[cell.display]}" text="${cell.display}" htmlEscape="true"/>
              </td>
            </c:forEach>
            <td class="total-col">${row.totalHours}</td>
          </tr>
        </c:forEach>
        <tr class="daily-total">
          <th scope="row" class="person-col"><spring:message code="ui.098"/><small><spring:message code="ui.124"/></small></th>
          <c:forEach items="${grid.totals}" var="total">
            <td title="${total.present} present">${total.hours == 0 ? '—' : total.hours}</td>
          </c:forEach>
          <td class="total-col">${grid.totalHours}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="pagination-wrap">
    <span><spring:message code="ui.1198" arguments="${grid.rows.size()},${grid.days.size()},${grid.workdays}"/></span>
    <span><spring:message code="ui.1028"/></span>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1029"/></span>
        <h2><spring:message code="ui.099"/></h2>
      </div>
    </div>
    <div class="table-wrap">
      <table class="table">
        <thead>
          <tr>
            <th><spring:message code="ui.088"/></th>
            <th><spring:message code="ui.095"/></th>
            <th><spring:message code="ui.096"/></th>
            <th><spring:message code="ui.097"/></th>
            <th><spring:message code="ui.057"/></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${grid.rows}" var="row">
            <tr>
              <td><strong><spring:message code="${messageCodes[row.employee.name]}" text="${row.employee.name}" htmlEscape="true"/></strong></td>
              <td>${row.workedDays}</td>
              <td>${row.leaveDays}</td>
              <td>
                <span class="badge ${row.exceptions gt 0 ? 'badge-error' : 'badge-success'} badge-soft">${row.exceptions}</span>
              </td>
              <td class="mono">${row.totalHours}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.127"/></span>
        <h2><spring:message code="ui.128"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span>
            <strong><spring:message code="ui.129"/></strong>
            <small><spring:message code="ui.130"/></small>
          </span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong><spring:message code="ui.131"/></strong><small><spring:message code="ui.132"/></small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span>
            <strong><spring:message code="ui.133"/></strong>
            <small><spring:message code="ui.134"/></small>
          </span>
        </li>
        <li>
          <span class="marker">4</span>
          <span><strong><spring:message code="ui.135"/></strong><small><spring:message code="ui.136"/></small></span>
        </li>
      </ul>
      <div class="alert alert-info">
        <spring:message code="ui.1030"/>
      </div>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
