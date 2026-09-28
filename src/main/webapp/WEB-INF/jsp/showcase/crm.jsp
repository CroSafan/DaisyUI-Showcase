<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<div class="enterprise-workspace">
  <%@ include file="../fragments/page-title.jspf" %>
  <div class="enterprise-context">
    <span><strong>CRM / SALES</strong> · Enterprise segment · Q3 2026</span>
    <span class="badge badge-outline">Enterprise theme</span>
  </div>
  <%@ include file="../fragments/metrics.jspf" %>
  <div class="enterprise-columns">
    <section class="enterprise-panel enterprise-main">
      <div class="enterprise-panel-head">
        <div>
          <span class="section-kicker">ACCOUNT PORTFOLIO</span>
          <h2>Accounts requiring follow-up</h2>
        </div>
        <span class="enterprise-muted">218 accounts · 4 highlighted</span>
      </div>
      <div class="enterprise-toolbar">
        <label class="sr-only" for="crm-search">Search accounts</label>
        <input id="crm-search" class="input input-bordered input-sm" placeholder="Search accounts" data-enterprise-search="crm-accounts">
        <label class="sr-only" for="crm-status">Filter status</label>
        <select id="crm-status" class="select select-bordered select-sm" data-enterprise-status="crm-accounts">
          <option value="">All statuses</option>
          <option value="Healthy">Healthy</option>
          <option value="At risk">At risk</option>
          <option value="New">New</option>
        </select>
        <span class="enterprise-muted" data-enterprise-count="crm-accounts">4 shown</span>
      </div>
      <div class="table-wrap">
        <table class="table enterprise-table">
          <thead>
            <tr>
              <th>Account / segment</th>
              <th>Owner</th>
              <th>Health</th>
              <th class="enterprise-number">Open value</th>
              <th><span class="sr-only">Action</span></th>
            </tr>
          </thead>
          <tbody data-enterprise-table="crm-accounts">
            <c:forEach items="${demo.records}" var="record">
              <tr data-enterprise-row data-status="${fn:escapeXml(record.status)}">
                <td><strong><c:out value="${record.name}"/></strong><small><c:out value="${record.detail}"/></small></td>
                <td><c:out value="${record.owner}"/></td>
                <td><span class="badge badge-${record.tone} badge-soft"><c:out value="${record.status}"/></span></td>
                <td class="mono enterprise-number"><c:out value="${record.value}"/></td>
                <td><button class="btn btn-ghost btn-xs" type="button" data-detail="${fn:escapeXml(record.name)}">View</button></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <p class="enterprise-empty" data-enterprise-empty="crm-accounts" hidden>No matching records.</p>
    </section>
    <aside class="enterprise-stack">
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker">ACCOUNT 360</span>
            <h2>Acme Industries</h2>
          </div>
          <span class="badge badge-success badge-soft">Healthy</span>
        </div>
        <dl class="enterprise-facts">
          <div>
            <dt>Primary contact</dt>
            <dd>Marina Radić · VP Operations</dd>
          </div>
          <div>
            <dt>Account owner</dt>
            <dd>Ana Marić</dd>
          </div>
          <div>
            <dt>Open opportunities</dt>
            <dd>3 · €210K</dd>
          </div>
          <div>
            <dt>Next renewal</dt>
            <dd>09 Nov 2026 · 42 days</dd>
          </div>
          <div>
            <dt>Last interaction</dt>
            <dd>Today · rollout call</dd>
          </div>
        </dl>
      </section>
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker">NEXT ACTIONS</span>
            <h2>Priority tasks</h2>
          </div>
          <span class="enterprise-muted">3 due this week</span>
        </div>
        <div class="enterprise-list">
          <div>
            <span class="enterprise-list-title">Send renewal proposal <small>Acme Industries</small></span>
            <strong>Tomorrow</strong>
          </div>
          <div>
            <span class="enterprise-list-title">Schedule risk review <small>Northstar Labs</small></span>
            <strong>Wed</strong>
          </div>
          <div>
            <span class="enterprise-list-title">Confirm decision maker <small>Meridian Group</small></span>
            <strong>Fri</strong>
          </div>
        </div>
      </section>
    </aside>
  </div>
  <section class="enterprise-panel enterprise-bottom">
    <div class="enterprise-panel-head">
      <div>
        <span class="section-kicker">PIPELINE</span>
        <h2>Opportunity stages</h2>
      </div>
      <span class="enterprise-muted">29 active · €1.48M total</span>
    </div>
    <div class="table-wrap">
      <table class="table enterprise-table">
        <thead>
          <tr>
            <th>Stage</th>
            <th>Deals</th>
            <th class="enterprise-number">Value</th>
            <th>Forecast</th>
            <th>Next review</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Qualification</strong></td>
            <td class="mono">12</td>
            <td class="mono enterprise-number">€410K</td>
            <td>Early</td>
            <td>02 Oct</td>
          </tr>
          <tr>
            <td><strong>Discovery</strong></td>
            <td class="mono">8</td>
            <td class="mono enterprise-number">€385K</td>
            <td>Developing</td>
            <td>30 Sep</td>
          </tr>
          <tr>
            <td><strong>Proposal</strong></td>
            <td class="mono">6</td>
            <td class="mono enterprise-number">€450K</td>
            <td>Committed</td>
            <td>29 Sep</td>
          </tr>
          <tr>
            <td><strong>Negotiation</strong></td>
            <td class="mono">3</td>
            <td class="mono enterprise-number">€235K</td>
            <td>Closing</td>
            <td>01 Oct</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
