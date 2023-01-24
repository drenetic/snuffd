import { Controller } from "@hotwired/stimulus"
// const infections = ["gonorrhoea", "chlamydia"]

export default class extends Controller {
  static targets = ["gonorrhoeaTarget", "revealgonorrhoeaResults"];
  connect() {
    console.log("The Results Controller is now loaded");
    console.log(this.gonorrhoeaTargetTarget);
    console.log(this.revealgonorrhoeaResultsTarget);
    this.revealgonorrhoeaResults()
  }

  //  revealgonorrhoeaResults() {
  //   if (this.gonorrhoeaTargetTarget.checked) {
  //     this.revealgonorrhoeaResultsTarget.style.display = "block";
  //   } else {
  //     this.revealgonorrhoeaResultsTarget.style.display = "none";
  //   }
  // }

  revealgonorrhoeaResults() {
    const elements = querySelectorAll("revealgonorrhoeaResults");
      if (this.gonorrhoeaTargetTarget.checked) {
        elements.forEach(element => element.style.display = "block")
      } else {
        elements.forEach(element => element.style.display = "none")
      }
    }
}
