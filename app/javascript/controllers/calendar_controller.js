import { Controller } from "@hotwired/stimulus"
import { DateRangePicker } from 'vanillajs-datepicker';

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ['form']
  connect() {
    console.log("connect")
    const picker = new DateRangePicker(this.formTarget, {
      format: "dd/mm/yyyy"
    })
  }
}
