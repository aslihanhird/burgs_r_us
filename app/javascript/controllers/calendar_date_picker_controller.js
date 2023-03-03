import { Controller } from "@hotwired/stimulus"
import { DateRangePicker } from 'vanillajs-datepicker'

// Connects to data-controller="calendar-date-picker"
export default class extends Controller {
  static targets = ['dates'];

  connect() {
    const beginPicker = new DateRangePicker(this.datesTarget);
  }


}
