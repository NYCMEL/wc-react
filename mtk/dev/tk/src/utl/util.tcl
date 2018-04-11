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
    variable _cnt [clock seconds]

    namespace eval accesslog {}
}

######################################################
##### 
######################################################
proc lstring {list} {
    set string ""
    foreach l $list {
	append string "$l "
    }
    # remove first space if possible
    # regexp "^ ?(.*)" $string dummy string
    return $string
}

######################################################
##### 
######################################################
proc ldelete {list elt} {
    set index [lsearch $list $elt];
    if {$index >= 0} {
	return [lreplace $list $index $index];
    }
    return $list;
}

######################################################
##### 
######################################################
proc lreverse {x} {
    set i [expr [llength $x] - 1]
    
    foreach j $x {
	lset x $i $j
	incr i -1
    }

    return $x
}

######################################################
##### 
######################################################
proc space {w h} {
    put "<img src='/tk/img/common/1x1.gif' width='$w' height='$h' alt=''>"
}

######################################################
##### 
######################################################
proc html:load {fn} {
    set f [open $fn r]
    set r [read $f]
    close $f

    put $r
}

###############################################
##### 
###############################################
proc commify {n {sign ,}} {
    # structure a decimal like 123,456.78 123'456.78, or 123.456,78
    if {$sign=="."} {regsub {[.]} $n "," n}
    set trg "\\1$sign\\2"
    while {[regsub {^ *([-+]?[0-9]+)([0-9][0-9][0-9])} $n $trg n]} {}
    return $n
}

###############################################
##### 
###############################################
proc file:read {file} {
    set fp [open $file r]
    set txt [read $fp]
    close $fp
    return $txt
}

###############################################
##### 
###############################################
proc file:write {file txt} {
    set fp [open $file w]
    puts $fp $txt
    close $fp
}

######################################################
##### 
######################################################
proc is:int {value} {
    if [catch {expr {1 >> $value}}] {
	return 0
    } else {
	return 1
    }
}

######################################################
##### 
######################################################
proc is:double {value} {
    if [catch {expr $value}] {
	return 0
    } else {
	return 1
    }
}

####################################################
#### 
####################################################
proc grep {pattern args} {
    set result {}

    if {[llength $args] == 0} {
	# read from stdin
	set lnum 0
	while {[gets stdin line] >= 0} {
	    incr lnum
	    if {[regexp $pattern $line]} {
		lappend result $line
	    }
	}
    } else {
	foreach filename $args {
	    set file [open $filename r]
	    set lnum 0
	    while {[gets $file line] >= 0} {
		incr lnum
		if {[regexp $pattern $line]} {
		    lappend result $line
		}
	    }
	    close $file
	}
    }

    return $result
}

##################################################
##### 
##################################################
proc options {arr var {tag "option"}} {
    upvar 1 $arr opts
    upvar 1 $var args

    while {[llength $args] > 0} {
	set opt [lindex $args 0]
	if {$opt == "--"} {
	    set args [lrange $args 1 end]
	    break
	}
	if {![string match -* $opt]} {
	    break
	}
	if {[info exists opts($opt)]} {
	    if {[llength $args] < 2} {
		return -code error "no value provided for \"$opt\""
	    }
	    set opts($opt) [lindex $args 1]
	    set args [lrange $args 2 end]
	} else {
	    set options [lsort [array names opts -*]]
	    set usage [join $options ", "]
	    return -code error "bad $tag \"$opt\": must be one of $usage"
	}
    } 
    return $args
}

######################################################
##### 
######################################################
proc tk::development {content} {
    Trace

    if {$::ENV == "dev"} {
	uplevel $content
    }
}    

######################################################
##### 
######################################################
proc tk::production {content} {
    Trace

    if {$::ENV == "prod"} {
	uplevel $content
    }
}    

######################################################
##### 
######################################################
proc tk::save:page {url} {
    Trace

    javascript {
	put {
	    function getContent(link) {
		var contentText = $.ajax({
		    url: link,
		    async: false
		}).responseText;
		
		return contentText;
	    }
	}
    }

    #THIS PART SHOULD SEND THE CONTENT TO BACKEND FOR STORAGE
    # NOT IMPLEMENTED YET
    #
    division style=background:yellow\;padding:50px {
	javascript {
	    put "document.write(getContent('$url'))"
	}
    }
}    

######################################################
##### 
######################################################
proc tk::output {args} {
    Trace

    cgi_comment "[tk::procname] starts ..."
    
    uplevel eval $args

    cgi_comment "[tk::procname] ends"
}

