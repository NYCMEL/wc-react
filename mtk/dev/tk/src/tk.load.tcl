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
    namespace eval load {}
}

include "/tk/inc/tk.load.js"

######################################################
##### 
######################################################
m::proc -public tk::load::init {
} {
    Documentation goes here...
} {    
    Trace
    
    set str "$::component "
    foreach i [array names ::p] {
	append str "-$i [list $::p($i)] "
    }

    eval $str
}

######################################################
##### 
######################################################
m::proc -public tk::load::init {
} {
    Documentation goes here...
} {    
    Trace
    
    p $::component

    eval $::component
}

######################################################
##### TEST TEST TEST TEST TEST 
######################################################
m::proc -public tk::load::test {
} {
    Documentation goes here...
} {    
    Trace

    set style [style margin 20px padding 20px]

    division id="rest-container-1" $style {
	set url [URL page tk::load component [list jq::component::stocks::init\
						  -id stocks\
						  -symbols [list c,hov,tol,aapl,goog,yhoo]]]
    }

    division class="alert alert-info" $style {
	put $url
    }

    javascript {
	put [subst {
	    jQuery(document).ready(function() {
		tk.load("#rest-container-1","$url");
	    });
	}]
    }

    division id="rest-container-2" $style {
	set url [URL page tk::load component [list\
						  mtk::component::table::db::init\
						  -id table-db-test\
						  -query [list select id,fname,lname,email,paswd,active,company,updated,role from users]\
						  -custom mtk::component::table::db::custom]]
    }

    division class="alert alert-info" $style {
	put $url
    }

    javascript {
	put [subst {
	    jQuery(document).ready(function() {
		tk.load("#rest-container-2","$url");
	    });
	}]
    }
}

######################################################
##### TEST::JSON TEST::JSON TEST::JSON 
######################################################
m::proc -public tk::load::test:json {
} {
    Documentation goes here...
} {    
    Trace

    division id="json-container" [style margin 50px padding 50px] {
	h1 waiting...
    }

    set json [tk::nonewline {
	"component" : "jq::component::stocks::init",
	"parent" : "json-container",
	"parameters"  :  {
	    "id" : "stocks",
	    "symbols" : "c,hov,tol,aapl,goog,yhoo"
	}
    }]

    javascript {
	put [subst {
	    tkLoad.init({json:'{$json}'});
	}]
    }
}

