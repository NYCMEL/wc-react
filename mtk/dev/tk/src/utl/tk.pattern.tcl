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
m::proc -public tk::pattern {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    dict set ::tk(pattern) phone	{placeholder "###-###-####"	pattern {\d{3}[\-]\d{3}[\-]\d{4}}}
    dict set ::tk(pattern) text		{placeholder ""			pattern {[a-zA-Z ]+}}
    dict set ::tk(pattern) alnum	{placeholder ""			pattern {[a-zA-Z][a-zA-Z0-9\s]*}}
    dict set ::tk(pattern) email	{placeholder ""			pattern {[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}}
    dict set ::tk(pattern) city		{placeholder ""			pattern {[A-Za-z ]+}}
    dict set ::tk(pattern) state	{placeholder "##"		pattern {[A-Za-z]{2}}}
    dict set ::tk(pattern) zipcode	{placeholder "#####-####"	pattern {\d{5,5}(-\d{4,4})?}}
    dict set ::tk(pattern) ssn		{placeholder "###-##-####"	pattern {^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}}
    dict set ::tk(pattern) amount	{placeholder ""			pattern {^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}}
    dict set ::tk(pattern) number	{placeholder ""			pattern {\d*}}
    dict set ::tk(pattern) date		{placeholder "mm/dd/yyyy"	pattern {\d{1,2}/\d{1,2}/\d{4}}}
}
