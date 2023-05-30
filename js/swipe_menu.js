/*!
 * Run a callback after the user scrolls, calculating the distance and direction scrolled
 * (c) 2021 Chris Ferdinandi, MIT License, https://gomakethings.com
 * @param  {Function} callback The callback function to run
 * @param  {Integer}  refresh  How long to wait between scroll events [optional]
 */
function scrollDistance (callback, refresh = 100) {

	// Make sure a valid callback was provided
	if (!callback || typeof callback !== 'function') return;

	// Variables
	let isScrolling, start, end, distance;

	// Listen for scroll events
	window.addEventListener('scroll', function (event) {

		// Set starting position
		if (!start) {
			start = window.pageYOffset;
		}

		// Clear our timeout throughout the scroll
		window.clearTimeout(isScrolling);

		// Set a timeout to run after scrolling ends
		isScrolling = setTimeout(function() {

			// Calculate distance
			end = window.pageYOffset;
			distance = end - start;

			// Run the callback
			callback(distance, start, end);

			// Reset calculations
			start = null;
			end = null;
			distance = null;

		}, refresh);

	}, false);

}

let acc_distance = 0;
let scroll_updates = 0;
scrollDistance(function (distance) {
  if (document.querySelectorAll("[data-dropdown].active").length !== 0) {
    acc_distance += distance;
    scroll_updates += 1;
    if (acc_distance > 1000 || acc_distance < -2000 || scroll_updates >= 3) {
      document.querySelectorAll("[data-dropdown].active").forEach(dropdown => {
        dropdown.classList.remove('active');
      });
      acc_distance = 0;
      scroll_updates = 0;
    }
  }
});



document.addEventListener('click', e => {
  const isDropdownToggle = e.target.matches("[data-dropdown-toggle]");

  const isMiniShopToggle = e.target.matches("[data-mini-shop-toggle]");
  if (isMiniShopToggle) {
    e.target.classList.toggle('active'); /* Make mini-button rotate */
    currentMiniShop = e.target.nextElementSibling;
    currentMiniShop.classList.toggle('active'); /* Toggle mini-shop's padding, width etc */
    menu = e.target.closest("[data-dropdown-menu]")
    menu.classList.toggle('has-mini-shop-active') /* Toggle parent menu to grow */
  }

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
  document.addEventListener("touchstart", e => {
    menuSwipeStartX = e.changedTouches[0].screenX;
    menuSwipeStartY = e.changedTouches[0].screenY;
  }, false);
  document.addEventListener("touchend", e => {
    menuSwipeEndX = e.changedTouches[0].screenX;
    menuSwipeEndY = e.changedTouches[0].screenY;
    menuGesture(e);
  }, false);
  document.addEventListener("touchcancel", e => {
    menuSwipeEndX = e.changedTouches[0].screenX;
    menuSwipeEndY = e.changedTouches[0].screenY;
    menuGesture(e);
  }, false);
  function menuGesture(e) {
    if (menuSwipeEndX > (menuSwipeStartX + 10) &&
      Math.abs(menuSwipeStartX - menuSwipeEndX) > Math.abs(menuSwipeStartY - menuSwipeEndY)) {
      if (e.target.closest(".carousel") !== null) {
        /* Try to slide the carousel if we're inside one */
        plusSlides(-1);
      } else if (e.target.closest(".pswp") !== null) {
        /* Do nothing if we're in a photoswipe div */
      } else {
        document.querySelectorAll("[data-dropdown].active").forEach(dropdown => {
          dropdown.classList.remove('active');
        })
      }
    } else if ((menuSwipeEndX + 10) < menuSwipeStartX &&
      Math.abs(menuSwipeStartX - menuSwipeEndX) > Math.abs(menuSwipeStartY - menuSwipeEndY)) {
      if (e.target.closest(".carousel") !== null) {
        /* Try to slide the carousel if we're inside one */
        plusSlides(1);
      } else if (e.target.closest(".pswp") !== null) {
        /* Do nothing if we're in a photoswipe div */
      } else {
        const dropdown = document.querySelector("[data-dropdown]");
        dropdown.classList.add("active");
      }
    }
    menuSwipeStartX = 0;
    menuSwipeEndX = 0;
    menuSwipeStartY = 0;
    menuSwipeEndY = 0;
  }
}
