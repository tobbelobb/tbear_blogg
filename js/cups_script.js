let addToCartButtons = document.getElementsByClassName("add-cup-to-cart");

for (let i = 0; i < addToCartButtons.length; i++) {
  addToCartButtons[i].addEventListener("click", function(event) {
    alert("Div clicked: " + this.innerHTML);
    event.stopPropagation();
  });
}
