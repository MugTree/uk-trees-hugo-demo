const map = L.map("map");

L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

let bounds = [];

for (let i = 0; i < markers.length; i++) {
  // Create popup for each marker
  const popup = L.popup()
    .setLatLng([markers[i].latitude, markers[i].longitude])
    .setContent(markers[i].name) // Use the name from markers array
    .addTo(map); // Add popup to map

  // Add the marker position to bounds array for fitting the map
  bounds.push([markers[i].latitude, markers[i].longitude]);
}

// Fit map to bounds after adding all markers
map.fitBounds(bounds).zoomOut(1);
