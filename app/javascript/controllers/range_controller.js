import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const range = this.element.querySelector(".range-selected");
    const rangeInput = this.element.querySelectorAll(".range-input input");
    const rangePrice = this.element.querySelectorAll(".range-price input");

    rangeInput.forEach((input) => {
      input.addEventListener("input", (e) => {
        let minRange = parseInt(rangeInput[0].value);
        let maxRange = parseInt(rangeInput[1].value);
        if (maxRange - minRange < rangeMin) {
          if (e.target.className === "min") {
            rangeInput[0].value = maxRange - rangeMin;
          } else {
            rangeInput[1].value = minRange + rangeMin;
          }
        } else {
          rangePrice[0].value = minRange;
          rangePrice[1].value = maxRange;
          range.style.left = (minRange / rangeInput[0].max) * 100 + "%";
          range.style.right =
            100 - (maxRange / rangeInput[1].max) * 100 + "%";
        }
      });
    });

    rangePrice.forEach((input) => {
      input.addEventListener("input", (e) => {
        let minPrice = rangePrice[0].value;
        let maxPrice = rangePrice[1].value;
        if (
          maxPrice - minPrice >= rangeMin &&
          maxPrice <= rangeInput[1].max
        ) {
          if (e.target.className === "min") {
            rangeInput[0].value = minPrice;
            range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
          } else {
            rangeInput[1].value = maxPrice;
            range.style.right =
              100 - (maxPrice / rangeInput[1].max) * 100 + "%";
          }
        }
      });
    });
  }
}
