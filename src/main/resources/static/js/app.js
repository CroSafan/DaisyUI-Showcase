(() => {
  const root = document.documentElement;
  document.querySelectorAll("[data-language-select]").forEach((select) => {
    select.addEventListener("change", () => {
      const url = new URL(window.location.href);
      url.searchParams.set("lang", select.value);
      window.location.assign(url.toString());
    });
  });

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
      const message = button.dataset.toast || root.dataset.actionComplete;
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
    if (indicator) indicator.textContent = `${count} ${root.dataset.selectionSuffix}`;
  }
  document.querySelectorAll("[data-approve]").forEach((button) =>
    button.addEventListener("click", () => {
      const row = button.closest("[data-approval-row]");
      if (row) {
        row.querySelector("[data-approval-status]").textContent =
          button.dataset.approve === "yes"
            ? root.dataset.approvedInDemo
            : root.dataset.rejectedInDemo;
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
      if (count) count.textContent = `${shown} ${root.dataset.shownSuffix}`;
      if (empty) empty.hidden = shown > 0;
    };
    search?.addEventListener("input", update);
    status?.addEventListener("change", update);
  });
})();
