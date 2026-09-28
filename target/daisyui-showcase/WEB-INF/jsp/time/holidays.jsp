<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="alert alert-info">
  ⓘ This is an illustrative company calendar. Dates and observances are fictional and are not legal or payroll guidance.
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">CALENDAR REGISTER</span>
        <h2>Observed days & closures</h2>
      </div>
      <span class="badge badge-outline">2026</span>
    </div>
    <div class="time-panel-body">
      <div class="holiday-list">
        <c:forEach items="${holidays}" var="item">
          <div class="holiday-item">
            <span class="holiday-date">
              <c:out value="${fn:substring(item.date,5,7)}"/>
              <br>
              <c:out value="${fn:substring(item.date,8,10)}"/>
            </span>
            <span>
              <strong><c:out value="${item.title}"/></strong>
              <small><c:out value="${item.type}"/> · <c:out value="${item.date}"/></small>
            </span>
            <span class="badge badge-${item.tone} badge-soft"><c:out value="${item.region}"/></span>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">REGIONAL RULES</span>
        <h2>Calendar assignment</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-status-line"><span>Zagreb campus</span><strong>Central calendar</strong></div>
      <div class="time-status-line" style="margin-top:.5rem"><span>Split office</span><strong>Coastal calendar</strong></div>
      <div class="time-status-line" style="margin-top:.5rem">
        <span>Remote employees</span>
        <strong>Contract region</strong>
      </div>
      <div class="divider"></div>
      <h3>Holiday handling</h3>
      <ul class="time-insight-list">
        <li><strong>Non-working days</strong><small>Displayed as H in the department clocking matrix.</small></li>
        <li><strong>Leave overlap</strong><small>Managers review requests crossing a regional holiday.</small></li>
        <li><strong>Working on a closure</strong><small>Requires a schedule exception and overtime review.</small></li>
      </ul>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">ENTITLEMENT MODEL</span>
        <h2>Time-away categories</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <table class="time-stat-table">
        <thead>
          <tr>
            <th>Category</th>
            <th>Example allowance</th>
            <th>Approval</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Annual leave</td>
            <td>25 days / year</td>
            <td>Manager</td>
          </tr>
          <tr>
            <td>Personal day</td>
            <td>2 days / year</td>
            <td>Manager</td>
          </tr>
          <tr>
            <td>Company closure</td>
            <td>Calendar based</td>
            <td>Automatic</td>
          </tr>
          <tr>
            <td>Unpaid leave</td>
            <td>Case by case</td>
            <td>People team</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker">CONNECTED VIEW</span>
        <h2>September closure impact</h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-kpi-strip">
        <div class="time-kpi"><small>Observed days</small><strong>1</strong></div>
        <div class="time-kpi"><small>Teams affected</small><strong>3</strong></div>
        <div class="time-kpi"><small>Matrix code</small><strong>H</strong></div>
      </div>
      <p>
        Company Recharge Day on 18 September is marked separately from worked time and paid leave in the department matrix.
      </p>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/department">Inspect the month ↗</a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
