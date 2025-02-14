import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = 'This is the test task for managing Projects and there comments.'
  }
}
