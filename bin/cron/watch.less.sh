#!/bin/sh

PATH=$:PATH:/usr/local/bin

cd /Melify/mtk/dev

MYPROG="watch-less"
RESTART="/usr/local/bin/watch-less"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
