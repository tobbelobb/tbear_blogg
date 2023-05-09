
document.addEventListener('DOMContentLoaded', () => {
  handleDropdownDisplay();


  document.getElementById("buyButton").addEventListener("click", function () {
    Cart.addToCart("Heart of the Ocean", 500.00);
    updateCartDisplay();
  });
  updateCartDisplay();
});
