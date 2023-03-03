import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-modal"
export default class extends Controller {
  static targets=[ "form", "modal", "start" ]

  connect() {
    const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));

    myModal.show()
  }
}
