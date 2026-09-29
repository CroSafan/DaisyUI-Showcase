<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<%@ include file="../fragments/metrics.jspf" %>
<spring:message code="ui.1136" var="msg_ui_1136"/>
<spring:message code="ui.1137" var="msg_ui_1137"/>
<spring:message code="ui.1138" var="msg_ui_1138"/>
<spring:message code="ui.1139" var="msg_ui_1139"/>
<spring:message code="ui.1140" var="msg_ui_1140"/>
<section class="card panel-card">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.355"/></span>
      <h2><spring:message code="ui.356"/></h2>
    </div>
    <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1136}"><spring:message code="ui.874"/></button>
  </div>
  <form class="toolbar" method="get" action="${pageContext.request.contextPath}/showcase/data">
    <label class="sr-only" for="record-search"><spring:message code="ui.084"/></label>
    <input id="record-search" name="q" class="input input-bordered input-sm" type="search" placeholder="${msg_ui_1137}" value="${fn:escapeXml(query)}">
    <label class="sr-only" for="record-status"><spring:message code="ui.085"/></label>
    <select id="record-status" name="status" class="select select-bordered select-sm">
      <option value="all" ${filterStatus eq 'all' ? 'selected' : ''}><spring:message code="ui.083"/></option>
      <option value="Active" ${filterStatus eq 'Active' ? 'selected' : ''}><spring:message code="ui.674"/></option>
      <option value="Pending" ${filterStatus eq 'Pending' ? 'selected' : ''}><spring:message code="ui.076"/></option>
      <option value="Review" ${filterStatus eq 'Review' ? 'selected' : ''}><spring:message code="ui.667"/></option>
    </select>
    <button class="btn btn-neutral btn-sm" type="submit"><spring:message code="ui.875"/></button>
    <a class="btn btn-ghost btn-sm" href="${pageContext.request.contextPath}/showcase/data"><spring:message code="ui.080"/></a>
    <span class="selection" data-selection-count><spring:message code="ui.876"/></span>
    <button class="btn btn-outline btn-sm" type="button" data-toast="${msg_ui_1138}"><spring:message code="ui.359"/></button>
  </form>
  <div class="table-wrap">
    <table class="table table-zebra">
      <thead>
        <tr>
          <th scope="col">
            <input type="checkbox" class="checkbox checkbox-sm" data-select-all aria-label="${msg_ui_1139}">
          </th>
          <th scope="col"><spring:message code="ui.877"/></th>
          <th scope="col"><spring:message code="ui.878"/></th>
          <th scope="col"><spring:message code="ui.361"/></th>
          <th scope="col"><spring:message code="ui.092"/></th>
          <th scope="col"><spring:message code="ui.362"/></th>
          <th scope="col"><spring:message code="ui.363"/></th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${empty records}">
            <tr>
              <td colspan="7">
                <div class="alert alert-info"><spring:message code="ui.879"/></div>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${records}" var="record">
              <tr>
                <td><input type="checkbox" class="checkbox checkbox-sm" data-row-select aria-label="Select ${record.id}"></td>
                <td class="mono"><spring:message code="${messageCodes[record.id]}" text="${record.id}" htmlEscape="true"/></td>
                <td><strong><spring:message code="${messageCodes[record.name]}" text="${record.name}" htmlEscape="true"/></strong><small><spring:message code="${messageCodes[record.detail]}" text="${record.detail}" htmlEscape="true"/></small></td>
                <td><spring:message code="${messageCodes[record.owner]}" text="${record.owner}" htmlEscape="true"/></td>
                <td><span class="badge badge-${record.tone} badge-soft"><spring:message code="${messageCodes[record.status]}" text="${record.status}" htmlEscape="true"/></span></td>
                <td class="mono"><spring:message code="${messageCodes[record.value]}" text="${record.value}" htmlEscape="true"/></td>
                <td>
                  <button class="btn btn-ghost btn-xs" data-detail="${fn:escapeXml(record.name)}" type="button"><spring:message code="ui.880"/></button>
                  <button class="btn btn-ghost btn-xs" data-toast="${msg_ui_1140}" type="button"><spring:message code="ui.602"/></button>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </div>
  <div class="pagination-wrap">
    <span><spring:message code="ui.1197" arguments="${records.size()},${resultCount}"/></span>
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
    <spring:message code="ui.881"/>
    <span class="loading loading-dots loading-sm"></span>
    <spring:message code="ui.882"/>
  </div>
  <div class="alert alert-info"><spring:message code="ui.883"/></div>
</div>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
