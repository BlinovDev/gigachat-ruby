import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    clear() {
        // Clear the message input field
        this.element.reset();
    }
}
