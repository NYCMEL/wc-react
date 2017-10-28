/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-28 14:42:27 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var comps = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
comps.card = function(obj) {
    console.group("comps.card:", obj);

    let img     = obj.find("card-img").attr("src");
    let iheight = obj.attr("img-height") || "100%"
    let title   = obj.find("card-title").html();
    let descr   = obj.find("card-description").html();

    let html = `
	<div class="card">
	  <img class="card-img-top" src="CARD_IMG" style="height:${iheight}">
	  <div class="card-block">
	    <h4 class="card-title">Card Title</h4>
	    <p class="card-description">Card Description</p>
	  </div>
	</div>`
    
    html = html.replace("CARD_IMG", img);
    html = html.replace("CARD_TITLE", title);
    html = html.replace("CARD_DESCRIPTION", descr);

    obj.html(html);

    console.groupEnd();
};
