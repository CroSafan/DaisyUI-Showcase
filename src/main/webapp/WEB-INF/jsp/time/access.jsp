<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="clock-terminal">
  <section class="clock-display">
    <small><spring:message code="ui.200"/></small>
    <strong><spring:message code="ui.035"/></strong>
    <span class="badge ${clockStatus eq 'WORKING' ? 'badge-success' : clockStatus eq 'BREAK' ? 'badge-warning' : 'badge-neutral'}">
      <spring:message code="${messageCodes[clockStatus]}" text="${clockStatus}" htmlEscape="true"/>
    </span>
    <p>
      <spring:message code="ui.104"/>
      <strong style="display:inline;font-size:inherit;letter-spacing:0"><spring:message code="${messageCodes[person.name]}" text="${person.name}" htmlEscape="true"/></strong>
      <spring:message code="ui.998"/>
    </p>
    <div class="clock-actions">
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="in">
        <button class="btn btn-success btn-sm" ${clockStatus ne 'OUT' ? 'disabled' : ''}><spring:message code="ui.100"/></button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="break">
        <button class="btn btn-warning btn-sm" ${clockStatus ne 'WORKING' ? 'disabled' : ''}><spring:message code="ui.101"/></button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="resume">
        <button class="btn btn-info btn-sm" ${clockStatus ne 'BREAK' ? 'disabled' : ''}><spring:message code="ui.102"/></button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="out">
        <button class="btn btn-outline btn-sm" ${clockStatus eq 'OUT' ? 'disabled' : ''}><spring:message code="ui.103"/></button>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.193"/></span>
        <h2><spring:message code="ui.105"/></h2>
      </div>
      <span class="badge badge-outline">E-1042</span>
    </div>
    <div class="time-panel-body">
      <div class="time-person">
        <span class="avatar-circle">MK</span>
        <span><strong>Mia Kovač</strong><small><spring:message code="ui.999"/></small></span>
      </div>
      <div class="divider"></div>
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.106"/></strong><small><spring:message code="ui.1000"/></small></li>
        <li><strong><spring:message code="ui.107"/></strong><small><spring:message code="ui.1001"/></small></li>
        <li><strong><spring:message code="ui.108"/></strong><small><spring:message code="ui.1002"/></small></li>
      </ul>
      <div class="alert alert-info">
        <spring:message code="ui.1003"/>
      </div>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.109"/></span>
        <h2><spring:message code="ui.110"/></h2>
      </div>
      <span class="badge badge-ghost"><spring:message code="ui.111"/></span>
    </div>
    <div class="time-panel-body">
      <c:choose>
        <c:when test="${empty clockEvents}">
          <div class="alert alert-info"><spring:message code="ui.1004"/></div>
        </c:when>
        <c:otherwise>
          <ul class="clock-steps">
            <c:forEach items="${clockEvents}" var="event">
              <li>
                <span class="marker">✓</span>
                <span>
                  <strong><spring:message code="${messageCodes[event.action]}" text="${event.action}" htmlEscape="true"/> · <spring:message code="${messageCodes[event.time]}" text="${event.time}" htmlEscape="true"/></strong>
                  <small><spring:message code="${messageCodes[event.source]}" text="${event.source}" htmlEscape="true"/> <spring:message code="ui.1005"/></small>
                </span>
              </li>
            </c:forEach>
          </ul>
        </c:otherwise>
      </c:choose>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.114"/></span>
        <h2><spring:message code="ui.115"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.116"/></strong><small><spring:message code="ui.1006"/></small></li>
        <li><strong><spring:message code="ui.117"/></strong><small><spring:message code="ui.1007"/></small></li>
        <li><strong><spring:message code="ui.118"/></strong><small><spring:message code="ui.119"/></small></li>
        <li><strong><spring:message code="ui.120"/></strong><small><spring:message code="ui.121"/></small></li>
      </ul>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/timesheet"><spring:message code="ui.1008"/></a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
