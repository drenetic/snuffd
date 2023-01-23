import { Controller } from "@hotwired/stimulus"
// const infections = ["gonorrhoea", "chlamydia"]

export default class extends Controller {
  // static targets = infections.flatMap( infection => [`${infection}Target`,
  //  `reveal${infection}Results`])

  static targets = ["gonorrhoeaTarget", "revealgonorrhoeaResults"]

  connect() {
    console.log("The Results Controller is now loaded");
    console.log(this.targets);
    console.log(this.gonorrhoeaTarget);
    console.log(this.revealgonorrhoeaResults);
  }

  // revealGonorrhoeaResults() {
  //   if (this.gonorrhoeaTarget.checked) {
  //     this.revealgonorrhoeaResults.style.display = "block";
  //   } else {
  //     this.revealgonorrhoeaResults.style.display = "none";
  //   }
  // }

  // revealChlamydiaResults() {
  //   if (this.chlamydiaTarget.checked) {
  //     this.revealchlamydiaResults.style.display = "block";
  //   } else {
  //     this.revealchlamydiaResults.style.display = "none";
  //   }
  // }
}
