<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<spring:message code="ui.758" var="msg_ui_758"/>
<div class="enterprise-workspace">
  <%@ include file="../fragments/page-title.jspf" %>
  <div class="enterprise-context">
    <span><strong><spring:message code="ui.712"/></strong> <spring:message code="ui.1171"/></span>
    <span class="badge badge-outline"><spring:message code="ui.795"/></span>
  </div>
  <%@ include file="../fragments/metrics.jspf" %>
  <div class="enterprise-columns">
    <section class="enterprise-panel enterprise-main">
      <div class="enterprise-panel-head">
        <div>
          <span class="section-kicker"><spring:message code="ui.755"/></span>
          <h2><spring:message code="ui.756"/></h2>
        </div>
        <span class="enterprise-muted"><spring:message code="ui.757"/></span>
      </div>
      <div class="enterprise-toolbar">
        <label class="sr-only" for="crm-search"><spring:message code="ui.758"/></label>
        <input id="crm-search" class="input input-bordered input-sm" placeholder="${msg_ui_758}" data-enterprise-search="crm-accounts">
        <label class="sr-only" for="crm-status"><spring:message code="ui.721"/></label>
        <select id="crm-status" class="select select-bordered select-sm" data-enterprise-status="crm-accounts">
          <option value=""><spring:message code="ui.083"/></option>
          <option value="Healthy"><spring:message code="ui.445"/></option>
          <option value="At risk"><spring:message code="ui.439"/></option>
          <option value="New"><spring:message code="ui.827"/></option>
        </select>
        <span class="enterprise-muted" data-enterprise-count="crm-accounts"><spring:message code="ui.723"/></span>
      </div>
      <div class="table-wrap">
        <table class="table enterprise-table">
          <thead>
            <tr>
              <th><spring:message code="ui.759"/></th>
              <th><spring:message code="ui.361"/></th>
              <th><spring:message code="ui.760"/></th>
              <th class="enterprise-number"><spring:message code="ui.761"/></th>
              <th><span class="sr-only"><spring:message code="ui.264"/></span></th>
            </tr>
          </thead>
          <tbody data-enterprise-table="crm-accounts">
            <c:forEach items="${demo.records}" var="record">
              <tr data-enterprise-row data-status="${fn:escapeXml(record.status)}">
                <td><strong><spring:message code="${messageCodes[record.name]}" text="${record.name}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[record.detail]}" text="${record.detail}" htmlEscape="true"/></small></td>
                <td><spring:message code="${messageCodes[record.owner]}" text="${record.owner}" htmlEscape="true"/></td>
                <td><span class="badge badge-${record.tone} badge-soft"><spring:message code="${messageCodes[record.status]}" text="${record.status}" htmlEscape="true"/></span></td>
                <td class="mono enterprise-number"><spring:message code="${messageCodes[record.value]}" text="${record.value}" htmlEscape="true"/></td>
                <td><button class="btn btn-ghost btn-xs" type="button" data-detail="${fn:escapeXml(record.name)}"><spring:message code="ui.286"/></button></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <p class="enterprise-empty" data-enterprise-empty="crm-accounts" hidden><spring:message code="ui.727"/></p>
    </section>
    <aside class="enterprise-stack">
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker"><spring:message code="ui.762"/></span>
            <h2>Acme Industries</h2>
          </div>
          <span class="badge badge-success badge-soft"><spring:message code="ui.445"/></span>
        </div>
        <dl class="enterprise-facts">
          <div>
            <dt><spring:message code="ui.346"/></dt>
            <dd><spring:message code="ui.1172"/></dd>
          </div>
          <div>
            <dt><spring:message code="ui.347"/></dt>
            <dd>Ana Marić</dd>
          </div>
          <div>
            <dt><spring:message code="ui.765"/></dt>
            <dd>3 · €210K</dd>
          </div>
          <div>
            <dt><spring:message code="ui.766"/></dt>
            <dd><spring:message code="ui.1173"/></dd>
          </div>
          <div>
            <dt><spring:message code="ui.767"/></dt>
            <dd><spring:message code="ui.768"/></dd>
          </div>
        </dl>
      </section>
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker"><spring:message code="ui.769"/></span>
            <h2><spring:message code="ui.770"/></h2>
          </div>
          <span class="enterprise-muted"><spring:message code="ui.771"/></span>
        </div>
        <div class="enterprise-list">
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.353"/> <small>Acme Industries</small></span>
            <strong><spring:message code="ui.791"/></strong>
          </div>
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.773"/> <small>Northstar Labs</small></span>
            <strong><spring:message code="ui.301"/></strong>
          </div>
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.774"/> <small>Meridian Group</small></span>
            <strong><spring:message code="ui.303"/></strong>
          </div>
        </div>
      </section>
    </aside>
  </div>
  <section class="enterprise-panel enterprise-bottom">
    <div class="enterprise-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.775"/></span>
        <h2><spring:message code="ui.776"/></h2>
      </div>
      <span class="enterprise-muted"><spring:message code="ui.777"/></span>
    </div>
    <div class="table-wrap">
      <table class="table enterprise-table">
        <thead>
          <tr>
            <th><spring:message code="ui.778"/></th>
            <th><spring:message code="ui.779"/></th>
            <th class="enterprise-number"><spring:message code="ui.362"/></th>
            <th><spring:message code="ui.781"/></th>
            <th><spring:message code="ui.782"/></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong><spring:message code="ui.783"/></strong></td>
            <td class="mono">12</td>
            <td class="mono enterprise-number">€410K</td>
            <td><spring:message code="ui.787"/></td>
            <td>02 Oct</td>
          </tr>
          <tr>
            <td><strong><spring:message code="ui.784"/></strong></td>
            <td class="mono">8</td>
            <td class="mono enterprise-number">€385K</td>
            <td><spring:message code="ui.788"/></td>
            <td>30 Sep</td>
          </tr>
          <tr>
            <td><strong><spring:message code="ui.785"/></strong></td>
            <td class="mono">6</td>
            <td class="mono enterprise-number">€450K</td>
            <td><spring:message code="ui.789"/></td>
            <td>29 Sep</td>
          </tr>
          <tr>
            <td><strong><spring:message code="ui.786"/></strong></td>
            <td class="mono">3</td>
            <td class="mono enterprise-number">€235K</td>
            <td><spring:message code="ui.790"/></td>
            <td>01 Oct</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
