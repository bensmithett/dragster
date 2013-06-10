# Dragster
HTML5 `dragenter` and `dragleave` events [are crap](http://www.quirksmode.org/blog/archives/2009/09/the_html5_drag.html).

Dragster gives you brand new `dragster:enter` and `dragster:leave` events that behave just like `mouseenter` and `mouseleave`. 

## Setup

Include Dragster in your app.

```html
<script src="/lib/dragster.js"></script>
```

Make Dragster do its thing on the elements you would like to emit saner events.

```javascript
var dropzone = document.getElementById( "my-dropzone" )
new Dragster( dropzone );
```

Add some event listeners without pulling your hair out.

```javascript
document.addEventListener( "dragster:enter", function (e) {
  e.target.classList.add( "dragged-over" )
}, false );

document.addEventListener( "dragster:leave", function (e) {
  e.target.classList.remove( "dragged-over" )
}, false );
```

## License
Dragster is released under the [MIT License](http://ben.mit-license.org/)
