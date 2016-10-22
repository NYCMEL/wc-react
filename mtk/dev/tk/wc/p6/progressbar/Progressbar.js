class Progressbar extends HTMLElement {

    constructor() {
        super();
    }

    // Called when your element is inserted in the DOM or
    // immediately after the constructor if it’s already in the DOM
    connectedCallback() {
      this.innerHTML = '<div></div>';
      this._el = $(this.querySelector("div"))
      this._el.progressbar({
        value: 0,
        max: 100
      });  
    }
    
    configure (config) {
      this._el.progressbar({
        complete: config.onComplete || function () {
          console.log("default complete callback if not provided in config");
        },
        change: function() {
          if(config.onChange){
            config.onChange($(this).progressbar("option", "value"));
          }
          },
      });
    }
    
    move(value) {
      this._el.progressbar( "option", "value", value || 0 );
    }
    
    complete() {
      this._el.progressbar( "option", "value", 100 );
    }
    
}

window.customElements.define('progress-bar', Progressbar);
