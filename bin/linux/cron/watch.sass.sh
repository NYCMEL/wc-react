#!/bin/sh

PATH=$PATH:/usr/local/bin

cd /Melify/mtk/dev

MYPROG="watch.sass.sh"
RESTART="/usr/bin/sass --trace --watch --style compressed /Melify/*"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP -f ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
