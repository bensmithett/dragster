# Dragster

**[✨✨ Demo ✨✨](http://bensmithett.github.io/dragster)**

**HTML5 `dragenter` and `dragleave` events [are crap](http://www.quirksmode.org/blog/archives/2009/09/the_html5_drag.html). Dragster gives you `dragster:enter` and `dragster:leave` events that behave just like `mouseenter` and `mouseleave` (or `:hover`).**

Detecting when the user has dragged over an element that has child elements sucks. It usually involves transparent overlay elements, listening to the constantly-firing `dragover` event, nuking every other event with `pointer-events: none`, or just giving up and designing a single element dropzone. 

## Usage

```
npm install --save dragster
```

```javascript
import { Dragster } from 'dragster'

// Create a Dragster instance with a DOM element
const d = new Dragster(document.querySelector('#dropzone'))

// The element will emit dragster events now 🎉
document.addEventListener('dragster:enter', (event) => {
  event.target.classList.add('dragged-over')
})
document.addEventListener('dragster:leave', (event) => {
  event.target.classList.add('dragged-over')
})

// Remove Dragster's event listeners when you're done
d.removeListeners()
```

## Browser support

Dragster works everywhere [`CustomEvent` is supported.](https://caniuse.com/customevent)

This module is built for `chrome90,edge90,firefox90,ios15,safari15`. If you need older browser support there's an ES2015 version too:

```javascript
import { Dragster } from 'dragster/dist/dragster-es2015.js'
```
