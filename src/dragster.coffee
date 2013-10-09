class Dragster
  constructor: ( @el ) ->
    if @supportsEventConstructors()
      @first = false
      @second = false

      @el.addEventListener "dragenter", @dragenter, false
      @el.addEventListener "dragleave", @dragleave, false

      @dragsterEnterEvent = new CustomEvent 'dragster:enter', { bubbles: true, cancelable: true }
      @dragsterLeaveEvent = new CustomEvent 'dragster:leave', { bubbles: true, cancelable: true }

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

  supportsEventConstructors: ->
    try new CustomEvent("z") catch then return false
    return true


window.Dragster = Dragster
