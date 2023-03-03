import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-modal"
export default class extends Controller {
  static targets=["form", "modal"]

  connect() {
    console.log('Hi asli!')
    console.log('the controller:' ,this.element),
    console.log('the form:' ,this.formTarget)
  }

  send(event) {
    // event.preventDefault()
  }
}
