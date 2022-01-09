export function get_importmap() {
  const elms = document.getElementsByTagName("script");
  const elm = Array.from(elms).find(
    (elm) => elm.getAttribute("type") == "importmap"
  );
  return JSON.parse(elm.text);
}
