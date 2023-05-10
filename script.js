function handleDottedLineHover() {
  const dottedLine1 = document.getElementById('dotted-line-1');
  const textBelowLine1 = document.getElementById('text-below-line-1');
  const dottedLine2 = document.getElementById('dotted-line-2');
  const textBelowLine2 = document.getElementById('text-below-line-2');

  dottedLine1.addEventListener('mouseenter', () => {
    textBelowLine1.classList.add('text-below-line-hover');
  });
  dottedLine2.addEventListener('mouseenter', () => {
    textBelowLine2.classList.add('text-below-line-hover');
  });

  dottedLine1.addEventListener('mouseleave', () => {
    textBelowLine1.classList.remove('text-below-line-hover');
  });
  dottedLine2.addEventListener('mouseleave', () => {
    textBelowLine2.classList.remove('text-below-line-hover');
  });
}

document.addEventListener('DOMContentLoaded', () => {
  updateDottedLine('background-1', 'dotted-line-1', 'text-below-line-1', 'top-left-1');
  updateDottedLine('background-2', 'dotted-line-2', 'text-below-line-2', '');
  updateZIndex();

  document.querySelectorAll('.scroll-arrow').forEach((arrow) => {
    arrow.addEventListener('click', (event) => {
      event.preventDefault();
      const targetSectionId = arrow.dataset.target;
      scrollSection(targetSectionId);
    });
  });

  handleDropdownDisplay();
  handleDottedLineHover();
  //updateCartDisplay();
});

window.addEventListener('resize', () => {
  updateDottedLine('background-1', 'dotted-line-1', 'text-below-line-1', 'top-left-1');
  updateDottedLine('background-2', 'dotted-line-2', 'text-below-line-2', '');
});
