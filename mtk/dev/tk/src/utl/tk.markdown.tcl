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

    if {[info exist ::file] == 0} {
	h1 "file is required in url"
	exit
    }

    include "https://cdn.jsdelivr.net/npm/@webcomponents/webcomponentsjs@2/webcomponents-loader.js"
    include "https://cdn.jsdelivr.net/gh/zerodevx/zero-md@1/build/zero-md.min.js"
    include "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.css"

    division style="padding:30px" {
	put "<zero-md src='$::file'></zero-md>"
    }
}

