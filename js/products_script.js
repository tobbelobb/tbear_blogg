document.addEventListener("DOMContentLoaded", () => {
  const link = document.createElement('link');
  link.rel = 'stylesheet';
  link.href = '../photoswipe/dist/photoswipe.css';
  document.head.appendChild(link);

  handleDropdownDisplay();
  initiateCartDisplay();
});

handleCartUpdates();

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("carousel-item");
  let thumbnails = document.getElementsByClassName("thumbnail");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < thumbnails.length; i++) {
    thumbnails[i].className = thumbnails[i].className.replace(" active-img", "");
  }
  slides[slideIndex-1].style.display = "block";
  thumbnails[slideIndex-1].className += " active-img";
}

let slideIndex = 1;
showSlides(slideIndex);
