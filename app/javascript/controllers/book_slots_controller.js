import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="auto-submit"
export default class extends Controller {

  submitBookForm(event) {
    const form = event.currentTarget.querySelector("form");
    Swal.fire({
      title: 'Book?',
      text: 'Do you want to continue?',
      icon: 'warning',
      confirmButtonText: 'Confirm',
      showCancelButton: true,
      cancelButtonText: 'Cancel'
    }).then((result) => {
      if (result.isConfirmed) {
        form.submit();
      }
    })
  }

}
