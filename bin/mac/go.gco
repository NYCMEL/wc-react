#!/Melify/bin/mac/tclkit

cd /Melify

exec find . -name ".git" -print > /tmp/z.dat

set f [open /tmp/z.dat r]

#SKIP THE FIRST LINE
gets $f line

while {[gets $f line] >= 0} {
    set dir "/Melify/[string range [file rootname $line] 2 end]"
    puts $line
    cd $dir
    catch {exec /usr/bin/git pull melify master}
    cd /Melify
}
