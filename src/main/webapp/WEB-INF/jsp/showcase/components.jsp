<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<spring:message code="ui.1128" var="msg_ui_1128"/>
<spring:message code="ui.1129" var="msg_ui_1129"/>
<spring:message code="ui.1130" var="msg_ui_1130"/>
<spring:message code="ui.1131" var="msg_ui_1131"/>
<spring:message code="ui.1132" var="msg_ui_1132"/>
<spring:message code="ui.1133" var="msg_ui_1133"/>
<spring:message code="ui.1134" var="msg_ui_1134"/>
<spring:message code="ui.1135" var="msg_ui_1135"/>
<spring:message code="ui.005" var="msg_ui_005"/>
<spring:message code="ui.436" var="msg_ui_436"/>
<spring:message code="ui.704" var="msg_ui_704"/>
<spring:message code="ui.705" var="msg_ui_705"/>
<div class="alert alert-info showcase-section">
  <span>
    <spring:message code="ui.860"/>
  </span>
</div>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.516"/></span>
      <h2><spring:message code="ui.517"/></h2>
    </div>
  </div>
  <div class="component-pad component-stack">
    <div>
      <p class="component-label"><spring:message code="ui.496"/></p>
      <div class="component-row">
        <button class="btn btn-primary"><spring:message code="ui.489"/></button>
        <button class="btn btn-secondary"><spring:message code="ui.490"/></button>
        <button class="btn btn-accent"><spring:message code="ui.491"/></button>
        <button class="btn btn-neutral"><spring:message code="ui.492"/></button>
        <button class="btn btn-outline"><spring:message code="ui.493"/></button>
        <button class="btn btn-ghost"><spring:message code="ui.494"/></button>
        <button class="btn btn-link"><spring:message code="ui.495"/></button>
      </div>
    </div>
    <div>
      <p class="component-label"><spring:message code="ui.497"/></p>
      <div class="component-row">
        <button class="btn btn-xs btn-primary"><spring:message code="ui.483"/></button>
        <button class="btn btn-sm btn-primary"><spring:message code="ui.484"/></button>
        <button class="btn btn-primary"><spring:message code="ui.485"/></button>
        <button class="btn btn-lg btn-primary"><spring:message code="ui.486"/></button>
        <button class="btn btn-primary" disabled><spring:message code="ui.398"/></button>
        <button class="btn btn-primary"><span class="loading loading-spinner loading-xs"></span><spring:message code="ui.488"/></button>
        <div class="join">
          <button class="btn btn-sm join-item"><spring:message code="ui.212"/></button>
          <button class="btn btn-sm join-item btn-active"><spring:message code="ui.284"/></button>
          <button class="btn btn-sm join-item"><spring:message code="ui.283"/></button>
        </div>
      </div>
    </div>
    <div>
      <p class="component-label"><spring:message code="ui.498"/></p>
      <div class="component-row">
        <span class="badge badge-primary"><spring:message code="ui.489"/></span>
        <span class="badge badge-secondary"><spring:message code="ui.490"/></span>
        <span class="badge badge-success"><spring:message code="ui.394"/></span>
        <span class="badge badge-warning"><spring:message code="ui.395"/></span>
        <span class="badge badge-error"><spring:message code="ui.396"/></span>
        <span class="badge badge-info"><spring:message code="ui.861"/></span>
        <span class="badge badge-outline"><spring:message code="ui.493"/></span>
      </div>
    </div>
    <div class="two-grid">
      <div class="alert alert-success"><spring:message code="ui.862"/></div>
      <div class="alert alert-warning"><spring:message code="ui.863"/></div>
      <div class="alert alert-error"><spring:message code="ui.864"/></div>
      <div class="alert alert-info"><spring:message code="ui.865"/></div>
    </div>
  </div>
