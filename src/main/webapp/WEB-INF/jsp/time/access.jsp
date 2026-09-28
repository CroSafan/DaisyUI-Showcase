<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="clock-terminal">
  <section class="clock-display">
    <small>EMPLOYEE SELF-SERVICE · WEB TERMINAL</small>
    <strong>Time access</strong>
    <span class="badge ${clockStatus eq 'WORKING' ? 'badge-success' : clockStatus eq 'BREAK' ? 'badge-warning' : 'badge-neutral'}">
      <c:out value="${clockStatus}"/>
    </span>
    <p>
      Signed in as
      <strong style="display:inline;font-size:inherit;letter-spacing:0"><c:out value="${person.name}"/></strong>
      · Operations. The sequence below is recorded in this browser session.
    </p>
    <div class="clock-actions">
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="in">
        <button class="btn btn-success btn-sm" ${clockStatus ne 'OUT' ? 'disabled' : ''}>Clock in</button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="break">
        <button class="btn btn-warning btn-sm" ${clockStatus ne 'WORKING' ? 'disabled' : ''}>Start break</button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="resume">
        <button class="btn btn-info btn-sm" ${clockStatus ne 'BREAK' ? 'disabled' : ''}>End break</button>
      </form>
      <form method="post" action="${pageContext.request.contextPath}/time/access/clock">
        <input type="hidden" name="action" value="out">
        <button class="btn btn-outline btn-sm" ${clockStatus eq 'OUT' ? 'disabled' : ''}>Clock out</button>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">PERSONAL CONTEXT</span>
        <h2>Today's access card</h2>
      </div>
      <span class="badge badge-outline">E-1042</span>
    </div>
    <div class="time-panel-body">
      <div class="time-person">
        <span class="avatar-circle">MK</span>
        <span><strong>Mia Kovač</strong><small>Operations lead · Zagreb campus</small></span>
      </div>
      <div class="divider"></div>
      <ul class="time-insight-list">
        <li><strong>Scheduled shift</strong><small>08:30–17:00 · 30-minute break</small></li>
        <li><strong>Access location</strong><small>Web terminal · Example location</small></li>
        <li><strong>Expected paid time</strong><small>8.0 hours, excluding break</small></li>
      </ul>
      <div class="alert alert-info">
        ⓘ This demo keeps punches in the current server session. It does not record real employee attendance.
      </div>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">AUDIT TRAIL</span>
        <h2>Session events</h2>
      </div>
      <span class="badge badge-ghost">Most recent first</span>
    </div>
    <div class="time-panel-body">
      <c:choose>
        <c:when test="${empty clockEvents}">
          <div class="alert alert-info">No events in this session yet. Clock in to start the demonstration.</div>
        </c:when>
        <c:otherwise>
          <ul class="clock-steps">
            <c:forEach items="${clockEvents}" var="event">
              <li>
                <span class="marker">✓</span>
                <span>
                  <strong><c:out value="${event.action}"/> · <c:out value="${event.time}"/></strong>
                  <small><c:out value="${event.source}"/> · session record</small>
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
        <span class="section-kicker">CONTROL DESIGN</span>
        <h2>Timekeeping rules</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong>Valid sequence</strong><small>Clock in → optional break → clock out</small></li>
        <li><strong>Break policy</strong><small>30 minutes on a standard eight-hour shift</small></li>
        <li><strong>Missing punch</strong><small>Submit a correction from My timesheet</small></li>
        <li><strong>Manager review</strong><small>Corrections and overtime appear in Time approvals</small></li>
      </ul>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/timesheet">Review my timesheet ↗</a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
