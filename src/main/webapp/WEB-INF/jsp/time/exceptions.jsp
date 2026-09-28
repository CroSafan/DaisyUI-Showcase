<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="alert alert-warning">
  ⚠ Exception worklist includes sample missing punches, lateness, overtime and an unplanned absence. Severity is always named in text.
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker">INVESTIGATION QUEUE</span>
      <h2>Attendance anomalies</h2>
    </div>
    <span class="badge badge-error badge-soft">${exceptions.size()} visible</span>
  </div>
  <form class="toolbar" method="get" action="${pageContext.request.contextPath}/time/exceptions">
    <label class="sr-only" for="exception-team">Team</label>
    <select id="exception-team" class="select select-bordered select-sm" name="team">
      <option value="" ${empty exceptionTeam ? 'selected' : ''}>All teams</option>
      <c:forEach items="${teams}" var="option">
        <option value="${option}" ${exceptionTeam eq option ? 'selected' : ''}>${option}</option>
      </c:forEach>
    </select>
    <label class="sr-only" for="exception-severity">Severity</label>
    <select id="exception-severity" class="select select-bordered select-sm" name="severity">
      <option value="all" ${severity eq 'all' ? 'selected' : ''}>All severities</option>
      <option value="Critical" ${severity eq 'Critical' ? 'selected' : ''}>Critical</option>
      <option value="High" ${severity eq 'High' ? 'selected' : ''}>High</option>
      <option value="Medium" ${severity eq 'Medium' ? 'selected' : ''}>Medium</option>
      <option value="Low" ${severity eq 'Low' ? 'selected' : ''}>Low</option>
    </select>
    <button class="btn btn-primary btn-sm">Filter</button>
    <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/exceptions">Reset</a>
  </form>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col">Case</th>
          <th scope="col">Employee</th>
          <th scope="col">Date</th>
          <th scope="col">Signal</th>
          <th scope="col">Severity</th>
          <th scope="col">Status</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty exceptions}">
            <tr>
              <td colspan="7">
                <div class="alert alert-info">No exceptions match these filters.</div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${exceptions}" var="item">
              <tr>
                <td class="mono"><c:out value="${item.id}"/></td>
                <td><strong><c:out value="${item.employee}"/></strong><small><c:out value="${item.team}"/></small></td>
                <td><c:out value="${item.date}"/></td>
                <td><strong><c:out value="${item.type}"/></strong><small><c:out value="${item.detail}"/></small></td>
                <td><span class="badge badge-${item.tone} badge-soft"><c:out value="${item.severity}"/></span></td>
                <td><c:out value="${item.status}"/></td>
                <td>
                  <button class="btn btn-ghost btn-xs" type="button" data-detail="${fn:escapeXml(item.id)} · ${fn:escapeXml(item.detail)}">
                    Inspect
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
        <span class="section-kicker">ROOT-CAUSE VIEW</span>
        <h2>Missing punch · EX-184</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="component-row">
        <span class="badge badge-error">Critical</span>
        <span class="badge badge-outline">Payroll blocker</span>
      </div>
      <p>Leo Marić started at 08:30 on 14 September. No clock-out is present after the facilities shift handover.</p>
      <ul class="clock-steps">
        <li><span class="marker">1</span><span><strong>08:30 · Clock-in captured</strong><small>Web terminal</small></span></li>
        <li>
          <span class="marker">2</span>
          <span><strong>17:00 · Shift scheduled to end</strong><small>Operations rota</small></span>
        </li>
        <li>
          <span class="marker">!</span>
          <span><strong>Clock-out missing</strong><small>Employee correction required</small></span>
        </li>
      </ul>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/timesheet">Open correction form ↗</a>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">EXCEPTION POLICY</span>
        <h2>Resolution sequence</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong>Employee supplies evidence</strong><small>Proposed time range and reason.</small></li>
        <li><strong>Manager confirms</strong><small>Checks schedule, access and handover context.</small></li>
        <li><strong>Payroll recalculates</strong><small>Only approved changes should affect paid hours.</small></li>
      </ul>
      <div class="alert alert-info">ⓘ The matrix intentionally leaves this day at zero until the exception is resolved.</div>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
