(function() {
  const horas = document.querySelector('#horas')

  if(horas) {
    const categoria = document.querySelector('[name="categoria_id"]');
    const dias = document.querySelectorAll('[name="dia"]');
    const inputHiddenDia = document.querySelector('[name="dia_id"]');
    const inputHiddenHora = document.querySelector('[name="hora_id"]');

    categoria.addEventListener('change', terminoBusqueda);
    dias.forEach(dia => dia.addEventListener('change', terminoBusqueda));

    let busqueda = {
      categoria_id: +categoria.value || '',
      dia: +inputHiddenDia.value || ''
    }
    
    if(!Object.values(busqueda).includes('')) {  // Comprobar si el Objeto tiene todos los valores llenos
      (async () => {
        await buscarEventos();

        const id = inputHiddenHora.value;

        // Resaltar la Hora Actual
        const horaSeleccionada = document.querySelector(`[data-hora-id="${id}"]`);

        horaSeleccionada.classList.remove('horas__hora--deshabilitada');
        horaSeleccionada.classList.add('horas__hora--seleccionada');

        horaSeleccionada.onclick = seleccionarHora;
      })();
    }


    function terminoBusqueda(e) {
      busqueda[e.target.name] = e.target.value;  // Buscar los valores de cada Objeto

      // Reiniciar los campos ocultos y el selector de horas
      inputHiddenHora.value = '';
      inputHiddenDia.value = '';

      const horaPrevia = document.querySelector('.horas__hora--seleccionada');
      if(horaPrevia) {
        horaPrevia.classList.remove('horas__hora--seleccionada');
      }

      if(Object.values(busqueda).includes('')) {  // Comprobar si el Objeto tiene todos los valores llenos
        return;
      }

      buscarEventos();
    }


    // Buscar Conferencias y Workshops Disponibles
    async function buscarEventos() {
      const {dia, categoria_id} = busqueda
      const url = `/api/eventos-horario?dia_id=${dia}&categoria_id=${categoria_id}`;

      const resultado = await fetch(url);
      const eventos = await resultado.json();

      obtenerHorasDisponibles(eventos);
    }


    // Obtener la Lista de Horas Disponibles del Evento
    function obtenerHorasDisponibles(eventos) {
      // Reiniciar las Horas
      const listadoHoras = document.querySelectorAll('#horas li');  // Obtiene Todas las Horas
      listadoHoras.forEach(li => li.classList.add('horas__hora--deshabilitada'));

      // Comprobar Eventos ya tomados y quitar la Variable de Deshabilitado.
      const horasTomadas = eventos.map(evento => evento.hora_id);  // Obtiene las Horas Reservadas
      const listadoHorasArray = Array.from(listadoHoras);
      const resultado = listadoHorasArray.filter(li => !horasTomadas.includes(li.dataset.horaId));  // Filtra las Horas Disponibles (Todas - Reservadas)

      resultado.forEach(li => li.classList.remove('horas__hora--deshabilitada'));

      const horasDisponibles = document.querySelectorAll('#horas li:not(.horas__hora--deshabilitada)'); // Obtine las horas Disponibles.
      horasDisponibles.forEach(hora => hora.addEventListener('click', seleccionarHora));
    }


    // Seleccionar una Hora del Evento
    function seleccionarHora(e) {
      // Deshabilitar la Hora previa, Si hay un Nuevo Click
      const horaPrevia = document.querySelector('.horas__hora--seleccionada');
      if(horaPrevia) {
        horaPrevia.classList.remove('horas__hora--seleccionada');
      }

      // Agregar clase de Seleccionado
      e.target.classList.add('horas__hora--seleccionada');

      inputHiddenHora.value = e.target.dataset.horaId;

      // Llenar el input Oculto de dia
      inputHiddenDia.value = document.querySelector('[name="dia"]:checked').value;
    }
  }
})();