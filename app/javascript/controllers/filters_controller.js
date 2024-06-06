import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["venues"];

  filter() {
    // Get the checked sports
    let checkedSports = this.element.querySelectorAll(":checked");
    let selectedSports = Array.from(checkedSports).map((checkbox) => checkbox.value);
    if (selectedSports.length === 0) {
      this.venuesTargets.forEach((venue) => {
        venue.style.display = "block"
      })
    } else {

      // Show/hide venues based on selected sports
      this.venuesTargets.forEach((venue) => {
        const venueSports = venue.dataset.sports.split(",");
        const shouldShow = venueSports.some((sport) => selectedSports.includes(sport.trim()));
        venue.style.display = shouldShow ? "block" : "none";
      });
    }
  }
}
