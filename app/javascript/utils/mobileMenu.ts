document.addEventListener('DOMContentLoaded', () => {
  const toggleButton = document.querySelector('[data-collapse-toggle="mobile-menu-2"]');
  const menu = document.getElementById('mobile-menu-2');

  if (toggleButton && menu) {
    toggleButton.addEventListener('click', () => {
      menu.classList.toggle('open');
    });
  }
});