</section>
<div class="two-grid">
  <section class="card panel-card showcase-section">
    <div class="panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.525"/></span>
        <h2><spring:message code="ui.526"/></h2>
      </div>
    </div>
    <div class="component-pad component-stack">
      <div role="tablist" class="tabs tabs-box">
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="${msg_ui_005}" checked>
        <div role="tabpanel" class="tab-content p-4"><spring:message code="ui.478"/></div>
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="${msg_ui_436}">
        <div role="tabpanel" class="tab-content p-4"><spring:message code="ui.479"/></div>
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="${msg_ui_1128}">
        <div role="tabpanel" class="tab-content p-4"><spring:message code="ui.480"/></div>
      </div>
      <div class="collapse collapse-arrow bg-base-200">
        <input type="checkbox" aria-label="${msg_ui_1129}">
        <div class="collapse-title font-semibold"><spring:message code="ui.481"/></div>
        <div class="collapse-content text-sm"><spring:message code="ui.482"/></div>
      </div>
      <details class="dropdown">
        <summary class="btn btn-outline btn-sm"><spring:message code="ui.866"/></summary>
        <ul class="menu dropdown-content bg-base-100 rounded-box z-10 w-52 p-2 shadow">
          <li><a href="${pageContext.request.contextPath}/showcase/themes"><spring:message code="ui.476"/></a></li>
          <li><a href="${pageContext.request.contextPath}/showcase/forms"><spring:message code="ui.477"/></a></li>
        </ul>
      </details>
    </div>
  </section>
  <section class="card panel-card showcase-section">
    <div class="panel-head">
      <div>
        <span class="section-kicker"><spring:message code="ui.527"/></span>
        <h2><spring:message code="ui.528"/></h2>
      </div>
    </div>
    <div class="component-pad component-stack">
      <div class="stats stats-vertical shadow bg-base-200">
        <div class="stat">
          <div class="stat-title"><spring:message code="ui.320"/></div>
          <div class="stat-value text-primary">12.8K</div>
          <div class="stat-desc"><spring:message code="ui.1170"/></div>
        </div>
      </div>
      <div class="component-row">
        <div class="avatar-stack"><span>AN</span><span>MK</span><span>LP</span><span>+8</span></div>
        <div class="tooltip" data-tip="${msg_ui_1130}"><button class="btn btn-sm"><spring:message code="ui.867"/></button></div>
        <span class="loading loading-ring loading-md" aria-label="${msg_ui_1131}"></span>
      </div>
      <progress class="progress progress-primary" value="72" max="100" aria-label="${msg_ui_1132}"></progress>
      <div class="breadcrumbs text-sm">
        <ul>
          <li><a href="${pageContext.request.contextPath}/"><spring:message code="ui.317"/></a></li>
          <li><spring:message code="ui.318"/></li>
          <li><spring:message code="ui.319"/></li>
        </ul>
      </div>
    </div>
  </section>
</div>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.529"/></span>
      <h2><spring:message code="ui.530"/></h2>
    </div>
  </div>
  <div class="component-pad">
    <div class="three-grid">
      <div class="field">
        <label for="gallery-email"><spring:message code="ui.322"/></label>
        <input id="gallery-email" class="input input-bordered" type="email" placeholder="name@company.com">
        <span class="field-hint"><spring:message code="ui.323"/></span>
      </div>
      <div class="field">
        <label for="gallery-select"><spring:message code="ui.089"/></label>
        <select id="gallery-select" class="select select-bordered">
          <option><spring:message code="ui.324"/></option>
          <option><spring:message code="ui.325"/></option>
          <option><spring:message code="ui.326"/></option>
        </select>
      </div>
      <div class="field">
        <label for="gallery-search"><spring:message code="ui.327"/></label>
        <input id="gallery-search" class="input input-bordered" type="search" placeholder="${msg_ui_1133}">
      </div>
      <div class="field">
        <label for="gallery-notes"><spring:message code="ui.328"/></label>
        <textarea id="gallery-notes" class="textarea textarea-bordered" placeholder="${msg_ui_1134}"></textarea>
      </div>
      <div class="field">
        <span class="component-label"><spring:message code="ui.868"/></span>
        <label class="component-row"><input class="checkbox checkbox-primary" type="checkbox" checked> <spring:message code="ui.329"/></label>
        <label class="component-row">
          <input class="radio radio-primary" type="radio" name="gallery-choice" checked>
          <spring:message code="ui.534"/>
        </label>
        <label class="component-row"><input class="radio radio-primary" type="radio" name="gallery-choice"> <spring:message code="ui.535"/></label>
      </div>
      <div class="field">
        <span class="component-label"><spring:message code="ui.869"/></span>
        <label class="component-row"><input class="toggle toggle-primary" type="checkbox" checked> <spring:message code="ui.330"/></label>
        <label for="gallery-range"><spring:message code="ui.331"/></label>
        <input id="gallery-range" class="range range-primary" type="range" min="0" max="100" value="65">
      </div>
    </div>
    <div class="divider"><spring:message code="ui.870"/></div>
    <div class="component-row">
      <div class="card bg-base-200 w-64">
        <div class="card-body">
          <h3 class="card-title"><spring:message code="ui.536"/></h3>
          <p><spring:message code="ui.332"/></p>
          <div class="card-actions justify-end">
            <button class="btn btn-primary btn-sm" data-toast="${msg_ui_1135}"><spring:message code="ui.264"/></button>
          </div>
        </div>
      </div>
      <ul class="list bg-base-200 rounded-box w-64">
        <li class="list-row"><spring:message code="ui.871"/></li>
        <li class="list-row"><spring:message code="ui.872"/></li>
        <li class="list-row"><spring:message code="ui.873"/></li>
      </ul>
      <div class="join">
        <button class="join-item btn btn-sm">«</button>
        <button class="join-item btn btn-sm btn-active">1</button>
        <button class="join-item btn btn-sm">2</button>
        <button class="join-item btn btn-sm">»</button>
      </div>
      <button class="btn btn-primary" type="button" data-detail="Example modal"><spring:message code="ui.336"/></button>
    </div>
  </div>
