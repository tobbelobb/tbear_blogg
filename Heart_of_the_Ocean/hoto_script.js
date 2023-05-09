function enableSlideAnimationIfTouchscreen() {
  const carousel = document.getElementById("carouselExampleControls");
  const hasTouchscreen = window.matchMedia("(pointer: coarse)").matches;

  if (hasTouchscreen) {
    carousel.classList.add("slide");
  }
}

document.addEventListener('DOMContentLoaded', () => {
  handleDropdownDisplay();

  document.getElementById("buyButton").addEventListener("click", function () {
    Cart.addToCart("Heart of the Ocean", 500.00);
    updateCartDisplay();
  });
  updateCartDisplay();
  enableSlideAnimationIfTouchscreen();
});
