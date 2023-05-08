function updateCartDisplay() {
  const cartItemsElement = document.getElementById("cartItems");
  const totalCostElement = document.getElementById("totalCost");

  // Clear the current cart items display
  cartItemsElement.innerHTML = "";

  const cartData = Cart.getCartData();

  cartData.cart.forEach((item, index) => {
    const listItem = document.createElement("li");
    listItem.textContent = `${item.name} - $${item.price.toFixed(2)}`;
    cartItemsElement.appendChild(listItem);
  });
  const totalCost = cartData.totalCost;
  totalCostElement.textContent = `Total: $${totalCost.toFixed(2)}`;
}

function updateZIndex() {
  const backgrounds = document.querySelectorAll('.full-screen-background');
  const textBelowLines = document.querySelectorAll('.text-below-line');
  const dottedLines = document.querySelectorAll('.dotted-line');

  backgrounds.forEach((background, index) => {
    const zIndex = backgrounds.length - index;
    background.style.zIndex = zIndex;
  });
  textBelowLines.forEach((text, index) => {
    const zIndex = textBelowLines.length - text;
    text.style.zIndex = zIndex;
  });
  dottedLines.forEach((line, index) => {
    const zIndex = dottedLines.length - line;
    line.style.zIndex = zIndex;
  });
}

function isAlmostColliding(div1, div2) {
  const rect1 = div1.getBoundingClientRect();
  const rect2 = div2.getBoundingClientRect();
  const spacePx = 3;

  return !(
    rect1.right < (rect2.left - spacePx) ||
    (rect1.left - spacePx) > rect2.right ||
    rect1.bottom < (rect2.top - spacePx) ||
    (rect1.top - spacePx) > rect2.bottom
  );
}

function updateDottedLine(bgId, dottedLineId, textBelowLineId, maybeCollideId) {
  const background = document.getElementById(bgId);

  const style = window.getComputedStyle(background);
  const highlightWidthRatio = parseFloat(style.getPropertyValue('--highlight-width-ratio'));
  const highlightHeightRatio = parseFloat(style.getPropertyValue('--highlight-height-ratio'));
  const highlightLeftPositionRatio = parseFloat(style.getPropertyValue('--highlight-left-position-ratio'));
  const highlightTopPositionRatio = parseFloat(style.getPropertyValue('--highlight-top-position-ratio'));

  const backgroundPosition = getComputedStyle(background).backgroundPosition.split(' ');
  const backgroundPositionXRatio = parseFloat(backgroundPosition[0]) / 100;
  const backgroundPositionYRatio = parseFloat(backgroundPosition[1]) / 100;

  const img = new Image();
  img.src = getComputedStyle(background).backgroundImage.slice(5, -2); // get the URL of the background image

  img.onload = function () {
    const backgroundWidth = background.clientWidth;
    const backgroundHeight = background.clientHeight;
    const imgWidth = img.width;
    const imgHeight = img.height;

    const scaleFactor = Math.max(backgroundWidth / imgWidth, backgroundHeight / imgHeight);
    const displayedImgWidth = imgWidth * scaleFactor;
    const displayedImgHeight = imgHeight * scaleFactor;
    const cutOutWidth = -backgroundWidth + displayedImgWidth;
    const cutOutHeight = -backgroundHeight + displayedImgHeight;

    const highlightWidth = highlightWidthRatio*displayedImgWidth;
    const highlightHeight = highlightHeightRatio*displayedImgHeight;
    const highlightLeftPosition = highlightLeftPositionRatio*displayedImgWidth;
    const highlightTopPosition = highlightTopPositionRatio*displayedImgHeight;
    const leftPos = -backgroundPositionXRatio*cutOutWidth + highlightLeftPosition;
    const topPos = -backgroundPositionYRatio*cutOutHeight + highlightTopPosition;

    const dottedLine = document.getElementById(dottedLineId);
    dottedLine.style.width = highlightWidth + 'px';
    dottedLine.style.height = highlightHeight + 'px';
    dottedLine.style.left = leftPos + 'px';
    dottedLine.style.top = topPos + 'px';

    // Position the text element above the dotted line
    const textBelowLine = document.getElementById(textBelowLineId);

    if (window.innerWidth > 475) {
      textBelowLine.style.left = (leftPos - textBelowLine.clientWidth/2 + highlightWidth/2) + 'px';
    } else {
      textBelowLine.style.left = '';
    }

    textBelowLine.style.top = (topPos + highlightHeight) + 'px';
    //textBelowLine.style.top = (topPos - textBelowLine.clientHeight) + 'px';
    //if (maybeCollideId != '') {
    //  const maybeCollide = document.getElementById(maybeCollideId);
    //  if (isAlmostColliding(textBelowLine, maybeCollide)) {
    //    textBelowLine.style.top = (topPos + highlightHeight) + 'px';
    //  }
    //}


    let textBoundingRect = textBelowLine.getBoundingClientRect();
    const bgRect = background.getBoundingClientRect();
    let fontSize = parseInt(window.getComputedStyle(textBelowLine).fontSize, 10);
    // If we're overflowing into below bg, reduce font size many times.
    // If overflow into above bg, reduce font size once and move the text down.
    while ((textBoundingRect.bottom > bgRect.bottom || textBoundingRect.top < bgRect.top) && fontSize > 10) {
      fontSize -= 2;
      textBelowLine.style.fontSize = fontSize + 'px';

      if (textBoundingRect.top < bgRect.top) {
        const topOffset = bgRect.top - textBoundingRect.top;
        textBelowLine.style.top = `${parseFloat(textBelowLine.style.top) + topOffset}px`;
      }

      textBoundingRect = textBelowLine.getBoundingClientRect();
    }
  };
}

function scrollSection(targetSectionId) {
  const targetSection = document.getElementById(targetSectionId);
  if (targetSection) {
    targetSection.scrollIntoView({ behavior: 'smooth' });
  }
}
//
// Check if the device has touch capabilities
function isTouchDevice() {
  return 'ontouchstart' in window || navigator.maxTouchPoints;
}


// Handle the dropdown menu display
function handleDropdownDisplay() {
  const dropdowns = document.querySelectorAll('.dropdown');

  if ('ontouchstart' in window || navigator.maxTouchPoints) {
    // Device with touch support
    dropdowns.forEach(dropdown => {
      dropdown.addEventListener('click', (event) => {
        event.preventDefault(); // Prevent default link behavior
        const content = dropdown.querySelector('.dropdown-content');
        content.style.display = content.style.display === 'block' ? 'none' : 'block';
      });

      // Add a click event listener to the dropdown content links to allow navigation
      const dropdownLinks = dropdown.querySelectorAll('.dropdown-content a');
      dropdownLinks.forEach(link => {
        link.addEventListener('click', (event) => {
          window.location.href = event.target.href;
        });
      });
    });
  } else {
    // Device without touch support
    dropdowns.forEach(dropdown => {
      dropdown.addEventListener('mouseover', () => {
        const content = dropdown.querySelector('.dropdown-content');
        content.style.display = 'block';
      });

      dropdown.addEventListener('mouseout', () => {
        const content = dropdown.querySelector('.dropdown-content');
        content.style.display = 'none';
      });
    });
  }
}
