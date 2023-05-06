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
});

window.addEventListener('resize', () => {
  updateDottedLine('background-1', 'dotted-line-1', 'text-below-line-1', 'top-left-1');
  updateDottedLine('background-2', 'dotted-line-2', 'text-below-line-2', '');
});
