import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
  static targets = ["radio"];
  connect() {
    this.radioTargets.forEach(radio => {
      radio.addEventListener('click', () => {
        this.element.submit();
      });
    });
  }
}
