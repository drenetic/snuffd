// import {Controller} from '@hotwired/stimulus';

// export default class extends Controller {
//   static targets = ['element'];
//   static classes = ['hidden'];

//   show() {
//     this.elementTarget.classList.remove(this.hiddenClass);
//   }

//   hide() {
//     this.elementTarget.classList.add(this.hiddenClass);
//   }
// }

// import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "element", "form", "input","secureCodeError" ]
  static classes = ['hidden'];

  submit(event) {
    event.preventDefault()

    // Get the input value
    const secureCode = this.inputTarget.value

    // Send an HTTP request to your server to validate the secure code
    fetch('/validate_secure_code', {
      method: 'POST',
      body: JSON.stringify({ secure_code: secureCode }),
      headers: { 'Content-Type': 'application/json' },
    })
    .then(response => response.json())
    .then(data => {
      if (data.valid) {
        // Secure code is valid, show the form
        console.log(data);
        // this.formTarget.classList.remove('hidden')
        // this.secureCodeErrorTarget.classList.add('hidden')
      } else {
        // Secure code is invalid, show an error message
        console.log("error");
        console.log(data);
        // this.secureCodeErrorTarget.innerHTML = "Please enter a valid code"
        // this.secureCodeErrorTarget.classList.remove('hidden')
      }
    })
  }
}
