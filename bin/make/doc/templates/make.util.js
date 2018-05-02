/////////////////////////////////////////////////////////////////////////
//// $(':tagNameContains(wc-)')...
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
