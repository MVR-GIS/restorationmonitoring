document.addEventListener("DOMContentLoaded", function () {
  if (!window.location.pathname.endsWith("/RESEARCH-DESIGN-GUIDE.html")) return;

  document.querySelectorAll('a[href^="https://github.com/MVR-GIS/restorationmonitoring/blob/main/"]').forEach(function (link) {
    var path = new URL(link.href).pathname;
    if (!path.toLowerCase().endsWith(".md")) return;
    link.target = "_blank";
    link.rel = "noopener noreferrer";
    link.setAttribute("aria-label", link.textContent.trim() + " (opens in a new tab)");
  });
});
