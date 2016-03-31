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

namespace eval template {
    namespace eval 1 {}
}

######################################################
##### 
######################################################
m::proc -public template::1::header {
} {
    Documentation goes here...
} {
    Trace
    
    division id="template-header" {
	h1 "$::company header..."
    }
}

######################################################
##### 
######################################################
m::proc -public template::1::footer {
} {
    Documentation goes here...
} {
    Trace
    
    division id="template-footer" {
	put "$::company footer..."
    }
}

######################################################
##### 
######################################################
m::proc -public template::0 {
} {
    Documentation goes here...
} {
    Trace

    tk::comment "template::0" {
	uplevel guts
    }
}

######################################################
##### 
######################################################
m::proc -public template::1 {
} {
    Documentation goes here...
} {
    Trace
    
    tk::comment "template::1" {
	division class="container$::fluid template" {
	    division class="row$::fluid" {
		division class="col-md-12 template-header" {
		    template::1::header
		}
		division class="col-md-12 template-guts" {
		    uplevel guts
		}
		division class="col-md-12 template-footer" {
		    template::1::footer
		}
	    }
	}
    }
}
