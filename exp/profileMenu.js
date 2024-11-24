// Seleciona os elementos
const profileIcon = document.getElementById('profile-icon');
const profileMenu = document.querySelector('.profileItems');

// Mostra o menu ao passar o mouse sobre o ícone
profileIcon.addEventListener('mouseover', () => {
  profileMenu.style.display = 'block';
});

// Esconde o menu ao mover o mouse para fora do menu
profileMenu.addEventListener('mouseleave', () => {
  profileMenu.style.display = 'none';
});