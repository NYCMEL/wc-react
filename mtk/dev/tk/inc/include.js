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

//////////////////////////////////////////////////////////////
/////
//////////////////////////////////////////////////////////////
function loadjscssfile(filename, filetype){
    if (filetype=="js"){
	fileref = document.createElement('script');
	fileref.setAttribute("type","text/javascript");
	fileref.setAttribute("src", filename);
    } else if (filetype=="css"){
	fileref = document.createElement("link");
	fileref.setAttribute("rel", "stylesheet");
	fileref.setAttribute("type", "text/css");
	fileref.setAttribute("href", filename);
    }

    document.getElementsByTagName("head")[0].appendChild(fileref);
}

//////////////////////////////////////////////////////////////
/////
//////////////////////////////////////////////////////////////
function tkinclude(func, filename, filetype) {
    if (jQuery("head").hasClass(func) == 0) {
	console.log("tkinclude: " + filename);
	
	loadjscssfile(filename, filetype);
	
	jQuery("head").addClass(func);

	return true;
    }

    return false;
}

