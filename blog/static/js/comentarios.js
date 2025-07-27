document.addEventListener('DOMContentLoaded', function () {
  const botonMostrar = document.getElementById('mostrarForm');
  const form = document.getElementById('formComentario');

  if (botonMostrar && form) {
    botonMostrar.addEventListener('click', function() {
      if (form.style.display === 'none' || form.style.display === '') {
        form.style.display = 'block';
        this.textContent = 'Cancelar';
      } else {
        form.style.display = 'none';
        this.textContent = 'Comentar este post';
        form.reset();
      }
    });
  }
});
