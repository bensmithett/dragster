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
      @el.dispatchEvent @dragsterEnterEvent

  dragleave: ( event ) =>
    if @second
      @second = false
    else if @first
      @first = false

    if !@first && !@second
      @el.dispatchEvent @dragsterLeaveEvent

  removeListeners: ->
    @el.removeEventListener "dragenter", @dragenter, false
    @el.removeEventListener "dragleave", @dragleave, false

  dragsterEnterEvent: new Event 'dragster:enter', { bubbles: true, cancelable: true }
  dragsterLeaveEvent: new Event 'dragster:leave', { bubbles: true, cancelable: true }

window.Dragster = Dragster
