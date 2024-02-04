if(document.querySelector('#mapa')) {
  const lat = 10.31625053508156;
  const lng = -67.56062364656621;
  const zoom = 16

  var map = L.map('mapa').setView([lat, lng], zoom);

  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  L.marker([lat, lng]).addTo(map)
    .bindPopup(`
      <h3 class="mapa__heading">DevWebCamp</h3>
      <p class="mapa__texto">Hotel Pipo Internacional</p>
    `)
  .openPopup();
}