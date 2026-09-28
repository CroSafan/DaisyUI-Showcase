<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">PERSONAL ENTITLEMENT</span>
        <h2>Mia Kovač · 2026 balance</h2>
      </div>
      <span class="badge badge-success">Active</span>
    </div>
    <div class="time-panel-body">
      <div class="time-balance">
        <div><small>Annual allowance</small><strong>25 days</strong></div>
        <div><small>Used + approved</small><strong>8 days</strong></div>
        <div><small>Available</small><strong>17 days</strong></div>
      </div>
      <p class="time-small">Pending requests are shown separately and do not reduce the approved balance until accepted.</p>
      <progress class="progress progress-primary" value="8" max="25" aria-label="8 of 25 annual leave days used"></progress>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">COVERAGE FORECAST</span>
        <h2>Team availability</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-status-line"><span>Week of 12 October</span><strong>5 of 6 available</strong></div>
      <div class="time-status-line" style="margin-top:.5rem">
        <span>Week of 26 October</span>
        <strong>5 of 6 available</strong>
      </div>
      <div class="alert alert-warning" style="margin-top:.8rem">
        ⚠ One October request overlaps a regional holiday. Confirm the relevant calendar before approval.
      </div>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">SELF-SERVICE REQUEST</span>
        <h2>Plan time away</h2>
      </div>
      <span class="badge badge-outline">Session demo</span>
    </div>
    <div class="time-panel-body">
      <form class="time-form" method="post" action="${pageContext.request.contextPath}/time/leave/request">
        <label>
          Leave type
          <select class="select select-bordered" name="type" required>
            <option value="Annual leave">Annual leave</option>
            <option value="Personal day">Personal day</option>
            <option value="Unpaid leave">Unpaid leave</option>
          </select>
        </label>
        <label>
          Cover colleague
          <input class="input input-bordered" value="Noah Petrović" readonly aria-label="Cover colleague">
        </label>
        <label>First day<input class="input input-bordered" type="date" name="from" required></label>
        <label>Last day<input class="input input-bordered" type="date" name="to" required></label>
        <label class="full">
          Reason or handover note
          <textarea class="textarea textarea-bordered" name="note" maxlength="300" rows="3" placeholder="Optional context for your manager">
          </textarea>
        </label>
        <div class="form-actions">
          <button class="btn btn-primary btn-sm">Submit leave request</button>
          <small>1–20 weekdays per request.</small>
        </div>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">REQUEST PIPELINE</span>
        <h2>From request to calendar</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span>
            <strong>Check balance and coverage</strong>
            <small>Review planned team absences and regional holidays.</small>
          </span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong>Submit with handover</strong><small>Your request appears below and in the manager queue.</small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span><strong>Manager decision</strong><small>Approved days flow to the department calendar.</small></span>
        </li>
      </ul>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/holidays">View holiday calendar ↗</a>
    </div>
  </section>
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker">LEAVE REGISTER</span>
      <h2>Requests across teams</h2>
    </div>
    <span class="badge badge-info badge-soft">${leaveRequests.size()} records</span>
  </div>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col">Request</th>
          <th scope="col">Employee</th>
          <th scope="col">Type</th>
          <th scope="col">Dates</th>
          <th scope="col">Days</th>
          <th scope="col">Cover</th>
          <th scope="col">Status</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${leaveRequests}" var="item">
          <tr>
            <td class="mono"><c:out value="${item.id}"/></td>
            <td><strong><c:out value="${item.employee}"/></strong><small><c:out value="${item.team}"/></small></td>
            <td><c:out value="${item.type}"/></td>
            <td><c:out value="${item.from}"/> → <c:out value="${item.to}"/></td>
            <td>${item.days}</td>
            <td><c:out value="${item.cover}"/></td>
            <td><span class="badge badge-${item.tone} badge-soft"><c:out value="${item.status}"/></span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>
<%@ include file="../fragments/foot.jspf" %>
