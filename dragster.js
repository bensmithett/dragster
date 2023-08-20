export class Dragster {
  #element
  #first = false
  #second = false

  constructor (element) {
    this.#element = element
    this.#element.addEventListener('dragenter', this.#dragenter)
    this.#element.addEventListener('dragleave', this.#dragleave)
    this.#element.addEventListener('drop', this.#drop)
  }

  removeListeners = () => {
    this.#element.removeEventListener('dragenter', this.#dragenter)
    this.#element.removeEventListener('dragleave', this.#dragleave)
    this.#element.removeEventListener('drop', this.#drop)
  }

  #dragenter = (event) => {
    if (this.#first) {
      this.#second = true
    } else {
      this.#first = true

      const enterEvent = new CustomEvent('dragster:enter', {
        bubbles: true,
        cancelable: false,
        detail: {
          dataTransfer: event.dataTransfer,
          sourceEvent: event
        }
      })

      this.#element.dispatchEvent(enterEvent)
    }
  }

  #dragleave = (event) => {
    if (this.#second) {
      this.#second = false
    } else if (this.#first) {
      this.#first = false
    }

    if (!this.#first && !this.#second) {
      const leaveEvent = new CustomEvent('dragster:leave', {
        bubbles: true,
        cancelable: false,
        detail: {
          dataTransfer: event.dataTransfer,
          sourceEvent: event
        }
      })

      this.#element.dispatchEvent(leaveEvent)
    }
  }

  #drop = (event) => {
    this.#first = false
    this.#second = false
    this.#dragleave(event)
  }
}
