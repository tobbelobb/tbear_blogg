function initiateCartDisplay() {
  const cartItemCountElement = document.querySelector(".cart-item-count");
  cartItemCountElement.textContent = `(${CartCount.get()})`;
}

function updateCartDisplay() {
  const cartItemCountElement = document.querySelector(".cart-item-count");
  const count = Snipcart.store.getState().cart.items.count;
  CartCount.set(count);
  cartItemCountElement.textContent = `(${count})`;
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

function updateDottedLine(bgId, dottedLineId, textBelowLineId) {
  const background = document.getElementById(bgId);

  const style = window.getComputedStyle(background);
  const highlightWidthRatio = Number(
    style.getPropertyValue("--highlight-width-ratio")
  );
  const highlightHeightRatio = Number(
    style.getPropertyValue("--highlight-height-ratio")
  );
  const highlightLeftPositionRatio = Number(
    style.getPropertyValue("--highlight-left-position-ratio")
  );
  const highlightTopPositionRatio = Number(
    style.getPropertyValue("--highlight-top-position-ratio")
  );

  const [backgroundPositionX, backgroundPositionY] = getComputedStyle(
    background
  )
    .backgroundPosition.split(" ")
    .map(parseFloat);
  const backgroundPositionXRatio = backgroundPositionX / 100;
  const backgroundPositionYRatio = backgroundPositionY / 100;

  const backgroundWidth = background.clientWidth;
  const backgroundHeight = background.clientHeight;
  const imgWidth = Number(style.getPropertyValue("--image-width"));
  const imgHeight = Number(style.getPropertyValue("--image-height"));

  const scaleFactor = Math.max(
    backgroundWidth / imgWidth,
    backgroundHeight / imgHeight
  );
  const displayedImgWidth = imgWidth * scaleFactor;
  const displayedImgHeight = imgHeight * scaleFactor;
  const cutOutWidth = -backgroundWidth + displayedImgWidth;
  const cutOutHeight = -backgroundHeight + displayedImgHeight;

  const highlightWidth = highlightWidthRatio * displayedImgWidth;
  const highlightHeight = highlightHeightRatio * displayedImgHeight;
  const highlightLeftPosition = highlightLeftPositionRatio * displayedImgWidth;
  const highlightTopPosition = highlightTopPositionRatio * displayedImgHeight;
  const leftPos =
    -backgroundPositionXRatio * cutOutWidth + highlightLeftPosition;
  const topPos =
    -backgroundPositionYRatio * cutOutHeight + highlightTopPosition;

  const dottedLine = document.getElementById(dottedLineId);
  dottedLine.style.width = `${highlightWidth}px`;
  dottedLine.style.height = `${highlightHeight}px`;
  dottedLine.style.left = `${leftPos}px`;
  dottedLine.style.top = `${topPos}px`;

  const textBelowLine = document.getElementById(textBelowLineId);

  if (window.innerWidth > 475) {
    textBelowLine.style.left = `${
      leftPos - textBelowLine.clientWidth / 2 + highlightWidth / 2
    }px`;
  } else {
    textBelowLine.style.left = "";
  }

  textBelowLine.style.top = `${topPos + highlightHeight}px`;

  let textBoundingRect = textBelowLine.getBoundingClientRect();
  const bgRect = background.getBoundingClientRect();
  let fontSize = Number(window.getComputedStyle(textBelowLine).fontSize);
  while (
    (textBoundingRect.bottom > bgRect.bottom ||
      textBoundingRect.top < bgRect.top) &&
    fontSize > 10
  ) {
    fontSize -= 2;
    textBelowLine.style.fontSize = `${fontSize}px`;

    if (textBoundingRect.top < bgRect.top) {
      const topOffset = bgRect.top - textBoundingRect.top;
      textBelowLine.style.top = `${
        parseFloat(textBelowLine.style.top) + topOffset
      }px`;
    }

    textBoundingRect = textBelowLine.getBoundingClientRect();
  }
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
