#!/Melify/bin/mac/tclkit

set ::env(HTTP_HOST) localhost

lappend ::auto_path\
    /Melify/mtk/dev/tk/src\
    /Melify/mtk/dev/tk/src/util\
    /Melify/mtk/dev/tk/lib/cgi\
    /Melify/mtk/dev/tk/lib/components/tcl

proc Trace {args} {}
proc put {args} {}

set f [open /tmp/melify-components.el w]

cd /Melify/mtk/dev/tk/lib/components

foreach i [exec find . -name "*.tcl"] {
    set t [file tail $i]

    if {($t == "sandbox.tcl") || ($t == "tb.form.tcl")} {
	continue
    }

    catch {
	source $i

	set tmp "[lreplace  [split $t .] end end]"

	set name "[join $tmp -]"
	set test "[join $tmp ::]::test"

	set body [info body $test]
	regsub -all {\"} $body {\"} body

	set tmp [subst {
	    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	    ;;
	    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	    (fset '$name
	     \"
	     $body
	     \")
	}]

	set x ""
	foreach i [split $tmp \n] {
	    if {[string trim $i] == ""} {
		continue
	    }

	    append x $i\n
	}

	puts $f $x
    }
}

close $f
