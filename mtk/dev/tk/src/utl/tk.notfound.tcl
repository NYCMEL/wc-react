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

namespace eval tk {
    namespace eval notfound {}
}

######################################################
##### 
######################################################
m::proc -public tk::notfound {
} {
    Documentation goes here...
} {    
    Trace

    division [style padding 100px text-align center] {
	h4 [clock format [clock seconds]]
	put [img /tk/img/common/PageNotFound.png]
	h5 [url "<i class=icon-envelope-alt></i> site admininstrator" mailto:mel.heravi@gmail.com]
    }

    javascript {
	put {
	    setTimeout(function(){
		parent.history.back();
	    }, 2000);
	}
    }
}
