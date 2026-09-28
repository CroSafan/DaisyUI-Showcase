<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker">CHOOSE AN IDENTITY</span>
      <h2>Nine styles, one component system</h2>
    </div>
    <span class="badge badge-primary badge-soft">Saved automatically</span>
  </div>
  <div class="component-pad">
    <div class="theme-swatches">
      <c:forEach items="${fn:split('light|dark|corporate|enterprise|business|black|synthwave|neutral|cupcake','|')}" var="theme">
        <button type="button" class="theme-swatch" data-set-theme="${theme}" aria-label="Use ${theme} theme">
          <strong><c:out value="${theme}"/></strong>
          <div class="swatch-colors" data-theme="${theme}"><i></i><i></i><i></i><i></i></div>
        </button>
      </c:forEach>
    </div>
  </div>
</section>
<div class="content-grid">
  <section class="card panel-card">
    <div class="panel-head">
      <div>
        <span class="section-kicker">LIVE MINI INTERFACE</span>
        <h2>Customer overview</h2>
      </div>
      <div class="tabs tabs-box"><button class="tab tab-active">Overview</button><button class="tab">Activity</button></div>
    </div>
    <div class="component-pad component-stack">
      <div class="alert alert-info">ⓘ All surfaces and semantic colors update together.</div>
      <div class="three-grid">
        <div class="card bg-base-200">
          <div class="card-body">
            <small>ACTIVE ACCOUNTS</small>
            <strong class="metric-value">1,284</strong>
            <span class="badge badge-success">↑ 8.1%</span>
          </div>
        </div>
        <div class="card bg-base-200">
          <div class="card-body">
            <small>REVENUE</small>
            <strong class="metric-value">€428K</strong>
            <span class="badge badge-primary">Monthly</span>
          </div>
        </div>
        <div class="card bg-base-200">
          <div class="card-body">
            <small>AT RISK</small>
            <strong class="metric-value">12</strong>
            <span class="badge badge-warning">Review</span>
          </div>
        </div>
      </div>
      <div class="form-grid">
        <div class="field">
          <label for="theme-email">Contact email</label>
          <input id="theme-email" class="input input-bordered" placeholder="name@company.com">
        </div>
        <div class="field">
          <label for="theme-status">Account status</label>
          <select id="theme-status" class="select select-bordered"><option>Active</option><option>Pending</option></select>
        </div>
      </div>
      <div class="component-row">
        <button class="btn btn-primary" data-toast="Theme preview saved">Save changes</button>
        <button class="btn btn-outline">Cancel</button>
        <span class="badge badge-error badge-soft">Urgent</span>
        <span class="badge badge-success badge-soft">Healthy</span>
      </div>
    </div>
  </section>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/foot.jspf" %>
