<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/page-title.jspf" %>
<div class="alert alert-info showcase-section">
  <span>
    Browse the real DaisyUI components below. Controls are keyboard accessible and use native browser behavior where practical.
  </span>
</div>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker">ACTIONS & STATUS</span>
      <h2>Buttons, badges, alerts</h2>
    </div>
  </div>
  <div class="component-pad component-stack">
    <div>
      <p class="component-label">Button variants</p>
      <div class="component-row">
        <button class="btn btn-primary">Primary</button>
        <button class="btn btn-secondary">Secondary</button>
        <button class="btn btn-accent">Accent</button>
        <button class="btn btn-neutral">Neutral</button>
        <button class="btn btn-outline">Outline</button>
        <button class="btn btn-ghost">Ghost</button>
        <button class="btn btn-link">Link</button>
      </div>
    </div>
    <div>
      <p class="component-label">Sizes & states</p>
      <div class="component-row">
        <button class="btn btn-xs btn-primary">Tiny</button>
        <button class="btn btn-sm btn-primary">Small</button>
        <button class="btn btn-primary">Default</button>
        <button class="btn btn-lg btn-primary">Large</button>
        <button class="btn btn-primary" disabled>Disabled</button>
        <button class="btn btn-primary"><span class="loading loading-spinner loading-xs"></span>Working</button>
        <div class="join">
          <button class="btn btn-sm join-item">Day</button>
          <button class="btn btn-sm join-item btn-active">Week</button>
          <button class="btn btn-sm join-item">Month</button>
        </div>
      </div>
    </div>
    <div>
      <p class="component-label">Semantic feedback</p>
      <div class="component-row">
        <span class="badge badge-primary">Primary</span>
        <span class="badge badge-secondary">Secondary</span>
        <span class="badge badge-success">Success</span>
        <span class="badge badge-warning">Warning</span>
        <span class="badge badge-error">Error</span>
        <span class="badge badge-info">Info</span>
        <span class="badge badge-outline">Outline</span>
      </div>
    </div>
    <div class="two-grid">
      <div class="alert alert-success">✓ Saved successfully. Your changes are ready.</div>
      <div class="alert alert-warning">⚠ Review the pending items before continuing.</div>
      <div class="alert alert-error">✕ The connection needs attention.</div>
      <div class="alert alert-info">ⓘ A new release is available.</div>
    </div>
  </div>
</section>
<div class="two-grid">
  <section class="card panel-card showcase-section">
    <div class="panel-head">
      <div>
        <span class="section-kicker">DISCLOSURE</span>
        <h2>Tabs, accordion, dropdown</h2>
      </div>
    </div>
    <div class="component-pad component-stack">
      <div role="tablist" class="tabs tabs-box">
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="Overview" checked>
        <div role="tabpanel" class="tab-content p-4">Overview content with useful context.</div>
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="Activity">
        <div role="tabpanel" class="tab-content p-4">Recent activity and events.</div>
        <input type="radio" name="gallery-tabs" role="tab" class="tab" aria-label="Settings">
        <div role="tabpanel" class="tab-content p-4">Configuration options.</div>
      </div>
      <div class="collapse collapse-arrow bg-base-200">
        <input type="checkbox" aria-label="Expand implementation notes">
        <div class="collapse-title font-semibold">How does this expand?</div>
        <div class="collapse-content text-sm">A native checkbox drives the DaisyUI disclosure pattern.</div>
      </div>
      <details class="dropdown">
        <summary class="btn btn-outline btn-sm">Open dropdown ▾</summary>
        <ul class="menu dropdown-content bg-base-100 rounded-box z-10 w-52 p-2 shadow">
          <li><a href="${pageContext.request.contextPath}/showcase/themes">Themes</a></li>
          <li><a href="${pageContext.request.contextPath}/showcase/forms">Forms</a></li>
        </ul>
      </details>
    </div>
  </section>
  <section class="card panel-card showcase-section">
    <div class="panel-head">
      <div>
        <span class="section-kicker">PROGRESS & PEOPLE</span>
        <h2>Stats, avatars, indicators</h2>
      </div>
    </div>
    <div class="component-pad component-stack">
      <div class="stats stats-vertical shadow bg-base-200">
        <div class="stat">
          <div class="stat-title">Active users</div>
          <div class="stat-value text-primary">12.8K</div>
          <div class="stat-desc">↗ 8.1% this month</div>
        </div>
      </div>
      <div class="component-row">
        <div class="avatar-stack"><span>AN</span><span>MK</span><span>LP</span><span>+8</span></div>
        <div class="tooltip" data-tip="Available for review"><button class="btn btn-sm">Hover for tooltip</button></div>
        <span class="loading loading-ring loading-md" aria-label="Loading"></span>
      </div>
      <progress class="progress progress-primary" value="72" max="100" aria-label="72 percent complete"></progress>
      <div class="breadcrumbs text-sm">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li>Components</li>
          <li>Progress</li>
        </ul>
      </div>
    </div>
  </section>
