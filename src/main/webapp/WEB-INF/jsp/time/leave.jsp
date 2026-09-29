<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/time-nav.jspf" %>
<spring:message code="ui.1158" var="msg_ui_1158"/>
<spring:message code="ui.1159" var="msg_ui_1159"/>
<spring:message code="ui.149" var="msg_ui_149"/>
<div class="two-grid">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.138"/></span>
        <h2><spring:message code="ui.1060"/></h2>
      </div>
      <span class="badge badge-success"><spring:message code="ui.674"/></span>
    </div>
    <div class="time-panel-body">
      <div class="time-balance">
        <div><small><spring:message code="ui.140"/></small><strong><spring:message code="ui.1061"/></strong></div>
        <div><small><spring:message code="ui.141"/></small><strong><spring:message code="ui.1062"/></strong></div>
        <div><small><spring:message code="ui.142"/></small><strong><spring:message code="ui.1063"/></strong></div>
      </div>
      <p class="time-small"><spring:message code="ui.143"/></p>
      <progress class="progress progress-primary" value="8" max="25" aria-label="${msg_ui_1158}"></progress>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.144"/></span>
        <h2><spring:message code="ui.145"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <div class="time-status-line"><span><spring:message code="ui.1064"/></span><strong><spring:message code="ui.1190"/></strong></div>
      <div class="time-status-line" style="margin-top:.5rem">
        <span><spring:message code="ui.1065"/></span>
        <strong><spring:message code="ui.1190"/></strong>
      </div>
      <div class="alert alert-warning" style="margin-top:.8rem">
        <spring:message code="ui.1066"/>
      </div>
    </div>
  </section>
</div>
<div class="two-grid time-section">
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.146"/></span>
        <h2><spring:message code="ui.1067"/></h2>
      </div>
      <span class="badge badge-outline"><spring:message code="ui.147"/></span>
    </div>
    <div class="time-panel-body">
      <form class="time-form" method="post" action="${pageContext.request.contextPath}/time/leave/request">
        <label>
          <spring:message code="ui.148"/>
          <select class="select select-bordered" name="type" required>
            <option value="Annual leave"><spring:message code="ui.073"/></option>
            <option value="Personal day"><spring:message code="ui.074"/></option>
            <option value="Unpaid leave"><spring:message code="ui.075"/></option>
          </select>
        </label>
        <label>
          <spring:message code="ui.149"/>
          <input class="input input-bordered" value="Noah Petrović" readonly aria-label="${msg_ui_149}">
        </label>
        <label><spring:message code="ui.150"/><input class="input input-bordered" type="date" name="from" required></label>
        <label><spring:message code="ui.151"/><input class="input input-bordered" type="date" name="to" required></label>
        <label class="full">
          <spring:message code="ui.152"/>
          <textarea class="textarea textarea-bordered" name="note" maxlength="300" rows="3" placeholder="${msg_ui_1159}">
          </textarea>
        </label>
        <div class="form-actions">
          <button class="btn btn-primary btn-sm"><spring:message code="ui.153"/></button>
          <small><spring:message code="ui.1068"/></small>
        </div>
      </form>
    </div>
  </section>
  <section class="time-panel">
    <div class="time-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.154"/></span>
        <h2><spring:message code="ui.155"/></h2>
      </div>
    </div>
    <div class="time-panel-body">
      <ul class="clock-steps">
        <li>
          <span class="marker">1</span>
          <span>
            <strong><spring:message code="ui.156"/></strong>
            <small><spring:message code="ui.157"/></small>
          </span>
        </li>
        <li>
          <span class="marker">2</span>
          <span><strong><spring:message code="ui.158"/></strong><small><spring:message code="ui.159"/></small></span>
        </li>
        <li>
          <span class="marker">3</span>
          <span><strong><spring:message code="ui.160"/></strong><small><spring:message code="ui.161"/></small></span>
        </li>
      </ul>
      <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/time/holidays"><spring:message code="ui.1069"/></a>
    </div>
  </section>
</div>
<section class="time-panel time-section">
  <div class="time-panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.163"/></span>
      <h2><spring:message code="ui.164"/></h2>
    </div>
    <span class="badge badge-info badge-soft"><spring:message code="ui.1200" arguments="${leaveRequests.size()}"/></span>
  </div>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col"><spring:message code="ui.1189"/></th>
          <th scope="col"><spring:message code="ui.088"/></th>
          <th scope="col"><spring:message code="ui.165"/></th>
          <th scope="col"><spring:message code="ui.166"/></th>
          <th scope="col"><spring:message code="ui.167"/></th>
          <th scope="col"><spring:message code="ui.168"/></th>
          <th scope="col"><spring:message code="ui.092"/></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${leaveRequests}" var="item">
          <tr>
            <td class="mono"><spring:message code="${messageCodes[item.id]}" text="${item.id}" htmlEscape="true"/></td>
            <td><strong><spring:message code="${messageCodes[item.employee]}" text="${item.employee}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[item.team]}" text="${item.team}" htmlEscape="true"/></small></td>
            <td><spring:message code="${messageCodes[item.type]}" text="${item.type}" htmlEscape="true"/></td>
            <td><spring:message code="${messageCodes[item.from]}" text="${item.from}" htmlEscape="true"/> → <spring:message code="${messageCodes[item.to]}" text="${item.to}" htmlEscape="true"/></td>
            <td>${item.days}</td>
            <td><spring:message code="${messageCodes[item.cover]}" text="${item.cover}" htmlEscape="true"/></td>
            <td><span class="badge badge-${item.tone} badge-soft"><spring:message code="${messageCodes[item.status]}" text="${item.status}" htmlEscape="true"/></span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>
<%@ include file="../fragments/foot.jspf" %>
