<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<div class="enterprise-workspace">
  <%@ include file="../fragments/page-title.jspf" %>
  <div class="enterprise-context">
    <span><strong>ERP / OPERATIONS</strong> · Zagreb plant · September 2026</span>
    <span class="badge badge-outline">Enterprise theme</span>
  </div>
  <%@ include file="../fragments/metrics.jspf" %>
  <div class="enterprise-columns">
    <section class="enterprise-panel enterprise-main">
      <div class="enterprise-panel-head">
        <div>
          <span class="section-kicker">PROCUREMENT</span>
          <h2>Purchase order queue</h2>
        </div>
        <span class="enterprise-muted">4 records · 3 require action</span>
      </div>
      <div class="enterprise-toolbar">
        <label class="sr-only" for="erp-search">Search orders</label>
        <input id="erp-search" class="input input-bordered input-sm" placeholder="Search orders" data-enterprise-search="erp-orders">
        <label class="sr-only" for="erp-status">Filter status</label>
        <select id="erp-status" class="select select-bordered select-sm" data-enterprise-status="erp-orders">
          <option value="">All statuses</option>
          <option value="Awaiting approval">Awaiting approval</option>
          <option value="In transit">In transit</option>
          <option value="Scheduled">Scheduled</option>
          <option value="Attention">Attention</option>
        </select>
        <span class="enterprise-muted" data-enterprise-count="erp-orders">4 shown</span>
      </div>
      <div class="table-wrap">
        <table class="table enterprise-table">
          <thead>
            <tr>
              <th>Reference / description</th>
              <th>Owner</th>
              <th>Status</th>
              <th class="enterprise-number">Amount / quantity</th>
              <th><span class="sr-only">Action</span></th>
            </tr>
          </thead>
          <tbody data-enterprise-table="erp-orders">
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
      <p class="enterprise-empty" data-enterprise-empty="erp-orders" hidden>No matching records.</p>
    </section>
    <aside class="enterprise-stack">
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker">EXCEPTIONS</span>
            <h2>Needs attention</h2>
          </div>
          <span class="badge badge-warning badge-soft">4 open</span>
        </div>
        <div class="enterprise-list">
          <div>
            <span class="enterprise-list-title">Cycle count variance <small>INV-7624</small></span>
            <strong>18 items</strong>
          </div>
          <div><span class="enterprise-list-title">Spend threshold <small>PO-10482</small></span><strong>€48,200</strong></div>
          <div>
            <span class="enterprise-list-title">Late supplier confirmation <small>PO-10476</small></span>
            <strong>2 days</strong>
          </div>
          <div>
            <span class="enterprise-list-title">Production material gap <small>Line B</small></span>
            <strong>120 units</strong>
          </div>
        </div>
      </section>
      <section class="enterprise-panel">
        <div class="enterprise-panel-head">
          <div>
            <span class="section-kicker">CAPACITY</span>
            <h2>Today by function</h2>
          </div>
        </div>
        <div class="enterprise-capacity">
          <div>
            <span>Purchasing</span>
            <strong>12 requests</strong>
            <progress class="progress progress-primary" value="62" max="100"></progress>
          </div>
          <div>
            <span>Warehouse availability</span>
            <strong>98.2%</strong>
            <progress class="progress progress-success" value="98" max="100"></progress>
          </div>
          <div>
            <span>Production schedule</span>
            <strong>4,820 units</strong>
            <progress class="progress progress-info" value="74" max="100"></progress>
          </div>
        </div>
      </section>
    </aside>
  </div>
  <section class="enterprise-panel enterprise-bottom">
    <div class="enterprise-panel-head">
      <div>
        <span class="section-kicker">FULFILLMENT</span>
        <h2>Warehouse movement</h2>
      </div>
      <span class="enterprise-muted">Updated 09:42</span>
    </div>
    <div class="table-wrap">
      <table class="table enterprise-table">
        <thead>
          <tr>
            <th>Site</th>
            <th>On hand</th>
            <th>Allocated</th>
            <th>Available</th>
            <th>Service level</th>
            <th>Next action</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Central · Zagreb</strong></td>
            <td class="mono">18,420</td>
            <td class="mono">4,810</td>
            <td class="mono">13,610</td>
            <td><span class="badge badge-success badge-soft">98.7%</span></td>
            <td>Cycle count · 14:00</td>
          </tr>
          <tr>
            <td><strong>West · Rijeka</strong></td>
            <td class="mono">8,960</td>
            <td class="mono">2,150</td>
            <td class="mono">6,810</td>
            <td><span class="badge badge-success badge-soft">97.9%</span></td>
            <td>Transfer receipt · 11:30</td>
          </tr>
          <tr>
            <td><strong>East · Osijek</strong></td>
            <td class="mono">6,280</td>
            <td class="mono">1,990</td>
            <td class="mono">4,290</td>
            <td><span class="badge badge-warning badge-soft">94.1%</span></td>
            <td>Replenishment · 16:00</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
