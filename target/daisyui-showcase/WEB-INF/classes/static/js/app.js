(() => {
  const root = document.documentElement;
  const languageSelects = document.querySelectorAll("[data-language-select]");
  const language = (() => {
    try {
      return localStorage.getItem("showcase-language") || "hr";
    } catch (_) {
      return "hr";
    }
  })();
  const translatableTerms = new Set([
    "team",
    "teams",
    "operations",
    "product",
    "support",
    "day",
    "approved",
    "pending",
    "covered",
    "cover",
    "review",
    "scheduled",
    "waiting",
    "critical",
    "high",
    "medium",
    "low",
    "active",
    "ready",
    "open",
    "closed",
    "shown",
    "sep",
    "oct",
    "nov",
    "dec",
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday",
  ]);
  const originals = new WeakMap();
  let translations = [];
  let applyingLanguage = false;
  let languageObserver;
  function translated(value) {
    const trimmed = value.trim();
    const exact = translations.find(
      (entry) => entry.source.toLocaleLowerCase() === trimmed.toLocaleLowerCase(),
    );
    if (exact) return value.replace(trimmed, exact.target);
    let result = value;
    for (const entry of translations) {
      if (
        !entry.source ||
        (!/\s/.test(entry.source) && !translatableTerms.has(entry.source.toLocaleLowerCase()))
      )
        continue;
      const escaped = entry.source.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
      result = result.replace(
        new RegExp(`(?<![\\p{L}\\p{N}])${escaped}(?![\\p{L}\\p{N}])`, "giu"),
        entry.target,
      );
    }
    result = result
      .replace(/\bAcross\s+(\d+)\s+people\b/gi, (_, count) => `Ukupno ${count} zaposlenika`)
      .replace(
        /\b(\d+)\s+of\s+(\d+)\s+person-days\b/gi,
        (_, done, total) => `${done} od ${total} osoba-dana`,
      )
      .replace(/\b(\d+)\s+days\b/gi, (_, count) => `${count} dana`)
      .replace(/\b(\d+(?:[.,]\d+)?)\s+hours?\b/gi, (_, value) => {
        const number = Number(value.replace(",", "."));
        const noun =
          number === 1 ? "sat" : number % 1 !== 0 || [2, 3, 4].includes(number) ? "sata" : "sati";
        return `${value.replace(".", ",")} ${noun}`;
      });
    return result;
  }
  function translateTree(scope = document) {
    languageObserver?.disconnect();
    applyingLanguage = true;
    const walker = document.createTreeWalker(scope, NodeFilter.SHOW_TEXT, {
      acceptNode(node) {
        const parent = node.parentElement;
        if (
          !parent ||
          parent.closest("script,style,noscript,textarea,code,pre,[data-no-translate]")
        )
          return NodeFilter.FILTER_REJECT;
        return node.data.trim() ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT;
      },
    });
    let node;
    while ((node = walker.nextNode())) {
      if (!originals.has(node)) originals.set(node, node.data);
      const source = originals.get(node);
      node.data = translated(source);
    }
    const attrs = ["placeholder", "title", "aria-label", "aria-description"];
    scope.querySelectorAll?.("*").forEach((element) =>
      attrs.forEach((attribute) => {
        if (!element.hasAttribute(attribute)) return;
        const key = `${attribute}:${attribute}`;
        let stored = originals.get(element);
        if (!stored) {
          stored = {};
          originals.set(element, stored);
        }
        if (!(key in stored)) stored[key] = element.getAttribute(attribute);
        element.setAttribute(attribute, translated(stored[key]));
      }),
    );
    applyingLanguage = false;
    root.lang = activeLanguage;
    languageObserver?.observe(document.body, {
      childList: true,
      characterData: true,
      subtree: true,
    });
  }
  let activeLanguage = language;
  async function setLanguage(next, persist = true) {
    activeLanguage = next === "en" ? "en" : "hr";
    languageSelects.forEach((select) => {
      select.value = activeLanguage;
    });
    if (persist) {
      try {
        localStorage.setItem("showcase-language", activeLanguage);
      } catch (_) {}
    }
    try {
      const response = await fetch(
        `${root.dataset.contextPath || ""}/i18n/catalog?lang=${activeLanguage}`,
        { headers: { Accept: "application/json" } },
      );
      if (response.ok)
        translations = (await response.json()).sort((a, b) => b.source.length - a.source.length);
    } catch (_) {
      translations = [];
    }
    translateTree();
  }
  languageSelects.forEach((select) =>
    select.addEventListener("change", () => setLanguage(select.value)),
  );
  languageObserver = new MutationObserver((records) => {
    if (applyingLanguage || activeLanguage !== "hr") return;
    for (const record of records) {
      if (record.type === "characterData") originals.delete(record.target);
      record.addedNodes?.forEach((added) => {
        if (added.nodeType === Node.TEXT_NODE) originals.delete(added);
        else if (added.nodeType === Node.ELEMENT_NODE) translateTree(added);
      });
    }
    if (records.some((record) => record.type === "characterData")) translateTree();
  });
  languageObserver.observe(document.body, { childList: true, characterData: true, subtree: true });
  setLanguage(language, false);

  const theme = root.dataset.pageTheme || localStorage.getItem("showcase-theme") || "corporate";
  root.dataset.theme = theme;
  document.querySelectorAll("[data-theme-select]").forEach((select) => {
    select.value = theme;
    select.addEventListener("change", () => {
      root.dataset.theme = select.value;
      try {
        localStorage.setItem("showcase-theme", select.value);
      } catch (_) {}
      document.querySelectorAll("[data-theme-select]").forEach((other) => {
        other.value = select.value;
      });
    });
  });
  document.querySelectorAll("[data-set-theme]").forEach((button) =>
    button.addEventListener("click", () => {
      const selected = button.dataset.setTheme;
      root.dataset.theme = selected;
      try {
        localStorage.setItem("showcase-theme", selected);
      } catch (_) {}
      document.querySelectorAll("[data-theme-select]").forEach((select) => {
        select.value = selected;
      });
      document
        .querySelectorAll("[data-set-theme]")
        .forEach((option) => option.setAttribute("aria-pressed", String(option === button)));
    }),
  );
  document.querySelectorAll("[data-detail]").forEach((button) =>
    button.addEventListener("click", () => {
      const dialog = document.getElementById("detail-dialog");
      if (!dialog) return;
      dialog.querySelector("#dialog-record").textContent = button.dataset.detail;
      dialog.showModal();
    }),
  );
  let toastTimer;
  document.querySelectorAll("[data-toast]").forEach((button) =>
    button.addEventListener("click", () => {
      let toast = document.getElementById("showcase-toast");
      if (!toast) {
        toast = document.createElement("div");
        toast.id = "showcase-toast";
        toast.className = "toast toast-end";
        toast.setAttribute("role", "status");
        document.body.appendChild(toast);
      }
      const message = button.dataset.toast || "Action complete";
      toast.innerHTML = "";
      const alert = document.createElement("div");
      alert.className = "alert alert-success";
      alert.textContent = message;
      toast.appendChild(alert);
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => toast.remove(), 3500);
    }),
  );
  document.querySelectorAll("[data-select-all]").forEach((master) =>
    master.addEventListener("change", () => {
      document.querySelectorAll("[data-row-select]").forEach((box) => {
        box.checked = master.checked;
      });
      updateSelection();
    }),
  );
  document
    .querySelectorAll("[data-row-select]")
    .forEach((box) => box.addEventListener("change", updateSelection));
  function updateSelection() {
    const count = document.querySelectorAll("[data-row-select]:checked").length;
    const indicator = document.querySelector("[data-selection-count]");
    if (indicator) indicator.textContent = `${count} selected`;
  }
  document.querySelectorAll("[data-approve]").forEach((button) =>
    button.addEventListener("click", () => {
      const row = button.closest("[data-approval-row]");
      if (row) {
        row.querySelector("[data-approval-status]").textContent =
          button.dataset.approve === "yes" ? "Approved in demo" : "Rejected in demo";
        row.classList.add("muted-row");
      }
    }),
  );
  document.querySelectorAll("[data-multi-choice]").forEach((group) => {
    const options = [...group.querySelectorAll("[data-multi-option]")];
    const count = group.querySelector("[data-multi-count]");
    const update = () => {
      count.textContent = String(options.filter((option) => option.checked).length);
    };
    options.forEach((option) => option.addEventListener("change", update));
    update();
  });
  document.querySelectorAll("[data-enterprise-table]").forEach((table) => {
    const id = table.dataset.enterpriseTable;
    const search = document.querySelector(`[data-enterprise-search="${id}"]`);
    const status = document.querySelector(`[data-enterprise-status="${id}"]`);
    const count = document.querySelector(`[data-enterprise-count="${id}"]`);
    const empty = document.querySelector(`[data-enterprise-empty="${id}"]`);
    const update = () => {
      let shown = 0;
      table.querySelectorAll("[data-enterprise-row]").forEach((row) => {
        const matchesText = row.textContent
          .toLocaleLowerCase()
          .includes((search?.value || "").trim().toLocaleLowerCase());
        const matchesStatus = !status?.value || row.dataset.status === status.value;
        row.hidden = !(matchesText && matchesStatus);
        if (!row.hidden) shown++;
      });
      if (count) count.textContent = `${shown} shown`;
      if (empty) empty.hidden = shown > 0;
    };
    search?.addEventListener("input", update);
    status?.addEventListener("change", update);
  });
})();
