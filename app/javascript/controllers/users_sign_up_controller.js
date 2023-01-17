import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["is_provider","reveal_provider_number"]

  onload() {
    console.log("The 'provider_reveal_number' controller is now loaded");
  }

  connect() {
    this.is_providerTarget.addEventListener("change", this.checkIsProvider.bind(this));
    this.checkIsProvider();
  }

  checkIsProvider() {
    if (this.is_providerTarget.checked) {
      this.reveal_provider_numberTarget.style.display = "block";
    } else {
      this.reveal_provider_numberTarget.style.display = "none";
    }
  }

  // submit(event) {
  //   event.preventDefault();
  //   console.log("Form submitted.");
  //   // Your form submission logic here
  // }

}
