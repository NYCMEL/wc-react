#####################################################################################
#                      Copyright (c) 1997-2002
#                           RedOlive Inc.
#                      All Rights Reserved
#
#               PROPRIETARY - RedOlive Inc. AND AUTHORIZED CLIENTS ONLY
#       This document contains proprietary information that shall be
#       distributed or routed only within RedOlive Inc. and its authorized clients,
#                except with written permission of RedOlive Inc.
#
#     P.O.Box 6210 New York, NY 10150   Phone:(877) 882-0266
######################################################################################
# $Id: 9b48c1d790192d520b61e521d7e78e44d456a642 $
######################################################################################
package provide RedOlive 1.0

######################################################################################
# $Id: 9b48c1d790192d520b61e521d7e78e44d456a642 $	
######################################################################################
namespace eval tk {
    if {[catch {variable prompt [tk appname]} e] != 0} {
	set prompt [uplevel "#1" info script]
    }

    ###############################################
    ####
    ###############################################
    proc interact {{appname {}}} {
	variable prompt

	if {$appname != {}} {
	    set prompt $appname
	}

	#set prompt "Multiplexer"

	puts -nonewline "$prompt: "

	fileevent stdin readable "tk::interact:process"
    }

    ###############################################
    ####
    ###############################################
    proc interact:process {} {
	variable prompt
	
	gets stdin line
	
	if {[catch {set r [uplevel #0 $line]} e] != 0} {
	    puts "***ERROR:$e"
	} else {
	    if {$r != {}} {
		puts $r
	    }
	}
	
	puts -nonewline "$prompt: "
	flush stdout
    }
}
