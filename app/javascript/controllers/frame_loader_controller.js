import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="frame-loader"
export default class extends Controller {
  connect() {
  }

  load(event) {
    const frameId = "task_details"
    const url = this.element.dataset.url

    const frame = document.getElementById(frameId)
    if (frame && url) {
      frame.src = url
    }
  }
}
