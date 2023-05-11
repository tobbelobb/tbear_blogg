function enableSlideAnimationIfTouchscreen() {
  const carousel = document.getElementById("carouselExampleControls");
  const hasTouchscreen = window.matchMedia("(pointer: coarse)").matches;

  if (hasTouchscreen) {
    carousel.classList.add("slide");
  }

  let isTransitioning = false;
  const thumbnailElems = document.querySelectorAll(".carousel-thumbnails img");

  thumbnailElems.forEach((thumbnailElem) => {
    thumbnailElem.addEventListener("click", () => {
      if (isTransitioning && hasTouchscreen) {
        return;
      }
      if (hasTouchscreen) {
        isTransitioning = true;
        document
          .querySelector("#carouselExampleControls")
          .classList.add("carousel-fade");
      }

      const goToSlide = thumbnailElem.getAttribute("data-slide-to");
      const carousel = document.getElementById("carouselExampleControls");
      const bsCarousel = new bootstrap.Carousel(carousel);
      bsCarousel.to(parseInt(goToSlide));

      if (hasTouchscreen) {
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
