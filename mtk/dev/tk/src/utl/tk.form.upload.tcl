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
    namespace eval form {
	namespace eval upload {}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::init {
    -name:required
    {-id         {}}
    {-callback   {}}
    -guts:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    set id [expr {($id == "") ? "$name" : "$id"}]
    
    cgi_form "[URL]" enctype=multipart/form-data method="POST" name="$name" id=$id autocomplete="off" {
	export ajax=1
	export callback=$callback
	
	uplevel $guts
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::cb {
} {
    Documentation goes here...
} {    
    Trace

    set cgi  [lindex $::file 0]
    set name [file tail [lindex $::file 1]]

    regsub -all {\[} $name "" name
    regsub -all {\]} $name "" name

    division class="alert alert-info" {
	h1 ==$::file==
	h1 "$name <small>- [commify [file size $cgi]](b)</small>"
    }
}

######################################################
##### 
######################################################
m::proc -public tk::form::upload::test {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    
    tk::form::upload::init -name "test" -callback tk::form::upload::cb -guts {
	if {0} {
	    file_button file class="btn btn-default custom-file-upload"
	    br
	    submit_button action=[list Upload this file] class="btn btn-default"
	} else {
	    put {
		<label for="file-upload" class="custom-file-upload">
		<i class="fa fa-cloud-upload"></i> Upload File
		</label>

		<input id="file-upload" type="file" />
	    }
	}
    }

    javascript {
	put {
	    $(document).ready(function() {
		$('input[type=file]').each(function(){
		    $(this).addClass('file').addClass('hidden');
		    $(this).parent().append($('<div class="fakefile" />').append
					    ($('<input type="text" class="form-control"/>')
					     .attr('id',$(this).attr('id')+'__fake')).append($('<img src="pix/button_select.gif" alt="" />')));
		    
		    $(this).bind('change', function() {
			$('#'+$(this).attr('id')+'__fake').val($(this).val());;
		    });
		    $(this).bind('mouseout', function() {
			$('#'+$(this).attr('id')+'__fake').val($(this).val());;
		    });
		});
	    });
	}
    }
}

