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

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function tkCleanCookies() {
    var cookies = document.cookie.split(";");
    
    for (var i=0; i < cookies.length; i++) {
	var equals = cookies[i].indexOf("=");
	var name = equals > -1 ? cookies[i].substr(0, equals) : cookies[i];
	document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}

