import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-facility"
export default class extends Controller {
static targets= [ 'template', 'facilitiesWrapper', "facilityForm"]

  connect() {
  }

  add(event){
  event.preventDefault()
  const clone = this.templateTarget.content.cloneNode(true);
      this.facilitiesWrapperTarget.appendChild(clone);
      // retrieve last facility form clone
      //change every input id +1
    const forms = Array.from(this.facilityFormTargets)
console.log(forms)
    if (forms.length > 1){
     const form = forms[forms.length -1]
     console.log(forms.length)
     console.log(form)
     form.querySelectorAll("input").forEach((input)=>{

      // Regular expression to match content within square brackets
      const regex = /\[([^\[\]]+)\]/g;

      // Use match method to get all matches
      const matches = [];
      let match;
      while ((match = regex.exec(input.name)) !== null) {
        matches.push(match[1]);
      }
      console.log(matches)
      const id = parseInt(matches[1]) + forms.length -1
      const att = matches[2]
      const name = `venue[facilities_attributes][${id}][${att}]`
      input.name = name

     })
    }
  }
}
