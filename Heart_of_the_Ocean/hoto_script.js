function enableSlideAnimationIfTouchscreen() {
  const carousel = document.getElementById("carouselExampleControls");
  const hasTouchscreen = window.matchMedia("(pointer: coarse)").matches;

  if (hasTouchscreen) {
    carousel.classList.add("slide");
  }

  let isTransitioning = false;
  var thumbnailElems = document.querySelectorAll('.carousel-thumbnails img');
  thumbnailElems.forEach(function (thumbnailElem) {
      thumbnailElem.addEventListener('click', function () {
          if (isTransitioning && hasTouchscreen) {
            return;
          }
          if (hasTouchscreen) {
            isTransitioning = true;
            document.querySelector('#carouselExampleControls').classList.add('carousel-fade');
          }

          var goToSlide = this.getAttribute('data-slide-to');
          var carousel = document.getElementById('carouselExampleControls');
          var bsCarousel = new bootstrap.Carousel(carousel);
          bsCarousel.to(parseInt(goToSlide));


          if (hasTouchscreen) {
            setTimeout(() => { // This feels a little fragile?
              document.querySelector('#carouselExampleControls').classList.remove('carousel-fade');
              isTransitioning = false;
            }, 600);
          }
      });
  });


}

document.addEventListener('DOMContentLoaded', () => {
  handleDropdownDisplay();
  enableSlideAnimationIfTouchscreen();
  initiateCartDisplay();
});

document.addEventListener('snipcart.ready', () => {
  Snipcart.events.on('item.removed', (parsedCartItem) => {
    updateCartDisplay();
  });
  Snipcart.events.on('item.added', (parsedCartItem) => {
    updateCartDisplay();
  });
  Snipcart.events.on('cart.reset', (parsedCartItem) => {
    updateCartDisplay();
  });
});
