# Dragster
:sparkles::sparkles:**[Demo](http://bensmithett.github.io/dragster)**:sparkles::sparkles:

HTML5 `dragenter` and `dragleave` events [are crap](http://www.quirksmode.org/blog/archives/2009/09/the_html5_drag.html). Dragster gives you sane new `dragster:enter` and `dragster:leave` events that behave just like `mouseenter` and `mouseleave`.

Detecting when the user has dragged over a dropzone with child elements sucks. It usually involves transparent overlay elements, listening to the constantly-firing `dragover` event or nuking every other event with `pointer-events: none`.

Dragster is tiny (417 bytes minified & gzipped), unobtrusive & doesn't do much - it just add a couple of event listeners for `dragenter` and `dragleave` on the elements that you specify. It never does anything automagically, and doesn't cancel the original events.

Dragster works in latest stable Chrome, Firefox, Safari & Opera. It does nothing at all in IE 7-10 (IE [doesn't support DOM event constructors](http://www.2ality.com/2013/06/triggering-events.html)).

@catmanjan maintains a [jQuery plugin version](https://github.com/catmanjan/jquery-dragster) of Dragster if you'd like better cross browser support.

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

## Contributing
Dragster is written in [CoffeeScript](http://coffeescript.org/).

```
npm install
npm run build
```

## License
Dragster is released under the [MIT License](http://ben.mit-license.org/)
