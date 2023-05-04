function updateDottedLine(bgId, dottedLineId, textAboveLineId) {
  const background = document.getElementById(bgId);
  const highlightWidthRatio = parseFloat(background.getAttribute('data-highlight-width-ratio'));
  const highlightHeightRatio = parseFloat(background.getAttribute('data-highlight-height-ratio'));
  const highlightLeftPositionRatio = parseFloat(background.getAttribute('data-highlight-left-position-ratio'));
  const highlightTopPositionRatio = parseFloat(background.getAttribute('data-highlight-top-position-ratio'));
  const backgroundPosition = getComputedStyle(background).backgroundPosition.split(' ');
  const backgroundPositionXRatio = parseFloat(backgroundPosition[0]) / 100;
  const backgroundPositionYRatio = parseFloat(backgroundPosition[1]) / 100;


  const img = new Image();
  img.src = getComputedStyle(background).backgroundImage.slice(5, -2); // get the URL of the background image

  img.onload = function () {
    const backgroundWidth = background.clientWidth;
    const backgroundHeight = background.clientHeight;
    const imgWidth = img.width;
    const imgHeight = img.height;

    const scaleFactor = Math.max(backgroundWidth / imgWidth, backgroundHeight / imgHeight);
    const displayedImgWidth = imgWidth * scaleFactor;
    const displayedImgHeight = imgHeight * scaleFactor;
    const cutOutWidth = -backgroundWidth + displayedImgWidth;
    const cutOutHeight = -backgroundHeight + displayedImgHeight;

    const highlightWidth = highlightWidthRatio*displayedImgWidth;
    const highlightHeight = highlightHeightRatio*displayedImgHeight;
    const highlightLeftPosition = highlightLeftPositionRatio*displayedImgWidth;
    const highlightTopPosition = highlightTopPositionRatio*displayedImgHeight;
    const leftPos = -backgroundPositionXRatio*cutOutWidth + highlightLeftPosition;
    const topPos = -backgroundPositionYRatio*cutOutHeight + highlightTopPosition;

    const dottedLine = document.getElementById(dottedLineId);
    dottedLine.style.width = highlightWidth + 'px';
    dottedLine.style.height = highlightHeight + 'px';
    dottedLine.style.left = leftPos + 'px';
    dottedLine.style.top = topPos + 'px';

    // Position the text element above the dotted line
    const textAboveLine = document.getElementById(textAboveLineId);
    textAboveLine.style.left = (leftPos - textAboveLine.clientWidth/2 + highlightWidth/2) + 'px';
    textAboveLine.style.top = (topPos - textAboveLine.clientHeight) + 'px';

    //const textBelowLine = document.getElementById('text-below-line');
    //textBelowLine.style.left = (leftPos - textBelowLine.clientWidth/2 + highlightWidth/2) + 'px';
    //textBelowLine.style.top = (topPos + highlightHeight) + 'px';
  };
}

updateDottedLine('background-1', 'dotted-line-1', 'text-above-line-1');
updateDottedLine('background-2', 'dotted-line-2', 'text-above-line-2');
window.addEventListener('resize', () => {
  updateDottedLine('background-1', 'dotted-line-1', 'text-above-line-1');
  updateDottedLine('background-2', 'dotted-line-2', 'text-above-line-2');
});
