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

namespace eval  tk {
    namespace eval  dummy {}
}

######################################################
##### 
######################################################
m::proc -public tk::dummy::1 {
    {-language "latin"}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    catch {h1 $::title}

    table width=100% cellspacing=0 cellpadding=10 border=0 class="tk-normal fl" {
	table_row {
	    table_data valign=top width=65% [style padding-right 50px] {
		p class="tk-bold tk-fg-brown" [clock format [clock seconds]]
		p [lorem -language $language 100]

		foreach i {1 2 3} {
		    p class="tk-italic tk-bold tk-fg-gray3" [string toupper [lorem -language $language 10]]
		    p [lorem -language $language 100]
		}
	    }
	    table_data valign=top {
		br

		division style=background:#ebebeb\;padding:2px class="tk-rounded" {
		    put {
			<img src="http://chart.apis.google.com/chart?chxr=0,0,160&chxt=x&chbh=a&chs=440x220&cht=bhs&chco=4D89F9,C6D9FD&chds=0,160,0,160&chd=t:10,50,60,80,40,60,30|50,60,100,40,30,40,30&chtt=Number+of+Hits" width="100%" height="130" alt="Horizontal bar chart" />

		    }
		}

		br

		division style=background:#ebebeb\;padding:10px class="tk-rounded" {
		    put {
			<img src="http://chart.apis.google.com/chart?chxr=0,0,46&chxt=y&chs=300x225&cht=lc&chco=3D7930&chd=s:Xhiugtqi&chg=14.3,-1,1,1&chls=2,4,0&chm=B,C5D4B5BB,0,0,0" width="100%" height="130" alt="" />
		    }
		}

		br

		division style=background:#ebebeb\;padding:2px class="tk-rounded" {
		    put {
			<img src="http://chart.apis.google.com/chart?chxl=0:|Jan|Feb|Mar|Jun|Jul|Aug|1:|100|75|50|25|0&chxt=x,y&chs=300x150&cht=lc&chd=s:YdYdcdfedddffcbbeffgghjnoqtuuuuuuuvvurrqnlkiigffdddcd,KKLMMKKLMMKJJMMMOOPRUVYacccccccddcZZXUSSQPOMMLLKKK,UVVUVVUUUVVUSSVVVXXYadfhjlllllllmmliigdcbZZXVVUUUTU&chg=25,25&chls=0.75,-1,-1|0.75,-1,-1|3,4,1&chm=x,FF000088,2,30.3,20|b,EFEFEF66,0,1,0" width="100%" height="130" alt="" />
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::dummy::2 {
    {-language "latin"}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    catch {h1 $::title}

    table width=100% cellspacing=0 cellpadding=10 border=0 class="tk-normal fl" {
	table_row {
	    table_data valign=top width=65% {
		p class="tk-bold tk-fg-brown" [clock format [clock seconds]]
		p [lorem -language $language 100]

		foreach i {1 2 3} {
		    p class="tk-italic tk-bold tk-fg-gray3" [string toupper [lorem -language $language 10]]
		    p [lorem -language $language 100]
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::dummy::3 {
    {-language "latin"}
    {-size 3}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    catch {h1 $::title}

    if {[info exist ::size] == 1} {
	set size $::size
    }

    set x [clock format [clock seconds] -format "%T"]

    for {set i 0} {$i <= $size} {incr i} {
	division style=padding-bottom:10px class="fl" {
	    put "[string toupper [lorem -language $language 4]] - $x";br
	    put [lorem -language $language 30]
	}
    }
}
