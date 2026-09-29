(() => {
  const languageSelect = document.querySelector("[data-language-select]");
  languageSelect?.addEventListener("change", () => {
    const url = new URL(window.location.href);
    url.searchParams.set("lang", languageSelect.value);
    window.location.assign(url.toString());
  });
})();
