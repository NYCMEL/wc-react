/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-28 15:08:40 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var comps = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
comps.card = function(obj) {
    console.group("comps.card:", obj);

    obj.css("display","inline-block");

    let cw    = obj.attr("width");
    let ch    = obj.attr("heihgt");
    let img   = obj.find("card-img").attr("src");
    let imgh  = obj.find("card-img").attr("height") || "100%"
    let title = obj.find("card-title").html();
    let body  = obj.find("card-body").html();

    let html = `
	<div class="card" style="width:${cw}px;height:${ch}px;">
	  <img class="card-img-top" src="CARD_IMG" style="height:${imgh}">
	  <div class="card-block">
	    <h4 class="card-title">CARD_TITLE</h4>
	    <p class="card-body" style=height:${ch}>CARD_BODY</p>
	  </div>
	</div>`
    
    html = html.replace("CARD_IMG",     img);
    html = html.replace("CARD_TITLE", title);
    html = html.replace("CARD_BODY",   body);

    obj.html(html);

    console.groupEnd();
};
