/Melify/bin/mac/tclkit

package require smtp
package require mime
set mailfrom mel.heravi@gmail.com
set mailto mel.heravi@gmail.com
set mailsubject HELLO
set body "TESTING"
set myHost smtpout.secureserver.net
set myPort 456
set myUname Info@TurnOnGreen.com
set myUpassword RedOlive1

set token [mime::initialize -canonical "text/plain" -encoding "7bit" -string $body]
mime::setheader $token Subject $mailsubject
smtp::sendmessage $token \
    -servers [list $myHost] -ports [list $myPort]\
    -usetls true\
    -debug true\
    -username $myUname \
    -password $myUpassword\
    -queue false\
    -atleastone true\
    -header [list From "$mailfrom"] \
    -header [list To "$mailto"] \
    -header [list Subject "$mailsubject"]\
    -header [list Date "[clock format [clock seconds]]"]
mime::finalize $token
return 1

