import { Controller } from "@hotwired/stimulus"
// import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


// Connects to data-controller="timepicker"
export default class extends Controller {
  connect() {
    console.log('connected')
    flatpickr(this.element,{
      enableTime: true,
      noCalendar: true,
      dateFormat: "H",
      defaultDate: "09:00",
      touchUi: true,
      minuteIncrement: 60,
      minTime: "08:00",
      maxTime: "19:00"
    });
  }

}
