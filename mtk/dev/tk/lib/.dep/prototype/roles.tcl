###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval tk {
    namespace eval prototype {
	namespace eval roles {}
    }
}

include "/tk/lib/prototype/inc/prototype.js"

division id="dummy" {
    # PLACEHOLDER FOR AJAX STUFF
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "1000"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a roles page"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "roles"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::template {
} {
    Documentation goes here...
} {
    Trace

    return "Template::0"
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [[namespace current]::id]
    
    [template]
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::guts {
} {
    Documentation goes here...
} {    
    Trace

    if {[info exist ::app] == 0} {
	tk::prototype::roles::guts:standalone
    } else {
	tk::prototype::roles::guts:app
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::guts:standalone {
} {
    Documentation goes here...
} {    
    Trace

    division class="container-fluid" [style padding-top 20px] {
	division class="row-fluid" {
	    division class="span12" {
		put [url "New Role" # class="btn btn-success span2" onclick="jQuery('#create-role').slideToggle('slow')"]
		#put [url "New Role" # class="btn btn-success span2 disabled"]
	    }
	}
	division class="row-fluid" [style display none padding-top 20px] id="create-role" {
	    division class="span12" {
		tb::fform -title "Role Creation" -name "test" -callback "tk::prototype::roles::new" -class "form-horizontal well" -guts {
		    tb::ftext -id "name" -name "v(name)" -label "Role Name:" -placeholder "enter a name for this role" -value "" -required "required"
		    tb::ftextarea -id "description" -name "v(description)" -label "Role Description:" -value "" -class "span8" style=height:100px

		    tb::fbutton -name "v(button)" -id "id4" -text "Create the Role" -type "btn-info"
		}
	    }
	}
    }    

    set roles [tk::prototype::util::get:roles]

    division [style padding 10px] {
	foreach i $roles {
	    division [style float left padding 5px width 300px] {
		division class="clearfix" [style background #d9edf7 min-height 200px padding 5px border-radius 5px] {
		    division [style border-bottom "1px #CCC solid" padding-bottom 5px] class="clearfix" {
			division [style float left] {
			    put [url "<i class=icon-edit></i> Edit" #]
			}
			division [style float right] {
			    put [url "x" "#" onclick="deleteRole('[file tail $i]')" class="close"]
			}
		    }

		    division {
			h2 [file tail $i]

			p [file:read $i]
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::guts:app {
} {
    Documentation goes here...
} {    
    Trace

    br

    division class="container-fluid" {
	division class="row-fluid" {
	    division class="span6" {
		division class="container-fluid" {
		    division class="row-fluid" {
			division class="span16" {
			    h2 class="border-bottom" "<i class='icon-off'></i> Pick a Role"
			    
			    set roles [tk::prototype::util::get:roles]
			    
			    if {$roles == ""} {
				hr
				tk::prototype::util::error "No roles found !"
				br
				put [url "Click here to Create One" [URL page tk::prototype pid roles] class="btn"]
			    }

			    foreach i $roles {
				set t [file tail $i]

				division class="row-fluid" onclick="javascript:saveRole('$t')" [style margin 2px] {
				    division id="prototype-roles" class="btn" [style width 100%] {
					set components "$::starkit::topdir/data/prototype/pages/home/$t"

					if {[file exist $components] == 0} {
					    array set x [file:read "$::starkit::topdir/data/prototype/pages/home/default"]

					    # CHANGE THE NAME
					    set x(name) "$t"

					    # WRITE TO NEW FILE
					    file:write $components [array get x]
					}

					p [file:read $i]
				    }
				}
			    }
			}
		    }

		    # INCLUDE APPLICATION EXTRAS IF ANY
		    if {[auto_load ${::APP}::extras] == 1} {
			${::APP}::extras
		    }
		}
	    }
	    division class="span10" {
		h2 class="border-bottom" "<i class='icon-info-sign'></i> Instructions"

		tk::dummy::3 -size 2

		division class="alert alert-danger" [style text-align center margin-top 20px padding 20px] {
		    h4 "If you like to make changes to this prototype, click the button below"
		    br
		    put [url "<i class='icon-cog'></i> I want to make changes" "[URL page tk::prototype]" class="btn btn-danger btn-large" target="changes"]
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::new {
} {
    Documentation goes here...
} {    
    Trace

    #MAKE SURE WE HAVE A DIRECTORY
    file mkdir $::starkit::topdir/data/prototype/roles

    if {[catch {
	set f [open $::starkit::topdir/data/prototype/roles/$::v(name) w]
	regsub -all "\n" $::v(description) "<BR>" tmp

	puts $f "<b>$::v(name)</b><BR>"
	puts $f $tmp
    } e] != 0} {
	h3 [style width 100% padding 10px] class="alert alert-error" "<i class='icon-minus-sign icon-large'></i> Houston, We have a Problem !"
	p $e
	return
    }

    # division class="alert alert-success" {
    # 	h1 "$::v(name) created successfully"
    # }
    
    javascript {
	put "location.reload()"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::delete {
} {
    Documentation goes here...
} {    
    Trace

    division class="alert alert-danger" [style padding 30px] id="confirm-delete" {
	h3 "Really delete role: $::drole ?"
	hr

	set onclick "reallyDeleteRole('$::drole')"
	put [url "Sure, Delete" "#" class="btn btn-danger" onclick="$onclick"]
	space 20 0
	put [url "Cancel" "#" class="btn btn-success" onclick="jQuery('#confirm-delete').slideToggle('slow')"]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prototype::roles::delete:confirmed {
} {
    Documentation goes here...
} {    
    Trace

    file delete -force $::starkit::topdir/data/prototype/roles/$::drole
    
    javascript {
	put "location.reload()"
    }
}
