#!/bin/sh

PATH=$PATH:/usr/local/bin

cd /Melify/mtk/dev

MYPROG="watch.sass.sh"
RESTART="/usr/local/bin/sass --trace --watch --style compressed /Melify/*"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
#$PGREP ${MYPROG}
/bin/ps -ef | /usr/bin/grep ${MYPROG} | /usr/bin/awk '{print $2}'

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
