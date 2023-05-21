const form = document.querySelector("form");

form.addEventListener('submit', e => {
  if (!form.checkValidity()) {
    e.preventDefault();
  }
  form.classList.add("was-validated");
})

document.addEventListener('click', e => {
  const isDropdownToggle = e.target.matches("[data-dropdown-toggle]");

  if (!isDropdownToggle && e.target.closest("[data-dropdown]") != null) {
    return;
  }

  let currentDropdown;
  if (isDropdownToggle) {
    currentDropdown = e.target.closest("[data-dropdown]");
    currentDropdown.classList.toggle('active');
  }

  document.querySelectorAll("[data-dropdown].active").forEach(dropdown => {
    if (dropdown === currentDropdown) {
      return;
    }
    dropdown.classList.remove('active');
  });
})

var myVideo = document.getElementById("video1");
function playPause() {
  if (myVideo.paused)
    myVideo.play();
  else
    myVideo.pause();
}




//  console.log(`Dark mode is ${darkModeOn ? '🌒 on' : '☀️ off'}.`);
