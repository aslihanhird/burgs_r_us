import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-modal"
export default class extends Controller {
  static targets=[ "form", "modal", "start" ]

  connect() {
    const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
    // const startValue = this.element.startTarget;
    // const booking = params[:booking_id],
    // const modal_toggle = @modal_toggle,
    console.log('Hi asli!');
    console.log('the controller:' ,this.element);
    console.log(myModal)

    myModal.show()

  }

  send(event) {
    // event.preventDefault()
  }
}
