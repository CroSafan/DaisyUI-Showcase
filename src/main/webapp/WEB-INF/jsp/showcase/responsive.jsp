<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker">FLUID BY DESIGN</span>
      <h2>One system across four widths</h2>
    </div>
  </div>
  <div class="component-pad">
    <div class="responsive-demo">
      <div class="device-card">
        <div class="device-frame phone"><i></i><i></i><i></i></div>
        <strong>Mobile · 360px</strong>
        <small>Drawer navigation, stacked cards</small>
      </div>
      <div class="device-card">
        <div class="device-frame tablet"><i></i><i></i></div>
        <strong>Tablet · 768px</strong>
        <small>Two-column composition</small>
      </div>
      <div class="device-card">
        <div class="device-frame desktop"><i></i><i></i><i></i></div>
        <strong>Desktop · 1440px+</strong>
        <small>Full navigation and dense panels</small>
      </div>
    </div>
  </div>
</section>
<%@ include file="../fragments/metrics.jspf" %>
<div class="content-grid">
  <%@ include file="../fragments/record-table.jspf" %>
  <section class="card insight-card">
    <div class="card-body">
      <span class="section-kicker">TRY IT YOURSELF</span>
      <h2>Resize this window</h2>
      <p>
        The navigation becomes a drawer, metrics and forms stack, and the table scrolls within its own container. No page-wide horizontal scrolling is needed.
      </p>
      <div class="form-grid">
        <div class="field">
          <label for="responsive-name">Project name</label>
          <input class="input input-bordered" id="responsive-name" placeholder="Project Atlas">
        </div>
        <div class="field">
          <label for="responsive-team">Team</label>
          <select class="select select-bordered" id="responsive-team"><option>Operations</option><option>Product</option></select>
        </div>
      </div>
      <button class="btn btn-primary" data-toast="Responsive form action">Continue</button>
    </div>
  </section>
</div>
<%@ include file="../fragments/foot.jspf" %>