</section>
<section class="card panel-card showcase-section component-input-demo" aria-labelledby="numeric-inputs-title">
  <div class="panel-head">
    <div>
      <span class="section-kicker"><spring:message code="ui.689"/></span>
      <h2 id="numeric-inputs-title"><spring:message code="ui.690"/></h2>
    </div>
  </div>
  <div class="component-pad component-stack">
    <div class="three-grid">
      <div class="field">
        <label for="gallery-decimal"><spring:message code="ui.691"/></label>
        <input id="gallery-decimal" class="input input-bordered" type="number" inputmode="decimal" min="0" step="0.01" value="1234.56">
        <span class="field-hint"><spring:message code="ui.692"/></span>
      </div>
      <div class="field">
        <label for="gallery-number"><spring:message code="ui.693"/></label>
        <input id="gallery-number" class="input input-bordered" type="number" inputmode="numeric" min="0" step="1" value="42">
        <span class="field-hint"><spring:message code="ui.694"/></span>
      </div>
      <div class="field">
        <label for="gallery-percentage"><spring:message code="ui.695"/></label>
        <div class="input input-bordered unit-input">
          <input id="gallery-percentage" type="number" inputmode="decimal" min="0" max="100" step="0.1" value="18.5">
          <span class="input-unit" aria-hidden="true">%</span>
        </div>
        <span class="field-hint"><spring:message code="ui.696"/></span>
      </div>
    </div>
    <div>
      <p class="component-label"><spring:message code="ui.697"/></p>
      <div class="three-grid">
        <div class="field">
          <label for="gallery-eur"><spring:message code="ui.698"/></label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">€</span>
            <input id="gallery-eur" type="number" inputmode="decimal" min="0" step="0.01" value="1250.00">
          </div>
        </div>
        <div class="field">
          <label for="gallery-usd"><spring:message code="ui.699"/></label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">$</span>
            <input id="gallery-usd" type="number" inputmode="decimal" min="0" step="0.01" value="1500.00">
          </div>
        </div>
        <div class="field">
          <label for="gallery-gbp"><spring:message code="ui.700"/></label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">£</span>
            <input id="gallery-gbp" type="number" inputmode="decimal" min="0" step="0.01" value="995.00">
          </div>
        </div>
      </div>
      <span class="field-hint"><spring:message code="ui.701"/></span>
    </div>
    <div class="field multi-choice-field" data-multi-choice>
      <label id="gallery-departments-label"><spring:message code="ui.702"/></label>
      <details class="dropdown multi-choice-dropdown">
        <summary class="select select-bordered multi-choice-trigger" aria-labelledby="gallery-departments-label gallery-departments-summary">
          <span id="gallery-departments-summary"><spring:message code="ui.703"/></span>
          <span class="badge badge-primary badge-sm" data-multi-count aria-label="${msg_ui_704}">2</span>
        </summary>
        <div class="multi-choice-menu dropdown-content bg-base-100 rounded-box shadow" role="group" aria-label="${msg_ui_705}">
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Operations" data-multi-option checked>
            <spring:message code="ui.326"/>
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Product" data-multi-option checked>
            <spring:message code="ui.325"/>
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Support" data-multi-option>
            <spring:message code="ui.656"/>
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Finance" data-multi-option>
            <spring:message code="ui.706"/>
          </label>
        </div>
      </details>
      <span class="field-hint"><spring:message code="ui.707"/></span>
    </div>
  </div>
</section>
<%@ include file="../fragments/record-table.jspf" %>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
