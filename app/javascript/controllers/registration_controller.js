import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["isProvider","revealProviderNumber"]
  connect() {
    console.log("The 'provider_reveal_number' controller is now loaded");
    console.log(this.isProviderTarget)
    this.checkIsProvider();
  }

  checkIsProvider() {
    if (this.isProviderTarget.checked) {
      this.revealProviderNumberTarget.style.display = "block";
    } else {
      this.revealProviderNumberTarget.style.display = "none";
    }
  }

}
