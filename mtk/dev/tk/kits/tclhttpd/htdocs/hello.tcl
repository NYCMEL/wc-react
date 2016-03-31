Direct_Url /hello	::hello::

set ENV			"dev"
set TKSERVER		"/Melify/mtk/$ENV"
set ::env(SERVER_ADDR)	$::env(REMOTE_ADDR)

lappend ::auto_path\
    $TKSERVER/tk/src/cgi\
    $TKSERVER/tk/src/db\
    $TKSERVER/tk/src/utl\
    $TKSERVER/tk/src/eng\
    \
    $TKSERVER/tk/lib/prototype\
    \
    $TKSERVER/tk/lib/common\
    $TKSERVER/tk/lib/components/tb\
    $TKSERVER/tk/lib/components/tb.4\
    $TKSERVER/tk/lib/components/jq\
    $TKSERVER/tk/lib/components/ch\
    $TKSERVER/tk/lib/components/mtk\
    $TKSERVER/tk/lib/components/pl\
    $TKSERVER/tk/lib/components/cap\
    $TKSERVER/tk/lib/components/d3\
    $TKSERVER/tk/lib/components/bc\
    $TKSERVER/tk/lib/components/jqw\
    $TKSERVER/tk/lib/modules/videos\
    $TKSERVER/tk/lib/modules/users\
    $TKSERVER/tk/lib/modules/post\
    $TKSERVER/tk/lib/modules/db/sqlite/viewer

source /Melify/mtk/dev/tk/src/cgi/cgi.tcl
# source /Melify/mtk/dev/tk/src/cgi/extras.tcl
# source /Melify/mtk/dev/tk/src/cgi/tags.tcl

#tk::include::common

namespace eval ::hello {
    # ensure ::hello namespace exists
}

proc ::hello::/world {} {
    return [cgi_buffer {
	set ::env(SERVER_ADDR)	$::env(REMOTE_ADDR)

	tk::include::common

	division class="container" {
	    division class="row" {
		division class="col-md-6" {
		    p [lorem 50]
		}
		division class="col-md-6" {
		    p [lorem 50]
		}
	    }
	}
    }]
}
