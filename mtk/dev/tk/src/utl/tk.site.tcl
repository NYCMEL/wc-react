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
    namespace eval site {}
}

if {[info exist page] == 0} {set page "home"}

##################################################
##### 
##################################################
m::proc -private tk::site::cookies {
} {
    Documentaion goes here
} {
    Trace

    #INITIALIZE ALL COOKIES
    foreach i "$::APP [Site::cookies]" {
	set ::$i {}
    }
    
    return "$::APP [Site::cookies]"
}

######################################################
##### 
######################################################
m::proc -private tk::site::head {
} {
    This is your http-head portion of the page. You can import Javascript & CSS 
    files here as well as setting page "body" characteristics.
} {
    Trace
    
    # LOAD SITE SPECIFIC HEADERS
    if {[auto_load Site::head] != 0} {
	Site::head
    }

    # LOAD APPLICATION SPECIFIC HEADERS
    if {[auto_load ${::page}::head] != 0} {
	${::page}::head
    }

    # LOAD SITE SPECIFIC HEADERS
    if {$::env(SERVER_NAME) == "localhost"} {
	set tmp ":D"
    } else {
	set tmp ""
    }

    if {[auto_load ${::page}::title] != 0} {
	cgi_title "[Site::title]$tmp [${::page}::title]"
    } elseif {[auto_load Site::title] != 0} {
	cgi_title "[Site::title]"
    }
}

######################################################
##### 
######################################################
m::proc -private tk::site::init {
} {
    Initialize the site and produce header and guts for the entire application
} {
    Trace

    #NORMAL OPERATION. INITIALIZE THE SITE, PAGE DEFAULT, ADMIN ADDRESS ETC
    Site::init

    tk::site::body
}

######################################################
##### 
######################################################
m::proc -private tk::site::body {
} {
    Initialize the site and produce header and guts for the entire application
} {
    Trace

    #LOAD BODY OF SITE
    if {[catch {
	Site::body
    } e] != 0} {
	division class="alert alert-danger" [style margin 20px] {
	    set date [clock format [clock seconds] -format "%D %T"]
	    h3 "<i class='fa fa-ban'></i> MTK-ERROR <small style=font-size:12px>$date</small>"
	    p "URL: $::env(REQUEST_URI)"
	    hr
	    p "<small>$e</small>"
	    p [url "error info..." "#" onclick="jQuery('#error-info').slideToggle()"]

	    division id="error-info" [style display none] {
		h4 "<pre style=font-size:10px>$::errorInfo</pre>"
	    }
	}
    }

    tk::bugger {
	catch {parray ::_jscss_}
    }
}

######################################################
##### PAGES ARE DISPLAYED IN THE "guts"
######################################################
m::proc -private tk::site::setup {
    -admin:required
    {-page home}
    {-head    ""}
    {-loading  1}
} {
    This is where your application sits. Feel free to modify it to suite your needs.
} {
    Trace
    
    if {[info exist ::page] == 0} {
	set ::page $page
    }
    
    #SET ADMINISTRATOR'S HANDLE
    admin_mail_addr $admin
}
