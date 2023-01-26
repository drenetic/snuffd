import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display"]

  initialize() {
    this.secondsRemaining = parseInt(this.data.get("seconds"))
    this.intervalId = setInterval(() => this.updateTimer(), 1000)
  }

  updateTimer() {
    let now = new Date()
    let expiration = new Date(this.data.get("expiration"))
    let timeRemaining = (expiration - now) / 1000
    let minutes = Math.floor(timeRemaining / 60)
    let seconds = Math.round(timeRemaining % 60)
    let timer = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`
    this.displayTarget.textContent = timer
    if (timeRemaining <= 0) {
      clearInterval(this.intervalId)
    }
  }
}
