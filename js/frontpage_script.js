const form = document.querySelector("form");
form.addEventListener('submit', e => {
  if (!form.checkValidity()) {
    e.preventDefault();
  }
  form.classList.add("was-validated");
})


const myVideo = document.getElementById("video1");
function playPause() {
  if (myVideo.paused)
    myVideo.play();
  else
    myVideo.pause();
}

document.addEventListener("DOMContentLoaded", () => {
  vid = document.getElementById("video1");
  vid.addEventListener("pause", () => {
    const pl1 = document.getElementById("video1play");
    const pl2 = document.getElementById("video1play2");
    pl1.style.setProperty("visibility", "visible");
    pl2.style.setProperty("visibility", "visible");
  });

  vid.addEventListener("play", () => {
    const pl1 = document.getElementById("video1play");
    const pl2 = document.getElementById("video1play2");
    pl1.style.setProperty("visibility", "hidden");
    pl2.style.setProperty("visibility", "hidden");
  });

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
