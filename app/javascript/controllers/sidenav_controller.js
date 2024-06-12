import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  openMenu() {
    this.menuTarget.style.width = "250px"; // Adjust the width as needed
  }

  closeMenu() {
    this.menuTarget.style.width = "0";
  }
}
