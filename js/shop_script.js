function updateDottedLine(bgId, dottedLineId, textBelowLineId) {
  const background = document.getElementById(bgId);

  const style = window.getComputedStyle(background);
  const highlightWidthRatio = Number(
    style.getPropertyValue("--highlight-width-ratio")
  );
  const highlightHeightRatio = Number(
    style.getPropertyValue("--highlight-height-ratio")
  );
  const highlightLeftPositionRatio = Number(
    style.getPropertyValue("--highlight-left-position-ratio")
  );
  const highlightTopPositionRatio = Number(
    style.getPropertyValue("--highlight-top-position-ratio")
  );

  const [backgroundPositionX, backgroundPositionY] = getComputedStyle(
    background
  )
    .backgroundPosition.split(" ")
    .map(parseFloat);
  const backgroundPositionXRatio = backgroundPositionX / 100;
  const backgroundPositionYRatio = backgroundPositionY / 100;

  const backgroundWidth = background.clientWidth;
  const backgroundHeight = background.clientHeight;
  const imgWidth = Number(style.getPropertyValue("--image-width"));
  const imgHeight = Number(style.getPropertyValue("--image-height"));

  const scaleFactor = Math.max(
    backgroundWidth / imgWidth,
    backgroundHeight / imgHeight
  );
  const displayedImgWidth = imgWidth * scaleFactor;
  const displayedImgHeight = imgHeight * scaleFactor;
  const cutOutWidth = -backgroundWidth + displayedImgWidth;
  const cutOutHeight = -backgroundHeight + displayedImgHeight;

  const highlightWidth = highlightWidthRatio * displayedImgWidth;
  const highlightHeight = highlightHeightRatio * displayedImgHeight;
  const highlightLeftPosition = highlightLeftPositionRatio * displayedImgWidth;
  const highlightTopPosition = highlightTopPositionRatio * displayedImgHeight;
  const leftPos =
    -backgroundPositionXRatio * cutOutWidth + highlightLeftPosition;
  const topPos =
    -backgroundPositionYRatio * cutOutHeight + highlightTopPosition;

  const dottedLine = document.getElementById(dottedLineId);
  dottedLine.style.width = `${highlightWidth}px`;
  dottedLine.style.height = `${highlightHeight}px`;
  dottedLine.style.left = `${leftPos}px`;
  dottedLine.style.top = `${topPos}px`;

  const textBelowLine = document.getElementById(textBelowLineId);

  if (window.innerWidth > 475) {
    textBelowLine.style.left = `${
      leftPos - textBelowLine.clientWidth / 2 + highlightWidth / 2
    }px`;
  } else {
    textBelowLine.style.left = "";
  }

  textBelowLine.style.top = `${topPos + highlightHeight}px`;

  let textBoundingRect = textBelowLine.getBoundingClientRect();
  const bgRect = background.getBoundingClientRect();
  let fontSize = Number(window.getComputedStyle(textBelowLine).fontSize);
  while (
    (textBoundingRect.bottom > bgRect.bottom ||
      textBoundingRect.top < bgRect.top) &&
    fontSize > 10
  ) {
    fontSize -= 2;
    textBelowLine.style.fontSize = `${fontSize}px`;

    if (textBoundingRect.top < bgRect.top) {
      const topOffset = bgRect.top - textBoundingRect.top;
      textBelowLine.style.top = `${
        parseFloat(textBelowLine.style.top) + topOffset
      }px`;
    }

    textBoundingRect = textBelowLine.getBoundingClientRect();
  }
  textBelowLine.style.visibility = "visible";
}

function handleDottedLineHover() {
  const dottedLine1 = document.getElementById("dotted-line-1");
  const textBelowLine1 = document.getElementById("text-below-line-1");
  const dottedLine2 = document.getElementById("dotted-line-2");
  const textBelowLine2 = document.getElementById("text-below-line-2");
  const dottedLine3 = document.getElementById("dotted-line-3");
  const textBelowLine3 = document.getElementById("text-below-line-3");
  const dottedLine4 = document.getElementById("dotted-line-4");
  const textBelowLine4 = document.getElementById("text-below-line-4");

  dottedLine1.addEventListener("mouseenter", () => {
    textBelowLine1.classList.add("text-below-line-hover");
  });
  dottedLine2.addEventListener("mouseenter", () => {
    textBelowLine2.classList.add("text-below-line-hover");
  });
  dottedLine3.addEventListener("mouseenter", () => {
    textBelowLine3.classList.add("text-below-line-hover");
  });
  dottedLine4.addEventListener("mouseenter", () => {
    textBelowLine4.classList.add("text-below-line-hover");
  });

  dottedLine1.addEventListener("mouseleave", () => {
    textBelowLine1.classList.remove("text-below-line-hover");
  });
  dottedLine2.addEventListener("mouseleave", () => {
    textBelowLine2.classList.remove("text-below-line-hover");
  });
  dottedLine3.addEventListener("mouseleave", () => {
    textBelowLine3.classList.remove("text-below-line-hover");
  });
  dottedLine4.addEventListener("mouseleave", () => {
    textBelowLine4.classList.remove("text-below-line-hover");
  });
}

document.addEventListener("DOMContentLoaded", () => {
  updateDottedLine("background-1", "dotted-line-1", "text-below-line-1");
  updateDottedLine("background-2", "dotted-line-2", "text-below-line-2");
  updateDottedLine("background-3", "dotted-line-3", "text-below-line-3");
  updateDottedLine("background-4", "dotted-line-4", "text-below-line-4");
  updateZIndex();

  document.querySelectorAll(".scroll-arrow").forEach((arrow) => {
    arrow.addEventListener("click", (event) => {
      event.preventDefault();
      const targetSectionId = arrow.dataset.target;
      scrollSection(targetSectionId);
    });
  });

  handleDropdownDisplay();
  handleDottedLineHover();
  initiateCartDisplay();
});

window.addEventListener("resize", () => {
  updateDottedLine("background-1", "dotted-line-1", "text-below-line-1");
  updateDottedLine("background-2", "dotted-line-2", "text-below-line-2");
  updateDottedLine("background-3", "dotted-line-3", "text-below-line-3");
  updateDottedLine("background-4", "dotted-line-4", "text-below-line-4");
});

handleCartUpdates();
