///////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
	jQuery("#id6").change(function() {
		var upage = $("#id5").val();
		var urole = $("#id6").val();
		
		jQuery('#prototype-content').load("/bin/display?ajax=1&page=tk::prototype::components::show&urole=" + urole + "&upage=" + upage);
	    });

	jQuery("#id5").change(function() {
		var upage = $("#id5").val();
		var urole = $('form input[type=radio]:checked').val();

		if (urole != undefined) {
		    jQuery('#prototype-content').load("/bin/display?ajax=1&page=tk::prototype::components::show&urole=" + urole + "&upage=" + upage);
		}
	    });
    });

///////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
function doit(id) {
    val = jQuery("#tkEditableModal .modal-body").val();
    jQuery("#" + id).html(val);

    return val;
}

///////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
function editableSave() {
    eid = jQuery("#tkEditableModal .modal-body").attr("eid");
    
    val = doit(eid);
    
    jQuery("#tk-editable-dummy").load("/bin/display?ajax=1&callback=tk::editable::save&eid=" + eid + "&val=" + escape(val));
}

///////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
function removeAll() {
    eid = jQuery("#tkEditableModal .modal-body").attr("eid");
    
    url = "/bin/display?ajax=1&callback=tk::editable::removeall";
    tid = "#tk-editable-dummy";

    jQuery.get(url + "&ajax=1", function(data) {
	    jQuery(tid).html(data);
	    debug.log(url + ' get was performed on ' + tid);
	});
    
    alert("All changes are removed. Click ok to continue");

    document.location.reload();
}
