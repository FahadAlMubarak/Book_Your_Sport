import { Controller } from "@hotwired/stimulus";

// popup_controller.js


export default class extends Controller {
  static targets = ["overlay"]
  connect() {

  }
  toggle() {
    this.overlayTarget.classList.toggle('show');
}
};
