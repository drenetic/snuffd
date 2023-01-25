import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["gonorrhoeaTarget", "revealgonorrhoeaResults",
                    "chlamydiaTarget","revealchlamydiaResults",
                    "syphilisTarget", "revealsyphilisResults",
                    "hivTarget", "revealhivResults",
                    "hepatitis_bTarget", "revealhepatitis_bResults",
                    "hepatitis_cTarget", "revealhepatitis_cResults"];

  connect() {
    console.log("The Toggler Controller is now loaded");
    this.revealgonorrhoeaResults();
    this.revealchlamydiaResults();
    this.revealsyphilisResults();
    this.revealhivResults();
    this.revealhepatitis_cResults();
    this.revealhepatitis_bResults();
  }

   revealgonorrhoeaResults() {
    if (this.gonorrhoeaTargetTarget.checked) {
      this.revealgonorrhoeaResultsTarget.style.display = "block";
    } else {
      this.revealgonorrhoeaResultsTarget.style.display = "none";
    }
  }

  revealchlamydiaResults() {
    if (this.chlamydiaTargetTarget.checked) {
      this.revealchlamydiaResultsTarget.style.display = "block";
    } else {
      this.revealchlamydiaResultsTarget.style.display = "none";
    }
  }

  revealsyphilisResults() {
    if (this.syphilisTargetTarget.checked) {
      this.revealsyphilisResultsTarget.style.display = "block";
    } else {
      this.revealsyphilisResultsTarget.style.display = "none";
    }
  }

  revealhivResults() {
    if (this.hivTargetTarget.checked) {
      this.revealhivResultsTarget.style.display = "block";
    } else {
      this.revealhivResultsTarget.style.display = "none";
    }
  }

  revealhepatitis_bResults() {
    if (this.hepatitis_bTargetTarget.checked) {
      this.revealhepatitis_bResultsTarget.style.display = "block";
    } else {
      this.revealhepatitis_bResultsTarget.style.display = "none";
    }
  }

  revealhepatitis_cResults() {
    if (this.hepatitis_cTargetTarget.checked) {
      this.revealhepatitis_cResultsTarget.style.display = "block";
    } else {
      this.revealhepatitis_cResultsTarget.style.display = "none";
    }
  }

}
