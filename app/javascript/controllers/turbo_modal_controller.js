import { Controller } from "@hotwired/stimulus"
import { Modal } from 'flowbite';

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  initialize() {
    const modalElem = document.querySelector('#smallModal');
    const options = {
      backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
      onHide: (e) => {
        const backdrop = document.querySelector('[modal-backdrop]')
        if (backdrop) {
          backdrop.remove();
        }
        const turboFrame = document.querySelector('turbo-frame#modal')
        turboFrame.replaceChildren()
        turboFrame.removeAttribute("src")
      }
    }
    this.modal = new Modal(modalElem, options);
  }
  hideModal() {
    this.modal.hide()
  }
  show(e) {
    this.modal.show()
  }
  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

}
