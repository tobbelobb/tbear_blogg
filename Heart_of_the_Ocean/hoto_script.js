function enableSlideAnimationIfTouchscreen() {
  const carousel = document.getElementById("carouselExampleControls");
  const touchDevice = isTouchDevice();

  if (touchDevice) {
    carousel.classList.add("slide");
  }

  let isTransitioning = false;
  const thumbnailElems = document.querySelectorAll(".carousel-thumbnails img");

  thumbnailElems.forEach((thumbnailElem) => {
    thumbnailElem.addEventListener("click", () => {
      if (isTransitioning && touchDevice) {
        return;
      }
      if (touchDevice) {
        isTransitioning = true;
        document
          .querySelector("#carouselExampleControls")
          .classList.add("carousel-fade");
      }

      const goToSlide = thumbnailElem.getAttribute("data-slide-to");
      const carousel = document.getElementById("carouselExampleControls");
      const bsCarousel = new bootstrap.Carousel(carousel);
      bsCarousel.to(parseInt(goToSlide));

      if (touchDevice) {
        setTimeout(() => {
          document
            .querySelector("#carouselExampleControls")
            .classList.remove("carousel-fade");
          isTransitioning = false;
        }, 600);
      }
    });
  });
}

document.addEventListener("DOMContentLoaded", () => {
  // If background brightness is high, make navbar darker to increase text contrast
  let bgColor = window.getComputedStyle(document.body).backgroundColor;
  let colorMatch = bgColor.match(/\d+/g);
  let r = parseInt(colorMatch[0]);
  let g = parseInt(colorMatch[1]);
  let b = parseInt(colorMatch[2]);
  let brightness = Math.round((r * 299 + g * 587 + b * 114) / 1000);
  let element = document.querySelector('.transparent-nav');
  console.log(brightness);
  if (brightness > 128) {
    element.style.backgroundColor = "rgba(0,0,0,0.85)";
  }

  const link = document.createElement('link');
  link.rel = 'stylesheet';
  link.href = '../photoswipe/dist/photoswipe.css';
  document.head.appendChild(link);

  handleDropdownDisplay();
  enableSlideAnimationIfTouchscreen();
  initiateCartDisplay();
});

document.addEventListener("snipcart.ready", () => {
  Snipcart.events.on("item.removed", (parsedCartItem) => {
    updateCartDisplay();
  });
  Snipcart.events.on("item.added", (parsedCartItem) => {
    updateCartDisplay();
  });
  Snipcart.events.on("cart.reset", (parsedCartItem) => {
    updateCartDisplay();
  });
});
