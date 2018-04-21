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

set lang [expr {([info exist lang] == "0") ? "en" : "$lang"}]
set ajax [expr {([info exist ajax] == "0") ? "0"  : "$ajax"}]

#PREVENTITIVE ! SOMETIMES IT DUPLICATIONS LIKE "1 1" INSTEAD OF JUST 1
if {$ajax != 0} {set ajax 1}

#WILL BE OVERWRITTEN BY TraceOn/TraceOff
proc Trace {args} {}

set ::tk(env)   $::ENV
set ::tk(clock) [clock seconds]

# LET ME KNOW IF WE ARE LOCAL
if {$::env(REMOTE_ADDR) == "127.0.0.1"} {
    set ::tk(local) 1
} else {
    set ::tk(local) 0
}

##############################################
##### 
##############################################
proc tk::import {} {
    Trace

    if {[info exist ::env(HTTP_COOKIE)] == 1} {
	# GET ALL COOKIES AND SET THEM GLOBALLY
	foreach i [split [unquote_input $::env(HTTP_COOKIE)] ";"] {
	    set x [split "$i" "="]
	    set ::[string trim [lindex $x 0]] "[lindex $x 1]"
	}
    }
}

##############################################
##### 
##############################################
proc tk::start {} {
    Trace

    ##########################################
    ##### 
    ##########################################
    cgi_eval {
	http_head {
	    content_type "text/html"
	    
	    foreach i [tk::site::cookies] {
		if {0 == [catch {cgi_import $i}]} {
		    cgi_export_cookie $i
		} else {
		    catch {
			cgi_import_cookie $i;set ::$i [set $i]
		    }
		}
	    }
	}

	cgi_html lang="$::lang" {
	    if {$::ajax == 0} {
		cgi_head {
		    put "\n\
                         <!----------------------------------------------------------------------------------->\n\
			 <!--                           HELLO ROBOT !!!                                     -->\n\
			 <!--                                                                               -->\n\
                         <!-- THIS CODE IS AUTOMATICALLY GENERATED FROM MELIFY'S 4GL INTERNET TOOLKIT (MTK) -->\n\
			 <!--                                                                               -->\n\
                         <!--                    WWW.Melify.Com | Info@Melify.com                           -->\n\
			 <!--                                                                               -->\n\
			 <!--                    YOU MUST BE A ROBOT TO BE LOOKING AT THIS                  -->\n\
			 <!--                                                                               -->\n\
                         <!----------------------------------------------------------------------------------->\n"
		    
		    tk::site::head
		}
	    }
	    
	    cgi_body id="wc" ng-app=[expr {([info exist ::ngapp] == "0") ? "melified" : "$::ngapp"}] ng-controller="MelifiedCtrl" {
		put "<!-- MELIFIED -->"

		if {[info exist ::void] == 0} {
		    put {
			<!--[if IE]>
			<script>document.location.href="/tk/noie.html"</script>
			<![endif]-->
		    }
		}

		#put "<script>ma.event({type:'SESSION', custom:'new page request'})</script>"
		tk::watch:var -variable dom

		# IMPORT ALL COOKIES
		tk::import

		tk::session::restore
		
		if {$::tk(local) == 1 && [info exist ::void] == 0} {
		    # LOWER RIGHT CORNER INFO WHEN LOCAL
		    set style [style position fixed right 0 bottom 0 color red font-size 12px background yellow padding 2px z-index 9999999]

		    division $style {
			put "[img /tk/img/common/melify.ico]&nbsp;[set ::${::APP}]"
		    }

		    division [style position fixed top 0 left 0px z-index 999999] {
		    }
		} else {
		    # BYPASS tk::bugger IN PRODUCTION
		    uplevel #0 {
			proc tk::bugger {args} {}
		    }
		}

		# NOW PROCESS THE REQUESTED PAGE
		tk::site::init

		tk::session::save

		put "<!-- MELIFIED -->"
	    }
	}
    }
}

######################################################
#### 
######################################################
m::proc -public tk::init {
    {-admin     "MelifyIT@gmail.com"}
    {-trace     ""}
    {-sqlitedb  ""}
} {
    DOCUMENTATION GOES HERE...
} {
    uplevel {
	if {[info exist TKSERVER] == 0} {
	    #IF TKSERVER IS NOT DEFINED IN MAIN, USE LOCAL SETTINS
	    set TKSERVER "http://$::env(SERVER_ADDR):$::env(SERVER_PORT)"
	}

	set tkTRACE off

	lappend ::auto_path \
	    $TKSERVER/tk/src/cgi\
	    $TKSERVER/tk/src/utl\
	    $TKSERVER/tk/src/db\
	    $TKSERVER/tk/src/eng
	
	cgi_input
	
	foreach i [import_list] {
	    import $i
	}
    }

    #CHECK TRACING
    if {$trace == ""} {
	set ::tkTRACE off
	
	tk::TraceOff
    } else {
	tk::TraceOn $trace
    }
    
    if {$sqlitedb != ""} {
	tk::use:db $sqlitedb
    }

    #SETUP ADMIN'S EMAIL
    admin_mail_addr $admin

    tk::start
}

##############################################
##### 
##############################################
proc platform {} {
    global tcl_platform
    set plat [lindex $tcl_platform(os) 0]
    set mach $tcl_platform(machine)
    switch -glob -- $mach {
	sun4* { set mach sparc }
	intel -
	i*86* { set mach x86 }
	"Power Macintosh" { set mach ppc }
    }
    switch -- $plat {
	AIX   { set mach ppc }
	HP-UX { set mach hppa }
    }

    return "$plat-$mach"
}

##############################################
##### 
##############################################
proc tk::use:db {file} {
    switch [platform] {
	"Darwin-x86_64" {
	    #MAC OSX
	    source /Melify/mtk/$::ENV/tk/kits/sqlite-3_2_7.kit
	}
	"Darwin" {
	    #MAC OSX
	    load /Melify/mtk/$::ENV/tk/kits/tclsqlite.mac.dylib
	}
	"Linux" - "Linux-x86" - "Linux-x86_64" {
	    #UBUNTU
	    #load /usr/lib/tcltk/sqlite3/libtclsqlite3.so
	    load /usr/lib/tcltk/sqlite3/libtclsqlite3.so
	}
	default {
	    #WINDOWS
	    load /Melify/mtk/$::ENV/tk/kits/tclsqlite3.dll
	}
    }
    
    package require sqlite3
    
    tk::db::sqlite::select -path $file
}

