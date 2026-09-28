<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<div class="two-grid section-block">
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">ROUTE VIEW</span>
      <h2>Zagreb to Munich</h2>
      <p>SH-2084 · Atlas Freight · delayed at carrier handoff</p>
      <div class="route-map" role="img" aria-label="Shipment route from Zagreb through Vienna to Munich">
        <span class="route-node"></span>
        <span class="route-line"></span>
        <span class="route-node"></span>
        <span class="route-line"></span>
        <span class="route-node"></span>
      </div>
      <div class="route-labels"><span>Zagreb</span><span>Vienna</span><span>Munich</span></div>
      <div class="alert alert-warning">⚠ Exception: estimated arrival moved by one day.</div>
    </div>
  </section>
  <section class="card surface-card">
    <div class="card-body">
      <span class="section-kicker">NETWORK PULSE</span>
      <h2>Warehouse movement</h2>
      <ul class="activity-list">
        <li>
          <span class="activity-dot"></span>
          <div><strong>Central warehouse dispatch</strong><small>128 pallets · 09:42</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>West warehouse receiving</strong><small>64 pallets · 09:18</small></div>
        </li>
        <li>
          <span class="activity-dot"></span>
          <div><strong>Supplier dock appointment</strong><small>Orion Supply · 11:30</small></div>
        </li>
      </ul>
    </div>
  </section>
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
