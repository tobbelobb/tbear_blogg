// darkMode can be "enabled" or "disabled"
let darkMode = localStorage.getItem("darkMode");
// prevSys can be "dark" or "light"
let prevSys = localStorage.getItem("darkModePrevSys");
// Defaults are "disabled" and "light"
if (darkMode === null ) {
  darkMode = "disabled";
}
if (prevSys === null ) {
  prevSys = "light";
}

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

const sysPref = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches ? "dark" : "light"

if (sysPref !== prevSys) {
  // SysPrev change detected. Override local preference.
  if (sysPref === "dark") {
    console.log("sys preference change: dark");
    enableDarkMode();
  } else {
    console.log("sys preference change: light");
    disableDarkMode();
  }
  localStorage.setItem("darkModePrevSys", sysPref);
} else {
  // No system preference change, use local preference.
  if (darkMode === "enabled") {
    console.log("local preference: dark");
    enableDarkMode();
  } else {
    console.log("local preference: light");
    disableDarkMode();
  }
}

const darkModeToggle = document.querySelector("#dark-mode-toggle");
if (darkModeToggle !== null) {
  darkModeToggle.addEventListener("click", () => {
    darkMode = localStorage.getItem("darkMode");
    if (darkMode !== "enabled") {
      console.log("local preference change: dark");
      enableDarkMode();
    } else {
      console.log("local preference change: light");
      disableDarkMode();
    }
  });
}
