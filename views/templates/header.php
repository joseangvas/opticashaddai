<header class="header">
  <div class="header__contenedor">
    <nav class="header__navegacion">
      <!-- <div class="header__logotipo"></div> -->
      <?php if(is_auth()) { ?>
        <a href="<?php echo is_admin() ? '/admin/dashboard' : '/finalizar-registro'; ?>" class="header__enlace">Administrar</a>

        <form method="POST" action="/logout" class="header__form">
          <input type="submit" value="Cerrar Sesión" class="header__submit">
        </form>
      <?php } else { ?>
        <a href="/registro" class="header__enlace">Registro</a>
        <a href="/login" class="header__enlace">Iniciar Sesión</a>
      <?php } ?>
    </nav>

    <div class="header__contenido">
      <a href="/">
        <h1 class="header__logo">
          Servicio Optico Shaddai
        </h1>
      </a>

      <p class="header__texto">R.I.F. J-500538626</p>
      <p class="header__texto header__texto--modalidad">Examen de la Vista - Monturas</p>

    </div>
  </div>
</header>

<div class="barra">
  <div class="barra__contenido">
    <a href="/">
      <h2 class="barra__logo">
        Inicio
      </h2>
    </a>

    <nav class="navegacion">
      <a href="/acercade" class="navegacion__enlace <?php echo pagina_actual('/acercade') ? 'navegacion__enlace--actual' : ''; ?>">Quienes somos</a>
      <a href="/paquetes" class="navegacion__enlace <?php echo pagina_actual('/paquetes') ? 'navegacion__enlace--actual' : ''; ?>">Servicios</a>
      <a href="/workshops-conferencias" class="navegacion__enlace <?php echo pagina_actual('/workshops-conferencias') ? 'navegacion__enlace--actual' : ''; ?>">Monturas</a>
      <a href="/registro" class="navegacion__enlace <?php echo pagina_actual('/registro') ? 'navegacion__enlace--actual' : ''; ?>">Registrarse</a>
    </nav>
  </div>
</div>