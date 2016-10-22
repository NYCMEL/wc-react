class Progressbar extends HTMLElement {

    constructor() {
        super();
    }

    // Called when your element is inserted in the DOM or
    // immediately after the constructor if it’s already in the DOM
    connectedCallback() {
       
      this.innerHTML  = `
            <div class="progress">
              <div class="progress-bar" role="progressbar"
              aria-valuemin="0" aria-valuemax="100" style="width:0%">
                0%
              </div>
            </div>`;
       this.move();
        
    }
    
    
   
    move() {
        
        let barEle = this.querySelector(".progress-bar");
        
        let progress = 0;
        let max= 100;
        
        let id = setInterval(frame, 10);
        function frame() {
            if (progress >= max) {
                clearInterval(id);
            } else {
                progress++;
                barEle.style.width = progress + '%';
                barEle.innerHTML = progress * 1 + '%';
            }
        }
    }

}

window.customElements.define('progress-bar', Progressbar);
