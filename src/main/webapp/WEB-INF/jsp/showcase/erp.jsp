<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<spring:message code="ui.720" var="msg_ui_720"/>
<div class="enterprise-workspace">
  <%@ include file="../fragments/page-title.jspf" %>
  <div class="enterprise-context">
    <span><strong><spring:message code="ui.711"/></strong> <spring:message code="ui.1174"/></span>
    <span class="badge badge-outline"><spring:message code="ui.795"/></span>
  </div>
  <%@ include file="../fragments/metrics.jspf" %>
  <div class="enterprise-columns">
    <section class="enterprise-panel enterprise-main">
      <div class="enterprise-panel-head">
        <div>
          <span class="section-kicker"><spring:message code="ui.717"/></span>
          <h2><spring:message code="ui.718"/></h2>
        </div>
        <span class="enterprise-muted"><spring:message code="ui.719"/></span>
      </div>
      <div class="enterprise-toolbar">
        <label class="sr-only" for="erp-search"><spring:message code="ui.720"/></label>
        <input id="erp-search" class="input input-bordered input-sm" placeholder="${msg_ui_720}" data-enterprise-search="erp-orders">
        <label class="sr-only" for="erp-status"><spring:message code="ui.721"/></label>
        <select id="erp-status" class="select select-bordered select-sm" data-enterprise-status="erp-orders">
          <option value=""><spring:message code="ui.083"/></option>
          <option value="Awaiting approval"><spring:message code="ui.816"/></option>
          <option value="In transit"><spring:message code="ui.817"/></option>
          <option value="Scheduled"><spring:message code="ui.413"/></option>
          <option value="Attention"><spring:message code="ui.818"/></option>
        </select>
        <span class="enterprise-muted" data-enterprise-count="erp-orders"><spring:message code="ui.723"/></span>
      </div>
      <div class="table-wrap">
        <table class="table enterprise-table">
          <thead>
            <tr>
              <th><spring:message code="ui.724"/></th>
              <th><spring:message code="ui.361"/></th>
              <th><spring:message code="ui.092"/></th>
              <th class="enterprise-number"><spring:message code="ui.725"/></th>
              <th><span class="sr-only"><spring:message code="ui.264"/></span></th>
            </tr>
          </thead>
          <tbody data-enterprise-table="erp-orders">
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
      <p class="enterprise-empty" data-enterprise-empty="erp-orders" hidden><spring:message code="ui.727"/></p>
    </section>
    <aside class="enterprise-stack">
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker"><spring:message code="ui.097"/></span>
            <h2><spring:message code="ui.729"/></h2>
          </div>
          <span class="badge badge-warning badge-soft"><spring:message code="ui.730"/></span>
        </div>
        <div class="enterprise-list">
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.731"/> <small>INV-7624</small></span>
            <strong><spring:message code="ui.732"/></strong>
          </div>
          <div><span class="enterprise-list-title"><spring:message code="ui.733"/> <small>PO-10482</small></span><strong>€48,200</strong></div>
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.734"/> <small>PO-10476</small></span>
            <strong><spring:message code="ui.896"/></strong>
          </div>
          <div>
            <span class="enterprise-list-title"><spring:message code="ui.735"/> <small><spring:message code="ui.830"/></small></span>
            <strong><spring:message code="ui.736"/></strong>
          </div>
        </div>
      </section>
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker"><spring:message code="ui.446"/></span>
            <h2><spring:message code="ui.738"/></h2>
          </div>
        </div>
        <div class="enterprise-capacity">
          <div>
            <span><spring:message code="ui.739"/></span>
            <strong><spring:message code="ui.740"/></strong>
            <progress class="progress progress-primary" value="62" max="100"></progress>
          </div>
          <div>
            <span><spring:message code="ui.741"/></span>
            <strong>98.2%</strong>
            <progress class="progress progress-success" value="98" max="100"></progress>
          </div>
          <div>
            <span><spring:message code="ui.742"/></span>
            <strong><spring:message code="ui.897"/></strong>
            <progress class="progress progress-info" value="74" max="100"></progress>
          </div>
        </div>
      </section>
    </aside>
  </div>
  <section class="enterprise-panel enterprise-bottom">
    <div class="enterprise-panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.743"/></span>
        <h2><spring:message code="ui.426"/></h2>
      </div>
      <span class="enterprise-muted"><spring:message code="ui.745"/></span>
    </div>
    <div class="table-wrap">
      <table class="table enterprise-table">
        <thead>
          <tr>
            <th><spring:message code="ui.746"/></th>
            <th><spring:message code="ui.747"/></th>
            <th><spring:message code="ui.748"/></th>
            <th><spring:message code="ui.142"/></th>
            <th><spring:message code="ui.750"/></th>
            <th><spring:message code="ui.751"/></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong><spring:message code="ui.1175"/></strong></td>
            <td class="mono">18,420</td>
            <td class="mono">4,810</td>
            <td class="mono">13,610</td>
            <td><span class="badge badge-success badge-soft">98.7%</span></td>
            <td><spring:message code="ui.1176"/></td>
          </tr>
          <tr>
            <td><strong><spring:message code="ui.1177"/></strong></td>
            <td class="mono">8,960</td>
            <td class="mono">2,150</td>
            <td class="mono">6,810</td>
            <td><span class="badge badge-success badge-soft">97.9%</span></td>
            <td><spring:message code="ui.1178"/></td>
          </tr>
          <tr>
            <td><strong><spring:message code="ui.1179"/></strong></td>
            <td class="mono">6,280</td>
            <td class="mono">1,990</td>
            <td class="mono">4,290</td>
            <td><span class="badge badge-warning badge-soft">94.1%</span></td>
            <td><spring:message code="ui.1180"/></td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
