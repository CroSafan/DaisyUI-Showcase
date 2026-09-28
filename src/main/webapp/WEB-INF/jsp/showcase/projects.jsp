<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<section class="section-block">
  <div class="section-head">
    <div>
      <span class="section-kicker">SPRINT BOARD</span>
      <h2>Customer portal · Sprint 12</h2>
    </div>
    <div class="avatar-stack"><span>MK</span><span>NP</span><span>SN</span><span>+3</span></div>
  </div>
  <div class="kanban">
    <div class="kanban-column">
      <h3>Backlog <span class="badge badge-ghost badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-neutral badge-sm">NORMAL</span>
        <strong>Reporting export</strong>
        <small>PRJ-433 · Due 08 Oct</small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-warning badge-sm">HIGH</span>
        <strong>Accessibility audit</strong>
        <small>PRJ-428 · Due 06 Oct</small>
      </div>
    </div>
    <div class="kanban-column">
      <h3>In progress <span class="badge badge-info badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-error badge-sm">CRITICAL</span>
        <strong>Billing API migration</strong>
        <small>PRJ-386 · Noah Petrović</small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-primary badge-sm">DESIGN</span>
        <strong>Dashboard prototype</strong>
        <small>PRJ-419 · Mia Kovač</small>
      </div>
    </div>
    <div class="kanban-column">
      <h3>Review & done <span class="badge badge-success badge-sm">2</span></h3>
      <div class="kanban-task">
        <span class="badge badge-warning badge-sm">REVIEW</span>
        <strong>Customer portal beta</strong>
        <small>PRJ-412 · Due Friday</small>
      </div>
      <div class="kanban-task">
        <span class="badge badge-success badge-sm">DONE</span>
        <strong>Design system audit</strong>
        <small>PRJ-421 · Completed</small>
      </div>
    </div>
  </div>
</section>
<div class="alert alert-info section-block">
  ⓘ Milestone: Customer portal beta planned for Friday. Two review items remain.
</div>
<div class="content-grid section-block">
  <%@ include file="../fragments/record-table.jspf" %>
  <%@ include file="../fragments/insight.jspf" %>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
