<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<div class="metric-grid">
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.1009"/></span>
      <strong class="metric-value">${pendingCount}</strong>
      <span class="badge badge-info badge-soft"><spring:message code="ui.1010"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.1188"/></span>
      <strong class="metric-value">${leaveApprovalCount}</strong>
      <span class="badge badge-warning badge-soft"><spring:message code="ui.1011"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.1012"/></span>
      <strong class="metric-value">${correctionApprovalCount}</strong>
      <span class="badge badge-error badge-soft"><spring:message code="ui.1013"/></span>
    </div>
  </article>
  <article class="card metric-card">
    <div class="card-body">
      <span class="metric-top"><spring:message code="ui.1014"/></span>
      <strong class="metric-value">${otherApprovalCount}</strong>
      <span class="badge badge-success badge-soft"><spring:message code="ui.1015"/></span>
    </div>
  </article>
</div>
<div class="content-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.228"/></span>
        <h2><spring:message code="ui.229"/></h2>
      </div>
      <span class="badge badge-outline"><spring:message code="ui.147"/></span>
    </div>
    <div class="table-wrap">
      <table class="table table-zebra">
        <thead>
          <tr>
            <th scope="col"><spring:message code="ui.1189"/></th>
            <th scope="col"><spring:message code="ui.088"/></th>
            <th scope="col"><spring:message code="ui.091"/></th>
            <th scope="col"><spring:message code="ui.1016"/></th>
            <th scope="col"><spring:message code="ui.217"/></th>
            <th scope="col"><spring:message code="ui.230"/></th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${approvals}" var="item">
            <tr>
              <td><strong><spring:message code="${messageCodes[item.type]}" text="${item.type}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[item.id]}" text="${item.id}" htmlEscape="true"/></small></td>
              <td><strong><spring:message code="${messageCodes[item.employee]}" text="${item.employee}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[item.team]}" text="${item.team}" htmlEscape="true"/></small></td>
              <td><spring:message code="${messageCodes[item.when]}" text="${item.when}" htmlEscape="true"/></td>
              <td><spring:message code="${messageCodes[item.amount]}" text="${item.amount}" htmlEscape="true"/><small><spring:message code="${messageCodes[item.context]}" text="${item.context}" htmlEscape="true"/></small></td>
              <td><span class="badge badge-${item.tone} badge-soft"><spring:message code="${messageCodes[item.status]}" text="${item.status}" htmlEscape="true"/></span></td>
              <td>
                <c:choose>
                  <c:when test="${item.status eq 'Pending'}">
                    <div class="time-actions">
                      <form method="post" action="${pageContext.request.contextPath}/time/approvals/decision">
                        <input type="hidden" name="id" value="${item.id}">
                        <input type="hidden" name="decision" value="Approved">
                        <button class="btn btn-success btn-xs" aria-label="Approve ${item.id}"><spring:message code="ui.231"/></button>
                      </form>
                      <form method="post" action="${pageContext.request.contextPath}/time/approvals/decision">
                        <input type="hidden" name="id" value="${item.id}">
                        <input type="hidden" name="decision" value="Rejected">
                        <button class="btn btn-error btn-outline btn-xs" aria-label="Reject ${item.id}"><spring:message code="ui.232"/></button>
                      </form>
                    </div>
                  </c:when>
                  <c:otherwise><span class="time-small"><spring:message code="ui.233"/></span></c:otherwise>
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
        <span class="section-kicker"><spring:message code="ui.234"/></span>
        <h2><spring:message code="ui.235"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="time-insight-list">
        <li><strong><spring:message code="ui.236"/></strong><small><spring:message code="ui.237"/></small></li>
        <li><strong><spring:message code="ui.238"/></strong><small><spring:message code="ui.239"/></small></li>
        <li><strong><spring:message code="ui.240"/></strong><small><spring:message code="ui.241"/></small></li>
        <li><strong><spring:message code="ui.242"/></strong><small><spring:message code="ui.243"/></small></li>
      </ul>
      <div class="alert alert-warning">
        <spring:message code="ui.1017"/>
      </div>
    </div>
  </aside>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.245"/></span>
        <h2><spring:message code="ui.246"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span><strong><spring:message code="ui.247"/></strong><small><spring:message code="ui.248"/></small></span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong><spring:message code="ui.249"/></strong><small><spring:message code="ui.250"/></small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span>
            <strong><spring:message code="ui.160"/></strong>
            <small><spring:message code="ui.252"/></small>
          </span>
        </li>
      </ul>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.1018"/></span>
        <h2><spring:message code="ui.1019"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <p>
        <spring:message code="ui.1020"/>
      </p>
      <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/time/exceptions"><spring:message code="ui.1021"/></a>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
