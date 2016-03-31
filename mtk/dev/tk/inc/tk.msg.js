////HEADS///////////////////////////////////////////////////////////////////
//
//  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
//  
//  This program is free software: you can redistribute it and//or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see http://www.gnu.org/licenses.
//
////HEADE/////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
// EXAMPLE
//////////////////////////////////////////////////////////////////////////////
//   BLOCK:
//       tkMsg.modal({parent: '#pid', mid: '#mid', timeout: '3000'});
//     or
//       tkMsg.modal({parent: '#pid', mid: '#mid', timeout: '3000', position:{left:"", right:"50px", top:"50px"}});
//
//     *** REMOVE timeout FOR MANUAL UNBLOCKING
//
//////////// TCL CODE ///////////////////////
// include "/tk/inc/tk.msg.js"
//
// set style1 [style height 600px background yellow border "1px red solid"]
// set style2 [style width 500px height 250px background #f7f7f7 border "1px blue solid" display none overflow auto margin "0 auto" padding 20px]
//
// division id="pid" $style1 {
// 	division id="mid" $style2 class="clearfix" {
// 	    tk::dummy::3
// 	}
// }
//
// put "<script>tkMsg.modal({pid:"#pid", mid: "#mid"})</script>"
//
var tkMsg = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2013-09-19 09:33:10 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    modal: function(options) {
	console.log("tkMsg.init");

	if (typeof options.position != "undefined") {
	    tkMsg._position(options);
	    return
	}

	mid     = options.mid;
	pid     = options.pid      || "body";
	css     = options.css      || {border:0, background:'transparent', width:'100%'};
	overlay = options.overlay  || {backgroundColor:'#000', opacity:0.5};
	timeout = options.timeout  || null;

	console.log("pid:" + pid + " mid:" + mid + " css:" + css + " overlay:" + overlay + " timeout:" + timeout);

	jQuery(pid).block({ message:jQuery(mid), css:css, overlayCSS:overlay });
	
	if (timeout) {
	    setTimeout(function(){
		jQuery(pid).unblock();
	    }, timeout);
	}
    },

    /////////////////////////////////////////////////////////////////////////////
    //// tkMsg.modalPosition();
    /////////////////////////////////////////////////////////////////////////////
    _position: function(options) {
	console.log("tkMsg.modalPosition");
	
	mid = options.mid;
	pos = options.position   || {top:'', left:'', right:''};
	bg  = options.background || '#FFF';
	to  = options.timeout    || null;
	
	console.log("pos = {" + pos.top + " | " + pos.left + " | " + pos.right + " } " + mid  + " | " + bg  + " | " + to);

	jQuery.blockUI({ 
	    message: jQuery(mid),
	    css: {top:pos.top, left:pos.left, right:pos.right, border:0, background:"transparent"},
	    overlayCSS: {backgroundColor:bg, opacity:0.3, cursor:"wait"}
	}); 
	
	if (to) {
	    setTimeout(function(){
		jQuery.unblockUI();
	    }, to);
	}
    }
};

