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

lappend auto_path "$TKSERVER/tk/lib/modules/email"

##############################################
##### 
##############################################
m::proc -public tk::email {
    {-cc	""}
    {-bcc	""}
    {-paswd "5567"}
    -from:required
    -to:required
    -subject:required
    -message:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    array set ::v [subst {
	bcc		"$bcc" 
	cc		"$cc"
	from		"$from"
	message		"$message" 
	subject		"$subject"
	to		"$to"
	paswd		"$paswd"
    }]

    module::email::cb
}

##############################################
##### 
##############################################
m::proc -public tk::email:test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    array set ::v [subst {
	bcc		""
	cc		""
	from		"MelifyIT@gmail.com"
	subject		"TESTING THE EMAIL"
	message		"[lorem 100]"
	to		"mel.heravi@gmail.com" 
	paswd		"5567"
    }]

    module::email::cb
}
