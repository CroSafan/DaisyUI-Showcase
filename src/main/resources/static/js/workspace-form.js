(() => {
  const root = document.documentElement;
  const themeSelect = document.querySelector("[data-theme-select]");
  if (themeSelect) {
    themeSelect.value = root.dataset.theme;
    themeSelect.addEventListener("change", () => {
      root.dataset.theme = themeSelect.value;
      try {
        localStorage.setItem("showcase-theme", themeSelect.value);
      } catch (_) {
        // Theme selection still works when browser storage is disabled.
      }
    });
  }

  const languageSelect = document.querySelector("[data-language-select]");
  languageSelect?.addEventListener("change", () => {
    const url = new URL(window.location.href);
    url.searchParams.set("lang", languageSelect.value);
    window.location.assign(url.toString());
  });

  const form = document.getElementById("supplier-form");
  if (!form) return;

  const storageKey = "daisy-lab-supplier-form-draft";
  const status = document.getElementById("form-status");
  const companyPreview = document.getElementById("review-company");
  const companyName = form.elements.namedItem("legalName");
  const sla = document.getElementById("sla-range");
  const slaValue = document.getElementById("sla-value");
  const fileInput = form.elements.namedItem("files");
  const fileSummary = document.getElementById("file-summary");
  const currency = form.elements.namedItem("currency");
  const moneySymbol = form.querySelector(".wf-money > span");

  const showStatus = (message) => {
    status.textContent = message;
    status.hidden = false;
  };

  const updateDerived = () => {
    companyPreview.textContent = companyName.value.trim() || form.dataset.companyFallback;
    slaValue.value = `${sla.value}%`;
    moneySymbol.textContent = { EUR: "€", USD: "$", GBP: "£" }[currency.value] || "€";
    const files = Array.from(fileInput.files || [], (file) => file.name);
    fileSummary.textContent = files.length ? files.join(", ") : form.dataset.fileEmpty;
  };

  const serialize = () => {
    const data = {};
    for (const control of form.elements) {
      if (!control.name || control.type === "file" || control.type === "password") continue;
      if (control.type === "radio") {
        if (control.checked) data[control.name] = control.value;
      } else if (control.type === "checkbox") {
        if (control.name === "regions") {
          data.regions ??= [];
          if (control.checked) data.regions.push(control.value);
        } else {
          data[control.name] = control.checked;
        }
      } else if (control.multiple) {
        data[control.name] = Array.from(control.selectedOptions, (option) => option.value);
      } else {
        data[control.name] = control.value;
      }
    }
    return data;
  };

  const restore = (data) => {
    for (const control of form.elements) {
      if (!control.name || !(control.name in data)) continue;
      const value = data[control.name];
      if (control.type === "radio") control.checked = control.value === value;
      else if (control.type === "checkbox") {
        control.checked = control.name === "regions" ? value.includes(control.value) : Boolean(value);
      } else if (control.multiple) {
        for (const option of control.options) option.selected = value.includes(option.value);
      } else if (control.type !== "file" && control.type !== "password") {
        control.value = value;
      }
    }
    updateDerived();
  };

  try {
    const saved = sessionStorage.getItem(storageKey);
    if (saved) {
      restore(JSON.parse(saved));
      showStatus(form.dataset.draftRestored);
    }
  } catch (_) {
    // The form remains usable when browser storage is disabled.
  }

  form.querySelectorAll("[data-save-draft]").forEach((button) => {
    button.addEventListener("click", () => {
      try {
        sessionStorage.setItem(storageKey, JSON.stringify(serialize()));
        showStatus(form.dataset.draftSaved);
      } catch (_) {
        showStatus(form.dataset.draftSaved);
      }
    });
  });

  document.querySelectorAll("[data-save-draft]").forEach((button) => {
    if (form.contains(button)) return;
    button.addEventListener("click", () => form.querySelector("[data-save-draft]").click());
  });

  form.addEventListener("input", updateDerived);
  form.addEventListener("change", updateDerived);
  form.addEventListener("reset", () => {
    try {
      sessionStorage.removeItem(storageKey);
    } catch (_) {}
    requestAnimationFrame(() => {
      updateDerived();
      showStatus(form.dataset.cleared);
    });
  });
  form.addEventListener("submit", (event) => {
    event.preventDefault();
    if (!form.reportValidity()) return;
    showStatus(form.dataset.submitted);
    status.scrollIntoView({ behavior: "smooth", block: "nearest" });
  });

  const links = Array.from(document.querySelectorAll(".wf-nav-link"));
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries.filter((entry) => entry.isIntersecting).sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
        if (!visible) return;
        for (const link of links) {
          const active = link.hash === `#${visible.target.id}`;
          link.classList.toggle("is-active", active);
          if (active) link.setAttribute("aria-current", "step");
          else link.removeAttribute("aria-current");
        }
      },
      { rootMargin: "-12% 0px -65% 0px", threshold: [0, 0.1, 0.5] },
    );
    document.querySelectorAll(".wf-section").forEach((section) => observer.observe(section));
  }

  updateDerived();
})();
