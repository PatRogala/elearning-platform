import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cookie-consent"
export default class extends Controller {
  static targets = [ "container", "acceptButton", "rejectButton" ]
  containerTarget: HTMLElement
  acceptButtonTarget: HTMLElement
  rejectButtonTarget: HTMLElement

  connect() {
    if (!this.hasConsented()) {
      this.containerTarget.classList.remove('hidden')
    }

    this.acceptButtonTarget.addEventListener('click', () => {
      this.accept()
    })

    this.rejectButtonTarget.addEventListener('click', () => {
      this.reject()
    })
  }

  hasConsented() {
    return document.cookie.includes('cookie_consent=accepted')
  }

  accept() {
    document.cookie = 'cookie_consent=accepted; max-age=31536000; path=/'
    this.containerTarget.classList.add('hidden')
  }

  reject() {
    document.cookie = 'cookie_consent=; max-age=0; path=/'
    this.containerTarget.classList.add('hidden')
  }
}
