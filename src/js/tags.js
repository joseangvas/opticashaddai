(function() {
  const tagsInput = document.querySelector('#tags_input');

  if(tagsInput) {
    const tagsDiv = document.querySelector('#tags');
    const tagsInputHidden = document.querySelector('[name="tags"]');

    let tags = [];

    // Recuperar del input oculto
    if(tagsInputHidden.value !== '') {
      tags = tagsInputHidden.value.split(',');
      mostrarTags();
    }

    // Escuchar los Cambios en el Input
    tagsInput.addEventListener('keypress', guardarTag);

    function guardarTag(e) {
      if(e.keyCode === 44) {
        if(e.target.value.trim() === '' || e.target.value < 1) {
          return;
        };

        e.preventDefault();
        tags = [...tags, e.target.value.trim()];
        tagsInput.value = '';

        mostrarTags();
      }
      
    }

    // Mostrar Los Tags en Pantalla
    function mostrarTags() {
      tagsDiv.textContent = '';

      tags.forEach(tag => {
        const etiqueta = document.createElement('LI');
        etiqueta.classList.add('formulario__tag');
        etiqueta.textContent = tag;
        etiqueta.ondblclick = eliminarTag;
        tagsDiv.appendChild(etiqueta);
      });

      actualizarInputHidden();
    }

    // Eliminar un Tag
    function eliminarTag(e) {
      e.target.remove();

      // Retornar un Nuevo arreglo con elementos que cumplen la Condición
      tags = tags.filter(tag => tag !== e.target.textContent);

      actualizarInputHidden()
    }

    // Actualizar la Entrada
    function actualizarInputHidden() {
      tagsInputHidden.value = tags.toString();
    }
  }
})();  // Esta Función completa es un IIFE