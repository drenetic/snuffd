import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showhide"
export default class extends Controller {
  static targets = ["input", "output"]
  connect() {
    this.toggle()
  }

  toggle() {
    if (this.inputTarget.checked) {
      this.outputTarget.hidden = false
    } else {
      this.outputTarget.hidden = true
    }
  }
}