######################################################
##### 
######################################################
m::proc -public tk::goback {
    {-whenClicked 0}
    {-steps      -1}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    switch $whenClicked {
	"0" {
	    put "<script type='text/javascript'>window.history.go($steps);</script>"
	}
	default {
	    return "javascript:window.history.go($steps)"
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::goto {
    -url:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    javascript {
	put "document.location.href='$url'"
    }
}

######################################################
##### 
######################################################
proc URL {args} {
    Trace

    #set rval "$::env(SERVER_NAME):$::env(SERVER_PORT)?"
    set rval "$::env(SCRIPT_NAME)?"

    foreach {i j} $args {
	append rval [cgi_set $i $j]&
    }
    
    return [string replace $rval end end]
}

######################################################
##### 
######################################################
m::proc -public tk::append {
    -to:required
    -proc:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace
    variable _cnt

    set id "${to}-[incr _cnt]"

    javascript {
	put [subst {
	    jQuery("$to").append("<div id='$id'></div>");
	    
	    jQuery("#$id").load("[URL callback $proc]");
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::fonts {
} {
    Documentation goes here...
} {    
    Trace

    set cnt 0

    if {[info exist ::str] == 0} {
	set ::str [lorem 5]
    }

    set fdir "/GitHub/fonts/ofl"

    table {
	foreach i [glob -nocomplain "[file join $fdir *]"] {
	    if {[file isdirectory $i] == 1} {
		set t [file tail [file rootname $i]]
		
		foreach j [glob -nocomplain $i/*.ttf] {
		    table_row {
			set n [file rootname [file tail $j]]

			set str [subst {
			    @font-face {
				font-family: "$n";
				src: url("$fdir/$t/[file tail $j]") format("truetype");
			    }
			}]

			put "<style>$str</style>"

			table_data {
			    put [incr cnt]
			}
			table_data {
			    put [url $t "#" onclick="jQuery('#$cnt').toggle()"]
			}
			table_data {
			    put  "<span style=font-family:'$n'\;font-size:24px>$::str</style>"
			}
		    }
		    table_row style=display:none id=$cnt {
			table_data {
			}
			table_data colspan=2 {
			    put [quote_html $str]
			}
		    }
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::prettify {
} {
    Documentation goes here...
} {
    Trace
    
    if {0} {
	put {
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/run_prettify.min.js"></script>
	}
    } else {
	include "/tk/inc/tk.prettify.css"
	include "/tk/lib/google/prettify/prettify.css"
	include "/tk/lib/google/prettify/prettify.js"
	include "/tk/inc/tk.prettify.js"
    }
}

######################################################
##### 
######################################################
proc timefmt {secs {fmt "%H:%M:%S"}} {
    Trace
    
    if { ![string is integer -strict $secs] } {
        error "first argument must be integer"
    }
    
    set d [expr {$secs/86400}] ; set D [string range "0$d" end-1 end]
    set h [expr {($secs%86400)/3600}] ; set H [string range "0$h" end-1 end]
    set m [expr {(($secs%86400)%3600)/60}] ; set M [string range "0$m" end-1 end]
    set s [expr {(($secs%86400)%3600)%60}] ; set S [string range "0$s" end-2 end]
    
    set p "%% % %s $s %S $S %m $m %M $M %h $h %H $H %d $d %D $D"
    set str [string map $p $fmt]

    return $str;
}

######################################################
##### 
######################################################
m::proc -public tk::melifyit {
} {
    Documentation goes here...
} {
    Trace
    
    eval $::code
}

######################################################
##### 
######################################################
m::proc -public TKEID {
    text
} {
    Documentation goes here...
} {
    Trace
    
    return $text
}

######################################################
##### 
######################################################
m::proc -public capitalize {
    str
} {
    Documentation goes here...
} {
    Trace

    set rval ""
    foreach i $str {
	append rval "[string totitle $i] "
    }
    set rval [string replace $rval end end]

    return $rval
}

######################################################
##### 
######################################################
m::proc -public tk::strip:amount {
    args
} {
    Documentation goes here...
} {    
    Trace

    set tmp [lindex [split [string trim [lstring $args]] .] 0]
    regsub -all {\$} $tmp "" tmp
    regsub -all ","  $tmp "" tmp

    return $tmp
}

######################################################
##### 
######################################################
proc stringify {s} {
    set s [string trim $s]

    set tmp ""
    foreach i [split $s] {
	append tmp "$i "
    }

    return $tmp
}

######################################################
##### 
######################################################
m::proc -public tk::waiting {
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    put [img /tk/img/common/loading.2.gif]
}

######################################################
#####     division id="x" [style margin 100px] {
#####	      tk::waiting
#####     }
##### 
#####     tk::replace -ele "#x" -url "[URL callback tk::dummy::3]"
######################################################
m::proc -public tk::replace {
    -ele:required
    -url:required
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    javascript {
	put [subst {
	    tk.load("$ele", "$url", true);
	}]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::placeholder {
    {-width  100%}
    {-height 100%}
    {-hidden    0}
} {
    Documentation goes here...
} {
    Trace

    put [img /tk/img/common/placeholder.png [style width $width height $height border-radius 3px]]
}

######################################################
##### 
######################################################
m::proc -public tk::accesslog::parse {
} {
    Documentation goes here...
} {
    Trace

    lappend ::auto_path "/Melify/mtk/dev/app/accesslog"

    accesslog::parse::test
}

######################################################
##### TEST::JSON TEST::JSON TEST::JSON 
######################################################
m::proc -public tk::nonewline {
    str
} {
    Documentation goes here...
} {    
    Trace

    # NO NEW LINE IN JSON FILE
    regsub -all "\n" $str "" str

    return $str
}

######################################################
##### TEST::JSON TEST::JSON TEST::JSON 
######################################################
m::proc -public tk::test {
} {
    Documentation goes here...
} {    
    Trace

    division class="text-center" {
	h1 "$::ENV | $::APP"
	p [img /tk/img/common/testing.gif height=400]
	p [clock format [clock seconds]]
    }
}

######################################################
##### 
######################################################
m::proc -public tk::test:procs {
} {
    Documentation goes here...
} {    
    Trace

    put {
	<style>
	#test-procs li {display:inline-block;margin:5px;};
	</style>
    }

    uplevel {
	set cnt 0

	division [style padding 50px] id="test-procs" {
	    division class="page-header" [style margin-top 0] {
		h1 "[string toupper $::page] <small>- play around and be happy <i class='fa fa-smile-o'></i></small>"
	    }

	    number_list {
		foreach i [lsort [info procs]] {
		    if {[string index $i 0] == "_"} {
			continue
		    }

		    switch $i {
			init - template - narrative - narative - id - title {
			    # IGNORE THESE
			}

			default {
			    incr cnt
			    if {[info exist ::testcallback] == 0} {
				li class="btn btn-xs btn-default" [style min-width 120px] [url $i [URL callback [string range [namespace current] 2 end]::$i]]
			    } else {
				set url [url $i [URL callback $::testcallback widget [string range [namespace current] 2 end]::$i]]
				li class="btn btn-xs btn-default" [style min-width 120px] $url
			    }
			}
		    }
		}
	    }

	    if {$cnt == 0} {
		h1 class="error" "NO TEST PROCS FOUND !"
	    }
	}
    }
}

######################################################
#####
######################################################
m::proc -public tk::char {
    -char:required
    -size:required
    {-background "#000"}
    {-color "#FFF"}
} {
    Documentation goes here...
} {   
    Trace
    
    set class "tk-char-$size-$background-[string range $color 1 end]-$char"
    
    put [subst {
	<style>
	.$class {
	    display: inline-block;
	    background: $background;
	    color: $color;
	    border-radius: 9999px;
	    width: ${size}px;
	    height: ${size}px;
	    line-height: ${size}px;
	    text-align: center;
	    font-size: [expr $size*60/100]px;
	    font-weight: bold;
	}
	</style>
    }]

    span class="$class" $char
}

######################################################
#####
######################################################
m::proc -public tk::pretty {
    {-type "lang-html"}
    -guts:required
} {
    Documentation goes here...
} {  
    Trace
    tk::include::prettify
 
    preformatted class="prettyprint prettify $type linenums" [style padding 20px] {
	put $guts
    }

    put "<script>prettyPrint()</script>"
}

######################################################
#####
######################################################
m::proc -public tk::mirror {
    {-height 400px}
    -id:required
    -guts:required
} {
    Documentation goes here...
} {  
    Trace
    
    # ID OF "mycode-2" WILL RETURN EDITOR OF "mycode_2" FOR JS REASONS
    
    tk::include::codemirror
    
    textarea v($id)=$guts id="$id" class="form-control"
    
    regsub -all {\-} $id "_" editor
    
    javascript {
	put [subst {
	    // MAKE TEXT AREA PRETTY
	    editor = CodeMirror.fromTextArea(document.getElementById("$id"), {
		lineWrapping: true,
		lineNumbers: true,
		matchBrackets: true,
		continueComments: "Enter",
		extraKeys: {"Ctrl-Q": "toggleComment"},
		styleActiveLine: true,
		mode : "javascript",
		htmlMode: true
	    });
	    
	    jQuery("#$id").next(".CodeMirror").css({
		"height":"$height",
		"border":"1px #CCC solid",
		"border-radius":"3px #CCC solid"
	    });
	}]
    }
}

######################################################
#####
######################################################
m::proc -public tk::zip {
    -src:required
} {
    Documentation goes here...
} {  
    Trace

    set root [file rootname $src]
    set dir  [file dirname  $src]
    set fname [lindex [split $src "/"] end]

    if {[catch {
	cd $dir
	exec /usr/bin/zip $fname.zip $fname
    } e] != 0} {
	h1 "ERROR(tk::zip): $e"
	exit
    }
}

######################################################
##### 
######################################################
proc tk::cdir {} {
    uplevel {
	set dispScriptFile [file normalize [info script]]
	set scriptFolder [file dirname $dispScriptFile]
	set s1 [string first "/Melify" $scriptFolder]
	
	return [string range $scriptFolder $s1 end]
    }
}

######################################################
##### 
######################################################
proc tk::viewsource {} {
    division class="container" {
	division class="row" {
	    division class="col-md-12" {
		division class="page-header" [style margin-top 0] {
		    h1 [file tail $::file]
		}
	    }
	}
	division class="row" {
	    division class="col-md-12" {
		tk::pretty -type "lang-html" -guts [quote_html [file:read $::file]]
	    }
	}
    }

    javascript {
	put {
	    prettyPrint();
	}
    }
}

######################################################
##### CAT FILES INTO ONE
#####   tk::cat *.es6 wc.components.es6
######################################################
proc tk::cat {files outfile} {
    file delete -force $outfile

    puts $outfile

    set out [open /tmp/tk.cat w]

    fconfigure $out -translation binary

    foreach fname [glob -nocomplain -type f "$files"] {
	set in [open $fname]
	fconfigure $in -translation binary
	fcopy $in $out
	close $in
    }

    close $out

    file rename /tmp/tk.cat $outfile
}

######################################################
##### HUMAN READABLE FILE SIZE
######################################################
proc tk::hformat {x} {
    # MEGABYTES
    set q [expr {($x * 1.0) / pow(2,20)}]

    if {$q < 7} {
	# 0.XY SHOW TWO DECIMAL PLACES
	set q [expr {entier($q * 100) / 100.0}]
    } else {
	# ROUND IT OUT, ITS BIG
	set q [expr {round($q)}]
    }

    return "[commify $q] MB"
}

######################################################
##### 
######################################################
m::proc -public tk::holder {
    -size:required
    {-text        ""}
    {-theme "social"}
} {
    Documentation goes here...
} {    
    Trace

    include "/GitHub/holder/holder.min.js"

    # THEMES ARE: sky, vine, lava, gray, industrial, and social.

    put "<img src='holder.js/$size?theme=$theme&text=$text'>"
}

######################################################
#### TYPES: 
####   abstract animals business cats city food nightlife
####   fashion people natures ports technics transport
######################################################
m::proc -public tk::lorempixel {
    {-width  400}
    {-height 200}
    {-type "technics"}
    {-text ""}
} {
    Documentation goes here...
} {    
    Trace

    if {$text == ""} {set text [string toupper $type]}

    put "<img src='http://lorempixel.com/$width/$height/$type/$text' />"
}

######################################################
##### 
######################################################
m::proc -public tk::lorempixel:test {
} {
    Documentation goes here...
} {    
    Trace

    br
    division class="container" {
	division class="row" {
	    division class="col-md-12" {
		division class="page-header" {
		    h1 "Lorem <small>- Pixel</small>"
		}
	    }
	}
	division class="row" {
	    foreach i {abstract animals business cats city food nightlife fashion people nature sports technics transport} {
		division class="col-md-3" [style margin-bottom 10px] {
		    #tk::lorempixel -type $i -width 200 -text [string toupper [lorem 2]]
		    tk::lorempixel -type $i -width 200
		}
	    }
	}
    }
}

######################################################
##### 
######################################################
m::proc -public tk::imgsize {
    -file:required
} {
    Documentation goes here...
} {    
    Trace

    set fd [open $file]
    fconfigure $fd -translation binary
    set ch1 "00"
    while { ! [ eof $fd ] } {
	binary scan [ read $fd 1 ] "H2" ch2
	if { ( $ch1 == "ff" ) && ( $ch2 >= "c0" ) && ($ch2 <= "c3" ) } {
	    binary scan [ read $fd 7 ] "x3SS" height width
	    return [ list $height $width ]
	}
	set ch1 $ch2
    }
    error "Couldn't find JPG header for $file"
}

######################################################
##### tk::sleep -time 3000
######################################################
m::proc -public tk::sleep {
    -time:required
} {
    Documentation goes here...
} {    
    Trace

    after $time set end 1
    vwait end
}
