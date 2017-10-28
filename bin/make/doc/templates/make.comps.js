/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-28 14:50:49 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var comps = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
comps.card = function(obj) {
    console.group("comps.card:", obj);

    let img     = obj.find("card-img").attr("src");
    let iheight = obj.find("card-img").attr("height") || "100%"
    let title   = obj.find("card-title").html();
    let body   = obj.find("card-body").html();

    let html = `
	<div class="card">
	  <img class="card-img-top" src="CARD_IMG" style="height:${iheight}">
	  <div class="card-block">
	    <h4 class="card-title">CARD_TITLE</h4>
	    <p class="card-body">CARD_BODY</p>
	  </div>
	</div>`
    
    html = html.replace("CARD_IMG", img);
    html = html.replace("CARD_TITLE", title);
    html = html.replace("CARD_BODY", body);

    obj.html(html);

    console.groupEnd();
};
