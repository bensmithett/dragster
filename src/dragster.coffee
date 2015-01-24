class Dragster
  constructor: ( @el ) ->
    @first = false
    @second = false

    @el.addEventListener "dragenter", @dragenter, false
    @el.addEventListener "dragleave", @dragleave, false

  dragenter: ( event ) =>
    if @first
      @second = true
    else
      @first = true

      @customEvent = document.createEvent "CustomEvent"
      @customEvent.initCustomEvent "dragster:enter", true, true,
        dataTransfer: event.dataTransfer,
        sourceEvent: event

      @el.dispatchEvent @customEvent

  dragleave: ( event ) =>
    if @second
      @second = false
    else if @first
      @first = false

    if !@first && !@second

      @customEvent = document.createEvent "CustomEvent"
      @customEvent.initCustomEvent "dragster:leave", true, true,
        dataTransfer: event.dataTransfer,
        sourceEvent: event

      @el.dispatchEvent @customEvent

  removeListeners: ->
    @el.removeEventListener "dragenter", @dragenter, false
    @el.removeEventListener "dragleave", @dragleave, false

  # Call after drop
  reset: ->
    @first = false
    @second = false

window.Dragster = Dragster
