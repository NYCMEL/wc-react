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

##############################################
##### 
##############################################
m::proc -public tk::video {
    {-id "tk-video"}
    {-width  "100%"}
    {-height "100%"}
    {-poster "/tk/img/common/4gl.png"}
    {-file "/videos/Demo"}
    {-autoplay "autoplay"}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    # IF IT IS AJAXED
    if {[info exist ::file]   == 1} {set file     $::file}
    if {[info exist ::id]     == 1} {set id         $::id}
    if {[info exist ::width]  == 1} {set width   $::width}
    if {[info exist ::height] == 1} {set height  $::width}
    if {[info exist ::poster] == 1} {set poster $::poster}

    division id="$id" {
	put [subst {
	    <video preload="no" $autoplay width="$width" height="$height" controls poster="$poster" [style background #000 border-radius 5px]>
	    <source src="$file.mp4"  type="video/mp4">
	    <source src="$file.ogg"  type="video/ogg">
	    <source src="$file.webm" type="video/webm">
	    YOUR BROWSER DOES NOT SUPPORT THE VIDEO TAG
	    </video>
	}]
    }
}

##############################################
##### 
##############################################
m::proc -public tk::video:test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    tk::video -id "my-video" -width 320 -height 240 -video "/videos/All-Hands-II" -poster "/Melify/mtk/dev/tk/img/common/testing.gif"
}
