import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "overlay",
    "tick",
    "padelFilterElement",
    "basketballFilterElement",
    "tennisFilterElement",
    "netballFilterElement",
    "tableTennisFilterElement",
    "quidditchFilterElement",
    "footballFilterElement",
    "badmintonFilterElement",
    "list",
    "checkbox",
    "label",
    "price"
  ];

  toggleAllCheckboxes(event) {
    const checked = event.target.checked;
    this.tickTargets.forEach((tick) => {
      tick.checked = checked;
    });
  }

  openOverlay() {
    document.body.classList.add('overlay-open');
    this.overlayTarget.classList.remove("d-none");
  }

  closeOverlay() {
    document.body.classList.remove('overlay-open');
    this.overlayTarget.classList.add("d-none");
  }

  filterResults(event) {
    event.preventDefault();
    let filters = [];

    if (this.padelFilterElementTarget.checked) {
      filters.push("padel=padel");
    }
    if (this.basketballFilterElementTarget.checked) {
      filters.push("basketball=basketball");
    }
    if (this.tennisFilterElementTarget.checked) {
      filters.push("tennis=tennis");
    }
    if (this.footballFilterElementTarget.checked) {
      filters.push("football=football");
    }
    if (this.netballFilterElementTarget.checked) {
      filters.push("netball=netball");
    }
    if (this.badmintonFilterElementTarget.checked) {
      filters.push("badminton=badminton");
    }
    if (this.tableTennisFilterElementTarget.checked) {
      filters.push("table_tennis=table_tennis");
    }
    if (this.quidditchFilterElementTarget.checked) {
      filters.push("quidditch=quidditch");
    }

    const checkedPriceInput = this.priceTargets.find(priceTarget => priceTarget.checked);
    if (checkedPriceInput) {
      filters.push(`price=${checkedPriceInput.value}`);
    }

    const queryString = filters.join("&");
    const url = `/venues/?query=detailed_filters&${queryString}`;

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
      })
      .catch((error) => {
        console.error('Error fetching filtered results:', error);
      });

    this.closeOverlay();
  }

  resetFilters() {
    this.tickTargets.forEach((checkbox) => {
      checkbox.checked = false;
    });

    this.priceTargets.forEach((price) => {
      price.checked = false;
    });

    const url = `/venues/?query=detailed_filters`;

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
      })
      .catch((error) => {
        console.error('Error fetching unfiltered results:', error);
      });

    this.closeOverlay();
  }

  uncheckAll(event) {
    this.resetFilters();
  }
}