</div>
<section class="card panel-card showcase-section">
  <div class="panel-head">
    <div>
      <span class="section-kicker">INPUTS & CONTENT</span>
      <h2>Forms, cards, tables, lists</h2>
    </div>
  </div>
  <div class="component-pad">
    <div class="three-grid">
      <div class="field">
        <label for="gallery-email">Email address</label>
        <input id="gallery-email" class="input input-bordered" type="email" placeholder="name@company.com">
        <span class="field-hint">We'll never share this address.</span>
      </div>
      <div class="field">
        <label for="gallery-select">Team</label>
        <select id="gallery-select" class="select select-bordered">
          <option>Choose a team</option>
          <option>Product</option>
          <option>Operations</option>
        </select>
      </div>
      <div class="field">
        <label for="gallery-search">Search</label>
        <input id="gallery-search" class="input input-bordered" type="search" placeholder="Find a record...">
      </div>
      <div class="field">
        <label for="gallery-notes">Notes</label>
        <textarea id="gallery-notes" class="textarea textarea-bordered" placeholder="Add context..."></textarea>
      </div>
      <div class="field">
        <span class="component-label">Choices</span>
        <label class="component-row"><input class="checkbox checkbox-primary" type="checkbox" checked> Notify me</label>
        <label class="component-row">
          <input class="radio radio-primary" type="radio" name="gallery-choice" checked>
          Option A
        </label>
        <label class="component-row"><input class="radio radio-primary" type="radio" name="gallery-choice"> Option B</label>
      </div>
      <div class="field">
        <span class="component-label">Controls</span>
        <label class="component-row"><input class="toggle toggle-primary" type="checkbox" checked> Enabled</label>
        <label for="gallery-range">Priority</label>
        <input id="gallery-range" class="range range-primary" type="range" min="0" max="100" value="65">
      </div>
    </div>
    <div class="divider">Composition</div>
    <div class="component-row">
      <div class="card bg-base-200 w-64">
        <div class="card-body">
          <h3 class="card-title">Compact card</h3>
          <p>Content stays readable across themes.</p>
          <div class="card-actions justify-end">
            <button class="btn btn-primary btn-sm" data-toast="Card action completed">Action</button>
          </div>
        </div>
      </div>
      <ul class="list bg-base-200 rounded-box w-64">
        <li class="list-row">◉ &nbsp; Customer onboarded</li>
        <li class="list-row">◉ &nbsp; Invoice approved</li>
        <li class="list-row">◉ &nbsp; Deployment complete</li>
      </ul>
      <div class="join">
        <button class="join-item btn btn-sm">«</button>
        <button class="join-item btn btn-sm btn-active">1</button>
        <button class="join-item btn btn-sm">2</button>
        <button class="join-item btn btn-sm">»</button>
      </div>
      <button class="btn btn-primary" type="button" data-detail="Example modal">Open modal</button>
    </div>
  </div>
</section>
<section class="card panel-card showcase-section component-input-demo" aria-labelledby="numeric-inputs-title">
  <div class="panel-head">
    <div>
      <span class="section-kicker">FORM CONTROLS</span>
      <h2 id="numeric-inputs-title">Numeric and multi-choice inputs</h2>
    </div>
  </div>
  <div class="component-pad component-stack">
    <div class="three-grid">
      <div class="field">
        <label for="gallery-decimal">Decimal</label>
        <input id="gallery-decimal" class="input input-bordered" type="number" inputmode="decimal" min="0" step="0.01" value="1234.56">
        <span class="field-hint">Two decimal places</span>
      </div>
      <div class="field">
        <label for="gallery-number">Whole number</label>
        <input id="gallery-number" class="input input-bordered" type="number" inputmode="numeric" min="0" step="1" value="42">
        <span class="field-hint">Steps in whole numbers</span>
      </div>
      <div class="field">
        <label for="gallery-percentage">Percentage</label>
        <div class="input input-bordered unit-input">
          <input id="gallery-percentage" type="number" inputmode="decimal" min="0" max="100" step="0.1" value="18.5">
          <span class="input-unit" aria-hidden="true">%</span>
        </div>
        <span class="field-hint">From 0 to 100 percent</span>
      </div>
    </div>
    <div>
      <p class="component-label">Money inputs with fixed currency</p>
      <div class="three-grid">
        <div class="field">
          <label for="gallery-eur">Euro (EUR)</label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">€</span>
            <input id="gallery-eur" type="number" inputmode="decimal" min="0" step="0.01" value="1250.00">
          </div>
        </div>
        <div class="field">
          <label for="gallery-usd">US dollar (USD)</label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">$</span>
            <input id="gallery-usd" type="number" inputmode="decimal" min="0" step="0.01" value="1500.00">
          </div>
        </div>
        <div class="field">
          <label for="gallery-gbp">British pound (GBP)</label>
          <div class="input input-bordered unit-input money-input">
            <span class="input-unit" aria-hidden="true">£</span>
            <input id="gallery-gbp" type="number" inputmode="decimal" min="0" step="0.01" value="995.00">
          </div>
        </div>
      </div>
      <span class="field-hint">Currency symbols remain fixed while you edit the amount.</span>
    </div>
    <div class="field multi-choice-field" data-multi-choice>
      <label id="gallery-departments-label">Multiple departments</label>
      <details class="dropdown multi-choice-dropdown">
        <summary class="select select-bordered multi-choice-trigger" aria-labelledby="gallery-departments-label gallery-departments-summary">
          <span id="gallery-departments-summary">Select departments</span>
          <span class="badge badge-primary badge-sm" data-multi-count aria-label="Selected count">2</span>
        </summary>
        <div class="multi-choice-menu dropdown-content bg-base-100 rounded-box shadow" role="group" aria-label="Departments">
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Operations" data-multi-option checked>
            Operations
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Product" data-multi-option checked>
            Product
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Support" data-multi-option>
            Support
          </label>
          <label>
            <input class="checkbox checkbox-primary checkbox-sm" type="checkbox" value="Finance" data-multi-option>
            Finance
          </label>
        </div>
      </details>
      <span class="field-hint">Choose more than one department.</span>
    </div>
  </div>
</section>
<%@ include file="../fragments/record-table.jspf" %>
<%@ include file="../fragments/dialog.jspf" %>
<%@ include file="../fragments/foot.jspf" %>
