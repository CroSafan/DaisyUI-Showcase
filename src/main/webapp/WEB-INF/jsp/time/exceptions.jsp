<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="alert alert-warning">
  <spring:message code="ui.1031"/>
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.258"/></span>
      <h2><spring:message code="ui.1032"/></h2>
    </div>
    <span class="badge badge-error badge-soft"><spring:message code="ui.1199" arguments="${exceptions.size()}"/></span>
  </div>
  <form class="toolbar" method="get" action="${pageContext.request.contextPath}/time/exceptions">
    <label class="sr-only" for="exception-team"><spring:message code="ui.089"/></label>
    <select id="exception-team" class="select select-bordered select-sm" name="team">
      <option value="" ${empty exceptionTeam ? 'selected' : ''}><spring:message code="ui.081"/></option>
      <c:forEach items="${teams}" var="option">
        <option value="${option}" ${exceptionTeam eq option ? 'selected' : ''}>${option}</option>
      </c:forEach>
    </select>
    <label class="sr-only" for="exception-severity"><spring:message code="ui.260"/></label>
    <select id="exception-severity" class="select select-bordered select-sm" name="severity">
      <option value="all" ${severity eq 'all' ? 'selected' : ''}><spring:message code="ui.082"/></option>
      <option value="Critical" ${severity eq 'Critical' ? 'selected' : ''}><spring:message code="ui.670"/></option>
      <option value="High" ${severity eq 'High' ? 'selected' : ''}><spring:message code="ui.671"/></option>
      <option value="Medium" ${severity eq 'Medium' ? 'selected' : ''}><spring:message code="ui.672"/></option>
      <option value="Low" ${severity eq 'Low' ? 'selected' : ''}><spring:message code="ui.673"/></option>
    </select>
    <button class="btn btn-primary btn-sm"><spring:message code="ui.261"/></button>
    <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/exceptions"><spring:message code="ui.080"/></a>
  </form>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col"><spring:message code="ui.262"/></th>
          <th scope="col"><spring:message code="ui.088"/></th>
          <th scope="col"><spring:message code="ui.090"/></th>
          <th scope="col"><spring:message code="ui.263"/></th>
          <th scope="col"><spring:message code="ui.260"/></th>
          <th scope="col"><spring:message code="ui.092"/></th>
          <th scope="col"><spring:message code="ui.264"/></th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty exceptions}">
            <tr>
              <td colspan="7">
                <div class="alert alert-info"><spring:message code="ui.265"/></div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${exceptions}" var="item">
              <tr>
                <td class="mono"><spring:message code="${messageCodes[item.id]}" text="${item.id}" htmlEscape="true"/></td>
                <td><strong><spring:message code="${messageCodes[item.employee]}" text="${item.employee}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[item.team]}" text="${item.team}" htmlEscape="true"/></small></td>
                <td><spring:message code="${messageCodes[item.date]}" text="${item.date}" htmlEscape="true"/></td>
                <td><strong><spring:message code="${messageCodes[item.type]}" text="${item.type}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[item.detail]}" text="${item.detail}" htmlEscape="true"/></small></td>
                <td><span class="badge badge-${item.tone} badge-soft"><spring:message code="${messageCodes[item.severity]}" text="${item.severity}" htmlEscape="true"/></span></td>
                <td><spring:message code="${messageCodes[item.status]}" text="${item.status}" htmlEscape="true"/></td>
                <td>
                  <button class="btn btn-ghost btn-xs" type="button" data-detail="${fn:escapeXml(item.id)} · ${fn:escapeXml(item.detail)}">
                    <spring:message code="ui.1033"/>
                  </button>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </div>
</section>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.266"/></span>
        <h2><spring:message code="ui.1034"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="component-row">
        <span class="badge badge-error"><spring:message code="ui.670"/></span>
        <span class="badge badge-outline"><spring:message code="ui.267"/></span>
      </div>
      <p><spring:message code="ui.1035"/></p>
      <ul class="clock-steps">
        <li><span class="marker">1</span><span><strong><spring:message code="ui.1036"/></strong><small><spring:message code="ui.1037"/></small></span></li>
        <li>
          <span class="marker">2</span>
          <span><strong><spring:message code="ui.1038"/></strong><small><spring:message code="ui.1039"/></small></span>
        </li>
        <li>
          <span class="marker">!</span>
          <span><strong><spring:message code="ui.272"/></strong><small><spring:message code="ui.273"/></small></span>
        </li>
      </ul>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/timesheet"><spring:message code="ui.1040"/></a>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.275"/></span>
        <h2><spring:message code="ui.276"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.1041"/></strong><small><spring:message code="ui.1042"/></small></li>
        <li><strong><spring:message code="ui.1043"/></strong><small><spring:message code="ui.1044"/></small></li>
        <li><strong><spring:message code="ui.1045"/></strong><small><spring:message code="ui.1046"/></small></li>
      </ul>
      <div class="alert alert-info"><spring:message code="ui.1047"/></div>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
