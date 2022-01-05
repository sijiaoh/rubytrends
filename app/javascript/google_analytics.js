document.documentElement.addEventListener("turbo:load", () => {
  gtag("event", "page_view", {
    page_title: document.title,
    page_location: location.href,
    page_path: location.pathname,
  });
});
