document.addEventListener("DOMContentLoaded", () => {
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
