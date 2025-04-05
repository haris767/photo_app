import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.picker = flatpickr(this.inputTarget, {
      dateFormat: "Y-m-d"
    })
  }

  fetchPhotos(event) {
    const selectedDate = this.inputTarget.value

    fetch(`/photos_by_date?date=${selectedDate}`, {
        headers: {
          Accept: "text/html"
        }
      })
    .then(response => response.text())
    .then(html => {
      document.getElementById("photos").innerHTML = html
    })
  }
}
