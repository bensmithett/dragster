class @DragsterJquery
  constructor: ( @selector, @parent = document ) ->
    if @supportsEventConstructors()
      @first = false
      @second = false

      $(@parent).on "dragenter", selector, @dragenter
      $(@parent).on "dragleave", selector, @dragleave

      @dragsterEnterEvent = $.Event("dragster:enter")
      @dragsterLeaveEvent = $.Event("dragster:leave")

  dragenter: ( event ) =>
    if @first
      @second = true
    else
      @first = true
      $(@parent).find(@selector).trigger(@dragsterEnterEvent)

  dragleave: ( event ) =>
    if @second
      @second = false
    else if @first
      @first = false

    if !@first && !@second
      $(@parent).find(@selector).trigger(@dragsterLeaveEvent)

  removeListeners: ->
    $(@parent).off("dragenter dragleave", @selector)

  supportsEventConstructors: ->
    try new CustomEvent("z") catch then return false
    return true
