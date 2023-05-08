document.addEventListener('DOMContentLoaded', () => {
  handleDropdownDisplay();
  const carouselImages = document.getElementById('carousel-images');
    const viewer = new Viewer(carouselImages, {
      inline: false,
      navbar: 4,
      tooltip: false,
      scalable: true,
      fullscreen: true,
      button: true,
      transition: false,
      toolbar: {
          zoomIn: {
            show: 1,
            size: 'large',
          },
          zoomOut: {
            show: 1,
            size: 'large',
          },
          reset: {
            show: 1,
            size: 'large',
          },
          prev: {
            show: 1,
            size: 'large',
          },
          next: {
            show: 1,
            size: 'large',
          },
        },
    });

  document.getElementById("buyButton").addEventListener("click", function () {
    Cart.addToCart("Heart of the Ocean", 500.00);
    updateCartDisplay();
  });
  updateCartDisplay();
});
