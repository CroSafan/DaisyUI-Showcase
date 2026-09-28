<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="metric-grid">
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Pending decisions</span>
      <strong class="metric-value">${pendingCount}</strong>
      <span class="badge badge-info badge-soft">Cross-team</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Leave</span>
      <strong class="metric-value">${leaveApprovalCount}</strong>
      <span class="badge badge-warning badge-soft">Cover review</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Clock correction</span>
      <strong class="metric-value">${correctionApprovalCount}</strong>
      <span class="badge badge-error badge-soft">Payroll impact</span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top">Overtime / swaps</span>
      <strong class="metric-value">${otherApprovalCount}</strong>
      <span class="badge badge-success badge-soft">Context supplied</span>
    </div>
  </article>
</div>
<div class="content-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">MANAGER INBOX</span>
        <h2>Requests requiring a decision</h2>
      </div>
      <span class="badge badge-outline">Session demo</span>
    </div>
    <div class="table-wrap">
      <table class="table table-zebra">
        <thead>
          <tr>
            <th scope="col">Request</th>
            <th scope="col">Employee</th>
            <th scope="col">When</th>
            <th scope="col">Impact</th>
            <th scope="col">State</th>
            <th scope="col">Decision</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${approvals}" var="item">
            <tr>
              <td><strong><c:out value="${item.type}"/></strong><small><c:out value="${item.id}"/></small></td>
              <td><strong><c:out value="${item.employee}"/></strong><small><c:out value="${item.team}"/></small></td>
              <td><c:out value="${item.when}"/></td>
              <td><c:out value="${item.amount}"/><small><c:out value="${item.context}"/></small></td>
              <td><span class="badge badge-${item.tone} badge-soft"><c:out value="${item.status}"/></span></td>
              <td>
                <c:choose>
                  <c:when test="${item.status eq 'Pending'}">
                    <div class="time-actions">
                      <form method="post" action="${pageContext.request.contextPath}/time/approvals/decision">
                        <input type="hidden" name="id" value="${item.id}">
                        <input type="hidden" name="decision" value="Approved">
                        <button class="btn btn-success btn-xs" aria-label="Approve ${item.id}">Approve</button>
                      </form>
                      <form method="post" action="${pageContext.request.contextPath}/time/approvals/decision">
                        <input type="hidden" name="id" value="${item.id}">
                        <input type="hidden" name="decision" value="Rejected">
                        <button class="btn btn-error btn-outline btn-xs" aria-label="Reject ${item.id}">Reject</button>
                      </form>
                    </div>
                  </c:when>
                  <c:otherwise><span class="time-small">Decision recorded</span></c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </section>
  <aside class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">DECISION CONTEXT</span>
        <h2>What a manager checks</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong>Coverage</strong><small>Will enough qualified colleagues be available?</small></li>
        <li><strong>Balance</strong><small>Does the employee have the requested leave allowance?</small></li>
        <li><strong>Evidence</strong><small>Do correction requests include a reason and time range?</small></li>
        <li><strong>Threshold</strong><small>Does overtime need an additional approval level?</small></li>
      </ul>
      <div class="alert alert-warning">
        ⚠ These decisions change only this demo session. They do not affect the deterministic month ledger.
      </div>
    </div>
  </aside>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">AUDIT STORY</span>
        <h2>Decision trail</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span><strong>Request submitted</strong><small>Employee provides dates, reason and cover.</small></span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong>Policy and conflict review</strong><small>Balance, schedule and calendar are checked.</small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span>
            <strong>Manager decision</strong>
            <small>State is visible in the queue and would notify the employee.</small>
          </span>
        </li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">NEXT STEP</span>
        <h2>Resolve payroll blockers</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <p>
        Attendance exceptions with missing clockings are high-priority because they prevent a reliable paid-hours total. Follow the exception queue to inspect the underlying records.
      </p>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/exceptions">Open exceptions ↗</a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
