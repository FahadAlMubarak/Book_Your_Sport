import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="auto-submit"
// export default class extends Controller {

//   static targets = ["checkbox", "button"]

//   connect() {
//     this.buttonTarget.addEventListener('click', this.bookSlots.bind(this));
//   }

//   bookSlots() {
//     const selectedSlots = [];

//     this.checkboxTargets.forEach(checkbox => {
//       if (checkbox.checked) {
//         selectedSlots.push({
//           slot_id: checkbox.dataset.slotId,
//           start_time: checkbox.dataset.slotStart,
//           end_time: checkbox.dataset.slotEnd
//         });
//       }
//     });
//   }

//   // submitBookForm(event) {
//   //   const form = event.currentTarget.querySelector("form");
//   //   Swal.fire({
//   //     title: 'Book?',
//   //     text: 'Do you want to continue?',
//   //     icon: 'warning',
//   //     confirmButtonText: 'Confirm',
//   //     showCancelButton: true,
//   //     cancelButtonText: 'Cancel'
//   //   }).then((result) => {
//   //     if (result.isConfirmed) {
//   //       form.submit();
//   //     }
//   //   })
//   // }

// }

export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    // this.buttonTarget.addEventListener('click', this.bookSlots.bind(this));
  }

  bookSlots(event) {
    console.log(event);
    const selectedSlots = [];

    this.checkboxTargets.forEach(checkbox => {
      if (checkbox.checked) {
        selectedSlots.push({
          id: checkbox.dataset.slotId,
          start_time: checkbox.dataset.slotStart,
          end_time: checkbox.dataset.slotEnd
        });
      }
    });

    if (selectedSlots.length > 0) {
      // Sort slots by start_time to check for consecutive slots
      selectedSlots.sort((a, b) => new Date(a.start_time) - new Date(b.start_time));

      let consecutive = true;
      for (let i = 0; i < selectedSlots.length - 1; i++) {
        if (new Date(selectedSlots[i].end_time).getTime() !== new Date(selectedSlots[i + 1].start_time).getTime()) {
          consecutive = false;
          break;
        }
      }

    if (consecutive) {
      Swal.fire({
        title: 'Book?',
        text: 'Do you want to continue?',
        icon: 'warning',
        confirmButtonText: 'Confirm',
        showCancelButton: true,
        cancelButtonText: 'Cancel'
      }).then((result) => {
        if (result.isConfirmed) {
            fetch(`/slots/${selectedSlots[0].id}/multi_bookings`, {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
                // 'Accept': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
              },
              body: JSON.stringify({ bookings: {slots: selectedSlots } })
            })
            .then(response =>
            //   response.text())
            // .then((data) =>{
            //   console.log(data);
            // })

            window.location.href = response.url)
            // .then((data)=>{
            //   console.log(data);
            // })
            // .then(response => response.json())
            // .then(data => {
            //   if (data.success) {
            //     window.location.href = '/checkout_summary';
            //   } else {
            //     Swal.fire('Error', 'Booking failed. Please try again.', 'error');
            //   }
            // })
            // .catch(error => {
            //   console.error('Error:', error);
            //   Swal.fire('Error', 'An error occurred. Please try again.', 'error');
            // });
        }
      });
    } else {
      Swal.fire('Error', 'Selected slots are not consecutive. Please select consecutive slots.', 'error');
     }
  } else {
      Swal.fire('Info', 'Please select at least one slot to book.', 'info');
  }
}
}
