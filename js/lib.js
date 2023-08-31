function initiateCartDisplay() {
  const cartItemCountElement = document.querySelector(".cart-item-count");
  if (cartItemCountElement !== null) {
    cartItemCountElement.textContent = `(${CartCount.get()})`;
  }
}

function updateCartDisplay() {
  const cartItemCountElement = document.querySelector(".cart-item-count");
  if (cartItemCountElement !== null) {
    const count = Snipcart.store.getState().cart.items.count;
    CartCount.set(count);
    cartItemCountElement.textContent = `(${count})`;
    console.log("updateCartDisplay: " + `(${count})`);
  }
}

function updateZIndex() {
  const updateZIndexForSelector = (selector) => {
    const elements = document.querySelectorAll(selector);
    elements.forEach((el, index) => {
      const zIndex = elements.length - index;
      el.style.zIndex = zIndex;
    });
  };

  updateZIndexForSelector(".full-screen-background");
  updateZIndexForSelector(".text-below-line");
  updateZIndexForSelector(".dotted-line");
}

function scrollSection(targetSectionId) {
  const targetSection = document.getElementById(targetSectionId);
  if (targetSection) {
    targetSection.scrollIntoView({ behavior: "smooth" });
  }
}

const isTouchDevice = () =>
  "ontouchstart" in window || navigator.maxTouchPoints;

function handleDropdownDisplay() {
  const dropdowns = document.querySelectorAll(".dropdown");

  if (isTouchDevice()) {
    // Device with touch support
    dropdowns.forEach((dropdown) => {
      dropdown.addEventListener("click", (event) => {
        event.preventDefault(); // Prevent default link behavior
        const content = dropdown.querySelector(".dropdown-content");
        content.style.display =
          content.style.display === "block" ? "none" : "block";
      });

      // Add a click event listener to the dropdown content links to allow navigation
      const dropdownLinks = dropdown.querySelectorAll(".dropdown-content a");
      dropdownLinks.forEach((link) => {
        link.addEventListener("click", (event) => {
          window.location.href = event.target.href;
        });
      });
    });
  } else {
    // Device without touch support
    dropdowns.forEach((dropdown) => {
      dropdown.addEventListener("mouseover", () => {
        const content = dropdown.querySelector(".dropdown-content");
        content.style.display = "block";
      });

      dropdown.addEventListener("mouseout", () => {
        const content = dropdown.querySelector(".dropdown-content");
        content.style.display = "none";
      });
    });
  }
}

function handleCartUpdates() {
  document.addEventListener("snipcart.ready", () => {
    Snipcart.events.on("item.removed", (item) => {
      updateCartDisplay();
    });
    Snipcart.events.on("item.added", (item) => {
      updateCartDisplay();
    });
    Snipcart.events.on("cart.reset", (cartState) => {
      updateCartDisplay();
    });
    Snipcart.events.on("cart.confirmed", (cartConfirmResponse) => {
      updateCartDisplay();
    });
    Snipcart.events.on('snipcart.initialized', (snipcartState) => {
      updateCartDisplay();
    });
    Snipcart.events.on('snipcart.initialization.error', () => {
        console.log('Failed to initialize Snipcart');
    });
  });
}
