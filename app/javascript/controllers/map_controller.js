import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#openInfoWindow()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
      newMarker.getElement().dataset.markerId = marker.id;
      // Put a microphone on the new marker listening for a mouseenter event
      newMarker.getElement().addEventListener('mouseenter', (e) => this.#toggleCardHighlighting(e));
      // We put a microphone on listening for a mouseleave event
      newMarker.getElement().addEventListener('mouseleave', (e) => this.#toggleCardHighlighting(e));

    })
  }



  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #openInfoWindow() {
    // Select all cards
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
      // Put a microphone on each card listening for a mouseenter event
      card.addEventListener('mouseenter', () => {
        // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
        this.markersValue[index].togglePopup();
      });
      // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
      card.addEventListener('mouseleave', () => {
        this.markersValue.markers[index].togglePopup();
      });
    });
  }
  #toggleCardHighlighting(event) {
    // We select the card corresponding to the marker's id
    const card = document.querySelector(`[data-flat-id="${event.currentTarget.dataset.markerId}"]`);
    // Then we toggle the class "highlight github" to the card
    card.classList.toggle('highlight');
  }
}
