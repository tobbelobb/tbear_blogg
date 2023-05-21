let darkMode = localStorage.getItem("darkMode");

const enableDarkMode = () => {
  document.body.classList.add("dark");
  document.body.classList.remove("light");
  localStorage.setItem("darkMode", "enabled");
};
const disableDarkMode = () => {
  document.body.classList.remove("dark");
  document.body.classList.add("light");
  localStorage.setItem("darkMode", "disabled");
};

const sysDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
if (darkMode === "enabled") {
  enableDarkMode();
} else if (darkMode === "disabled") {
  disableDarkMode();
} else if (sysDark) {
  enableDarkMode();
} else {
  disableDarkMode();
}

const darkModeToggle = document.querySelector("#dark-mode-toggle");
if (darkModeToggle !== null) {
  darkModeToggle.addEventListener("click", () => {
    darkMode = localStorage.getItem("darkMode");
    if (darkMode !== "enabled") {
      enableDarkMode();
    } else {
      disableDarkMode();
    }
  });
}
