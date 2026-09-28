<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker">CATALOG HEALTH</span>
      <h2>Products to watch</h2>
    </div>
    <button class="btn btn-outline btn-sm" data-toast="Catalog opened in demo">Manage products</button>
  </div>
  <div class="three-grid">
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-primary) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◈
        </div>
        <h3>Studio desk lamp</h3>
        <p>Lighting · SKU LMP-204</p>
        <span class="badge badge-warning">8 left in stock</span>
        <strong>€89</strong>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-secondary) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◧
        </div>
        <h3>Everyday tote</h3>
        <p>Accessories · SKU BAG-142</p>
        <span class="badge badge-success">124 in stock</span>
        <strong>€42</strong>
      </div>
    </article>
    <article class="card feature-card">
      <div class="card-body">
        <div class="product-thumb" style="background:color-mix(in srgb,var(--color-accent) 20%,var(--color-base-100));height:90px;border-radius:.5rem;display:grid;place-items:center;font-size:2.5rem">
          ◬
        </div>
        <h3>Ceramic set</h3>
        <p>Homeware · SKU CRM-018</p>
        <span class="badge badge-warning">6 left in stock</span>
        <strong>€126</strong>
      </div>
    </article>
  </div>
</section>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
