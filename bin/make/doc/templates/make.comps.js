/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-28 11:50:14 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var comps = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
comps.card = function(obj) {
    console.group("comps.card:", obj);

    let html = `
	<div class="card" style="width: 20rem;">
	  <img class="card-img-top" src="CARD_IMG">
	  <div class="card-block">
	    <h4 class="card-title">Card Title</h4>
	    <p class="card-description">Card Description</p>
	  </div>
	</div>`
    
    let img   = obj.find("card-img").attr("src");
    let title = obj.find("card-title").html();
    let descr = obj.find("card-description").html();

    html = html.replace("CARD_IMG", img);
    html = html.replace("CARD_TITLE", title);
    html = html.replace("CARD_DESCRIPTION", descr);

    $("body").append(html);

    console.log(">>>>>>>>IMG=", img);

    console.groupEnd();
};
