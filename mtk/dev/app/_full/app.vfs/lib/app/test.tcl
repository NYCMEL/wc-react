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

namespace eval test {}

######################################################
##### 
######################################################
m::proc -public test::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "test"
}

######################################################
##### 
######################################################
m::proc -public test::narative {
} {
    Documentation goes here...
} {
    Trace

    put "<b>home::narative</b> content is displayed here as a narative for this page"
}

######################################################
##### 
######################################################
m::proc -public test::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Test"
}

######################################################
##### 
######################################################
m::proc -public test::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    tk::test:procs
}

######################################################
##### 
######################################################
m::proc -public test::restfull {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    # TEST THE REST 
    javascript {
	put {
	    jQuery(document).ready(function() {
		$.get("/mtk/rest?key=TEST", function( data ) {
		    $( "body" ).append("<h3> /mtk/rest?key=TEST " + data + "</h3>");
		});

		$.get("/mtk/rest?key=QUERY&id=1000", function( data ) {
		    $( "body" ).append("<h3> /mtk/rest?key=QUERY&id=1000 " + data + "</h3>");
		});
	    });
	}
    }
}

######################################################
##### 
######################################################
m::proc -public test::scope {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]
    
    ang::scope -name "hello" -value "world"
    ang::scope -name "welcome" -value "home"

    h1 "==[subst -nocommands {{{state['hello']|uppercase}}}]=="
    h1 "==[subst -nocommands {{{state['welcome']|uppercase}}}]=="

    # GET VALUE OF A SCOPE VARIABLE
    set x [subst -nocommands {{{state["hello"]}}}]
    h1 >>>>>>>>$x<<<<<<<<<<
}
