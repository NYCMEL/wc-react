class Progressbar extends HTMLElement {

    constructor() {
        super();
    }

    // Called when your element is inserted in the DOM or
    // immediately after the constructor if it’s already in the DOM
    connectedCallback() {
        this.template = `
            <div class="bar-container">
                <div class="bar">
                    <div class="bar-label">10%</div>
                </div>
            </div>`;
        this._max = parseInt(this.getAttribute("max") || 100);
        this._value = 0;
        this._color = 'green';

        this.innerHTML  = this.template;
        this.move();
    }

    // A getter/setter for an max property which is also available as a tag attribute.
    get max() {
        return parseInt(this.getAttribute('max'));
    }

    set max(val) {
        // Reflect the value of the max property as an instance property.
        if (val) {
            this.setAttribute('max', val);
            this._max= val;
            this.move();
        }
    }

    // A getter/setter for an _color property.
    get color() {
        return this._color;
    }

    set color(newColor) {
        // Update the '_color' instance property.
        if (newColor) {
            this.querySelector(".bar").style.backgroundColor = newColor;
            this._color = newColor;
        }
    }

   
    move() {
        let barEle = this.querySelector(".bar");
        let  labelEle = this.querySelector(".bar-label");
        let width = 1;
        let id = setInterval(frame, 10);
        let max = this._max;
        function frame() {
            if (width >= max) {
                clearInterval(id);
            } else {
                width++;
                barEle.style.width = width + '%';
                labelEle.innerHTML = width * 1 + '%';
            }
        }
    }

}

window.customElements.define('progress-bar', Progressbar);
