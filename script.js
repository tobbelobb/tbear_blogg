function updateDottedLine() {
  const background = document.getElementById('background');
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

    const bowlWidth = 0.42*displayedImgWidth;
    const bowlHeight = 0.33*displayedImgHeight;
    const bowlLeftPosition = 0.43*displayedImgWidth;
    const bowlTopPosition = 0.43*displayedImgHeight;
    const leftPos = -0.7*cutOutWidth + bowlLeftPosition;
    const topPos = -0.7*cutOutHeight + bowlTopPosition;

    const dottedLine = document.getElementById('dotted-line');
    dottedLine.style.width = bowlWidth + 'px';
    dottedLine.style.height = bowlHeight + 'px';
    // -0.7 and -0.7 from css background-position: 70% 70%
    dottedLine.style.left = leftPos + 'px';
    dottedLine.style.top = topPos + 'px';

    // Position the text element above the dotted line
    const textAboveLine = document.getElementById('text-above-line');
    textAboveLine.style.left = (leftPos - textAboveLine.clientWidth/2 + bowlWidth/2) + 'px';
    textAboveLine.style.top = (topPos - textAboveLine.clientHeight) + 'px';

    //const textBelowLine = document.getElementById('text-below-line');
    //textBelowLine.style.left = (leftPos - textBelowLine.clientWidth/2 + bowlWidth/2) + 'px';
    //textBelowLine.style.top = (topPos + bowlHeight) + 'px';
  };
}

updateDottedLine();
window.addEventListener('resize', updateDottedLine);
//
//
//
//function updateDottedLine() {
//  const background = document.getElementById('background');
//  const img = new Image();
//  img.src = getComputedStyle(background).backgroundImage.slice(5, -2); // get the URL of the background image
//
//  img.onload = function () {
//    const backgroundWidth = background.clientWidth;
//    const backgroundHeight = background.clientHeight;
//    const imgWidth = img.width;
//    const imgHeight = img.height;
//
//    const xOffsetPercentage = 0.42;
//    const yOffsetPercentage = 0.36;
//    const xOffset = imgWidth * 0.15 - 0.7*(imgWidth - backgroundWidth);
//    const yOffset = -imgWidth * 0.15 -  0.7* (imgWidth - backgroundWidth);
//
//    const dottedLine = document.getElementById('dotted-line');
//    dottedLine.style.width = imgWidth*0.85 + 'px';
//    dottedLine.style.height = imgHeight*0.85 + 'px';
//    dottedLine.style.left = xOffset + 'px';
//    dottedLine.style.top = yOffset + 'px';
//  };
//}
//
//updateDottedLine();
//window.addEventListener('resize', updateDottedLine);
