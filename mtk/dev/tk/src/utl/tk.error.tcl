###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

namespace eval tk {}

put {
    <style>
    body {
	# background: url(/tk/img/common/big-bug-2.png) no-repeat;
	# background-size:600px 600px;
	# background-position:50px 100px;
	# opacity:0.7;
	display:block;
    }

    .tk-error {
	position:relative;
	z-index:999999;
	background: red;
	margin:30px;
	border: 1px yellow dashed;
	text-align:center;
	padding:20px;
	font-size:18px;
    }

    .fa-bug {
	padding-right:20px;
	color:yellow;
    }

    .tk-error .tk-date {
	font-size:12px;
	color:gold;
    }

    .tk-error .tk-error-msg {
	font-size:14px;
	color:#FFF;
    }

    pre {
	border-radius:0;
	margin: 30px;
    }

    .cgi-debug {
	display: none;
    }

    </style>
}

######################################################
##### 
######################################################
proc tk::error {e} {
    set d [clock format [clock seconds]]

    set tmp [buffer {
	division class="tk-error clearfix" {
	    division [style float left text-align center font-size 50px] {
		put "<i class='fa fa-bug'></i>"
	    }
	    division [style float left text-align left] {
		p class="tk-date" $d
		p class="tk-error-msg" $e
	    }
	}
    }]

    regsub -all {\"} $tmp {\'} tmp
    
    javascript {
	put [subst {
	    jQuery("body").prepend("$tmp");
	}]
    }
    
    h3 align=center [url "Show me the error" "#" onclick="jQuery('.cgi-debug').slideToggle()\;jQuery(this).hide()"]
    
    p "<PRE class=cgi-debug>$::errorInfo</PRE>"

    exit
}
