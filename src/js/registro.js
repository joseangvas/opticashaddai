import Swal from 'sweetalert2'

(function() {
  let eventos = [];

  const resumen = document.querySelector('#registro-resumen')

  if(resumen) {
    const eventosBoton = document.querySelectorAll('.evento__agregar');
    eventosBoton.forEach(boton => boton.addEventListener('click', seleccionarEvento))

    const formularioRegistro = document.querySelector('#registro')
    formularioRegistro.addEventListener('submit', submitFormulario)

    mostrarEventos()

    function seleccionarEvento(e) {
      if(eventos.length < 5) {
        const {target} = e   // target toma el valor de e incluido
        
        // Desabilitar el Evento una vez seleccionado
        target.disabled = true
    
        // Agregar el Evento al Arreglo eventos
        eventos = [...eventos, {
          id: target.dataset.id,
          titulo: target.parentElement.querySelector('.evento__nombre').textContent.trim()
        }]

        mostrarEventos()
      } else {
          swal.fire ({
            title: 'Error',
            text: 'Sólo se permite un máximo de 5 eventos',
            icon: 'error',
            confirmButtonText: 'OK'
          })
      }
    }

    function mostrarEventos() {
      // Limpiar el HTML
      limpiarEventos()

      if(eventos.length > 0) {
        eventos.forEach(evento => {
          const eventoDOM = document.createElement('DIV')
          eventoDOM.classList.add('registro__evento')

          const titulo = document.createElement('H3')
          titulo.classList.add('registro__nombre')
          titulo.textContent = evento.titulo

          // Botón para Eliminar un Evento Seleccionado
          const botonEliminar = document.createElement('BUTTON')
          botonEliminar.classList.add('registro__eliminar')
          botonEliminar.innerHTML = `<i class="fa-solid fa-trash"></i>`
          botonEliminar.onclick = function() {
            eliminarEvento(evento.id)
          }

          // Renderizar en el HTML
          eventoDOM.appendChild(titulo)
          eventoDOM.appendChild(botonEliminar)
          resumen.appendChild(eventoDOM)

        })
      } else {
        const noRegistro = document.createElement('P')
        noRegistro.textContent = 'No hay Eventos. Selecciona hasta 5 del lado izquierdo'
        noRegistro.classList.add('registro__texto')
        resumen.appendChild(noRegistro)
      }
    }

    function eliminarEvento(id) {
      eventos = eventos.filter(evento => evento.id !== id)
      const botonAgregar = document.querySelector(`[data-id="${id}"]`)
      botonAgregar.disabled = false
      mostrarEventos()
    }

    function limpiarEventos() {
      while(resumen.firstChild) {
        resumen.removeChild(resumen.firstChild)
      }
    }

    async function submitFormulario(e) {
      e.preventDefault()

      // Obtener el Regalo
      const regaloId = document.querySelector('#regalo').value
      const eventosId = eventos.map(evento => evento.id)

      if(eventosId.length === 0 || regaloId === '') {
        Swal.fire ({
          title: 'Error',
          text: 'Elige al menos 1 evento y 1 regalo',
          icon: 'error',
          confirmButtonText: 'OK'
        })

        return
      }

      // Crear Objeto de FormData
      const datos = new FormData()
      datos.append('eventos', eventosId)
      datos.append('regalo_id', regaloId)

      const url = '/finalizar-registro/conferencias'
      const respuesta = await fetch(url, {
        method: 'POST',
        body: datos
      })

      const resultado = await respuesta.json()

      if(resultado.resultado) {
        Swal.fire(
          'Registro Exitoso',
          'Tus Conferencias se han almacenado y tu Registro fué exitoso. Te esperamos en DevWebCamp',
          'success'
        ).then( () => location.href = `/boleto?id=${resultado.token}` )
      } else {
        Swal.fire ({
          title: 'Error',
          text: 'Hubo un Error',
          icon: 'error',
          confirmButtonText: 'OK'
        }).then( () => location.reload() )
      }
    }
  }
})();