document.addEventListener('click', e => {
  const isDropdownToggle = e.target.matches("[data-dropdown-toggle]");

  if (!isDropdownToggle && e.target.closest("[data-dropdown]") != null) {
    return;
  }

  let currentDropdown;
  if (isDropdownToggle) {
    currentDropdown = e.target.closest("[data-dropdown]");
    currentDropdown.classList.toggle('active');
  }

  document.querySelectorAll("[data-dropdown].active").forEach(dropdown => {
    if (dropdown === currentDropdown) {
      return;
    }
    dropdown.classList.remove('active');
  });
})

let menuSwipeStartX = 0;
let menuSwipeEndX = 0;
let menuSwipeStartY = 0;
let menuSwipeEndY = 0;
if (isTouchDevice()) {
  const menuSwipeArea = document.body;
  menuSwipeArea.addEventListener("touchstart", e => {
    menuSwipeStartX = e.changedTouches[0].screenX;
    menuSwipeStartY = e.changedTouches[0].screenY;
  }, false);
  menuSwipeArea.addEventListener("touchend", e => {
    menuSwipeEndX = e.changedTouches[0].screenX;
    menuSwipeEndY = e.changedTouches[0].screenY;
    menuGesture();
  }, false);
  menuSwipeArea.addEventListener("touchcancel", e => {
    menuSwipeEndX = e.changedTouches[0].screenX;
    menuSwipeEndY = e.changedTouches[0].screenY;
    menuGesture();
  }, false);
  function menuGesture() {
    if (menuSwipeEndX > (menuSwipeStartX + 10) &&
      Math.abs(menuSwipeStartX - menuSwipeEndX) > Math.abs(menuSwipeStartY - menuSwipeEndY)) {
      document.querySelectorAll("[data-dropdown].active").forEach(dropdown => {
        dropdown.classList.remove('active');
      })
    } else if ((menuSwipeEndX + 10) < menuSwipeStartX &&
      Math.abs(menuSwipeStartX - menuSwipeEndX) > Math.abs(menuSwipeStartY - menuSwipeEndY)) {
      const e = document.querySelector("[data-dropdown]");
      e.classList.add("active");
    }
    menuSwipeStartX = 0;
    menuSwipeEndX = 0;
    menuSwipeStartY = 0;
    menuSwipeEndY = 0;
  }
}
