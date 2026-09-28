<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker">SUBSCRIPTION PLANS</span>
      <h2>Flexible billing</h2>
    </div>
    <span class="badge badge-success">Monthly recurring revenue ↑</span>
  </div>
  <div class="three-grid">
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-ghost">STARTER</span>
        <h3>For a focused team</h3>
        <strong class="metric-value">€29<small>/mo</small></strong>
        <p>Up to 10 seats · Core reports · Email support</p>
        <button class="btn btn-outline btn-sm" data-toast="Plan selected in demo">Manage plan</button>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-primary">GROWTH</span>
        <h3>For a scaling team</h3>
        <strong class="metric-value">€99<small>/mo</small></strong>
        <p>Up to 100 seats · Advanced analytics · Integrations</p>
        <button class="btn btn-primary btn-sm" data-toast="Upgrade action in demo">Upgrade account</button>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <span class="badge badge-secondary">ENTERPRISE</span>
        <h3>For a complex organization</h3>
        <strong class="metric-value">Custom</strong>
        <p>Unlimited seats · SSO · Governance · Dedicated support</p>
        <button class="btn btn-outline btn-sm" data-toast="Account action in demo">View entitlements</button>
      </div>
    </article>
  </div>
</section>
<div class="alert alert-info section-block">
  ⓘ Usage monitoring: four Growth accounts are approaching their monthly entitlement limits.
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
