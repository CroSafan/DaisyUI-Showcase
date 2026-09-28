<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<section class="card panel-card">
  <div class="panel-head">
    <div>
      <span class="section-kicker">RECORD OPERATIONS</span>
      <h2>Customer records</h2>
    </div>
    <button class="btn btn-primary btn-sm" data-toast="New record action">New record ↗</button>
  </div>
  <form class="toolbar" method="get" action="${pageContext.request.contextPath}/showcase/data">
    <label class="sr-only" for="record-search">Search records</label>
    <input id="record-search" name="q" class="input input-bordered input-sm" type="search" placeholder="Search name or ID" value="${fn:escapeXml(query)}">
    <label class="sr-only" for="record-status">Filter by status</label>
    <select id="record-status" name="status" class="select select-bordered select-sm">
      <option value="all" ${filterStatus eq 'all' ? 'selected' : ''}>All statuses</option>
      <option value="Active" ${filterStatus eq 'Active' ? 'selected' : ''}>Active</option>
      <option value="Pending" ${filterStatus eq 'Pending' ? 'selected' : ''}>Pending</option>
      <option value="Review" ${filterStatus eq 'Review' ? 'selected' : ''}>Review</option>
    </select>
    <button class="btn btn-neutral btn-sm" type="submit">Apply filters</button>
    <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/showcase/data">Reset</a>
    <span class="selection" data-selection-count>0 selected</span>
    <button class="btn btn-outline btn-sm" type="button" data-toast="Bulk action is a demo">Bulk action</button>
  </form>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col">
            <input type="checkbox" class="checkbox checkbox-sm" data-select-all aria-label="Select all visible records">
          </th>
          <th scope="col">ID ↕</th>
          <th scope="col">Name ↕</th>
          <th scope="col">Owner</th>
          <th scope="col">Status</th>
          <th scope="col">Value</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty records}">
            <tr>
              <td colspan="7">
                <div class="alert alert-info">No records match your search. Try another term or clear the filter.</div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${records}" var="record">
              <tr>
                <td><input type="checkbox" class="checkbox checkbox-sm" data-row-select aria-label="Select ${record.id}"></td>
                <td class="mono"><c:out value="${record.id}"/></td>
                <td><strong><c:out value="${record.name}"/></strong><small><c:out value="${record.detail}"/></small></td>
                <td><c:out value="${record.owner}"/></td>
                <td><span class="badge badge-${record.tone} badge-soft"><c:out value="${record.status}"/></span></td>
                <td class="mono"><c:out value="${record.value}"/></td>
                <td>
                  <button class="btn btn-ghost btn-xs" data-detail="${fn:escapeXml(record.name)}" type="button">Detail</button>
                  <button class="btn btn-ghost btn-xs" data-toast="Edit is a demo" type="button">Edit</button>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </div>
  <div class="pagination-wrap">
    <span>Showing ${records.size()} of ${resultCount} results</span>
    <div class="join">
      <c:forEach begin="1" end="${totalPages}" var="n">
        <a class="join-item btn btn-sm ${pageNumber eq n ? 'btn-active' : ''}" href="${pageContext.request.contextPath}/showcase/data?page=${n}&amp;q=${fn:escapeXml(query)}&amp;status=${fn:escapeXml(filterStatus)}" aria-label="Page ${n}">
          ${n}
        </a>
      </c:forEach>
    </div>
  </div>
</section>
<div class="two-grid section-block">
  <div class="alert alert-warning">
    ⚠ Loading state:
    <span class="loading loading-dots loading-sm"></span>
    Fetching updated records…
  </div>
  <div class="alert alert-info">ⓘ Empty state appears when no records match a search.</div>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
