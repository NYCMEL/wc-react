//////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
function deleteRole(role) {
    url = "/bin/display?callback=tk::prototype::roles::delete&drole=" + escape(role);
    
    jQuery('#dummy').load(url);
}

//////////////////////////////////////////////////////////////////////////
//// 
///////////////////////////////////////////////////////////////////////////
function reallyDeleteRole(role) {
    url = "/bin/display?callback=tk::prototype::roles::delete:confirmed&drole=" + escape(role);

    jQuery('#dummy').load(url);
}