class Dragster
  constructor: ( @el ) ->
    if @supportsEventConstructors()
      @first = false
      @second = false

      @el.addEventListener "dragenter", @dragenter, false
      @el.addEventListener "dragleave", @dragleave, false

  dragenter: ( event ) =>
    if @first
      @second = true
    else
      @first = true
      @el.dispatchEvent new CustomEvent 'dragster:enter', 
        bubbles: true
        cancelable: true
        detail: 
          dataTransfer: event.dataTransfer

  dragleave: ( event ) =>
    if @second
      @second = false
    else if @first
      @first = false

    if !@first && !@second
      @el.dispatchEvent new CustomEvent 'dragster:leave', 
        bubbles: true
        cancelable: true
        detail: 
          dataTransfer: event.dataTransfer

  removeListeners: ->
    @el.removeEventListener "dragenter", @dragenter, false
    @el.removeEventListener "dragleave", @dragleave, false

  supportsEventConstructors: ->
    try new CustomEvent("z") catch then return false
    return true

  # Call after drop
  reset: ->
    @first = false
    @second = false


window.Dragster = Dragster
