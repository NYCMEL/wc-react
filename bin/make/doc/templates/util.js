/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-28 10:44:30 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var wc = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
wc.process = function(options) {
    console.group("wc.process");

    // PROCESS ALL UNPROCESSED TAGS
    let tags = $(':tagNameContains(wc-):not(.wc-processed)')
    console.log(">>>>>>>", tags.length);
    
    tags.each(function() {
	$(this).addClass("wc-processed");
    });

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
function icontains(elem, tagName) {
    return elem.nodeName.toLowerCase().indexOf((tagName || "").toLowerCase() ) > -1;
}

$.expr.pseudos.tagNameContains = $.expr.createPseudo ? $.expr.createPseudo(function( tagName ) {
    return function(elem) {
        return icontains(elem, tagName);
    };
}) : function(elem, i, match) {
    return icontains(elem, match[3]);
};
