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
        
    }
    
    init(config) {
      this._max = config.max || 100;
      this._color = config.color || 'green';

      this.innerHTML  = this.template;
      this.querySelector(".bar").style.backgroundColor = this._color;
            
      this.move();
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
