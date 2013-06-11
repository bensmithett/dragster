# Dragster
HTML5 `dragenter` and `dragleave` events [are crap](http://www.quirksmode.org/blog/archives/2009/09/the_html5_drag.html). 

Detecting when the user has dragged over a complex dropzone is a world of pain that involves transparent overlay elements, hooking into the constantly-firing `dragover` event, or [doing this](http://stackoverflow.com/a/10906204/91934).

Dragster gives you sane new `dragster:enter` and `dragster:leave` events that behave just like `mouseenter` and `mouseleave`.

It's tiny (1k-ish) and unobtrusive - all it does is add a couple of event listeners for `dragenter` and `dragleave` on the elements that you specify. It doesn't do anything automagically, and doesn't cancel the original events.

## Setup

Just include Dragster in your app, then bootstrap your dropzone elements with Dragster so they can start emitting `dragster:` events. 

```javascript
var dropzone = document.getElementById( "my-dropzone" );
new Dragster( dropzone );
```

Then you can add some plain old event listeners without pulling your hair out.

```javascript
document.addEventListener( "dragster:enter", function (e) {
  e.target.classList.add( "dragged-over" );
}, false );

document.addEventListener( "dragster:leave", function (e) {
  e.target.classList.remove( "dragged-over" );
}, false );
```

You can teardown a Dragster instance by calling `removeListeners`

```javascript
dragster = new Dragster( dropzone );
// Dragging over dropzone emits dragster: events
dragster.removeListeners();
// Dragster events no longer emitted from dropzone
```

## Todo
- Cross browser testing. So far only tested in Chrome.
- Make it a Bower component.

## License
Dragster is released under the [MIT License](http://ben.mit-license.org/)
