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

######################################################
##### 
######################################################
m::proc -public tk::markdown {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    if {[info exist ::file] == 0} {
	h1 "file is required in url"
	exit
    }

    include "/GitHub/zero-md/highlight-themes/default.css"
    include "/GitHub/zero-md/markdown-themes/default.css"
    include "/GitHub/core/lib/webcomponents-lite.js"

    put {
	<link rel="import" href="/GitHub/zero-md/build/zero-md.html">
	
	<zero-md file="$::file">
	    <div class="md-html" style=padding:50px;>
		<!-- PLACEHOLDER FOR CONTENT -->
	    </div>
	</zero-md>
    }
}

