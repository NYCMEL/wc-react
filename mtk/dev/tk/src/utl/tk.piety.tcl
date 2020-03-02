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
    namespace eval piety {}
}

include "/GitHub/peity/jquery.peity.min.js"
include "/tk/src/utl/inc/tk.piety.css"

######################################################
##### 
######################################################
m::proc -public tk::piety::donutchart {
    -id:required
    -colors:required
    -value:required
    {-radius 60}
    {-innerradius 30}
} {
    Documentation goes here...
} {    
    Trace
    
    division class="tk-piety-donut" {
	put [subst {
	    <span id="$id-pie" class="piety-donut-chart" data-peity='{"fill":\[$colors\],"innerRadius": $innerradius,"radius": $radius}'>$value/100</span>
	}]
    }

    put "<script>jQuery('#$id-pie').peity('pie')</script>"
}

######################################################
##### 
######################################################
m::proc -public tk::piety::linechart {
    -id:required
    {-fill "#c6d9fd"}
    {-stroke "navy"}
    {-height     16}
    {-width      32}
    -values:required
} {
    Documentation goes here...
} {    
    Trace
    
    division class="tk-piety-pie" {
	put [subst {
	    <span class="piety-line-chart" data-peity='{"fill":"$fill", "stroke":"$stroke", "width":"$width", "height":"$height"}'>$values</span>
	}]
    }
    
    javascript {
	put {
	    $(".piety-line-chart").peity("line");
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::piety::barchart {
    -id:required
    {-fill "#c6d9fd"}
    {-height      16}
    {-width       32}
    -values:required
} {
    Documentation goes here...
} {    
    Trace
    
    division class="tk-piety-pie" {
	put [subst {
	    <span class="piety-bar-chart" data-peity='{"fill":\[$fill\], "width":"$width", "height":"$height"}'>$values</span>
	}]
    }
    
    javascript {
	put {
	    $(".piety-bar-chart").peity("bar");
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::piety::piechart {
    -id:required
    -colors:required
    -values:required
    {-radius 60}
} {
    Documentation goes here...
} {    
    Trace
    
    division class="tk-piety-pie" {
	put [subst {
	    <span class="piety-pie-chart" data-peity='{"fill":\[$colors\],"radius": $radius}'>$values</span>
	}]
    }

    javascript {
	put {
	    $(".piety-pie-chart").peity("pie");
	}
    }
}

