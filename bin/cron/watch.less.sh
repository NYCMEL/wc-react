#!/bin/sh

MYPROG="watch-less"
RESTART="cd /Melify/mtk/dev && /usr/local/bin/watch-less"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    echo $RESTART
    $RESTART
fi
