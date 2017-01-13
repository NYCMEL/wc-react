#!/bin/sh

PATH=$PATH:/usr/local/bin

cd /Melify/mtk/dev

MYPROG="watch.less.sh"
RESTART="/usr/local/bin/watch-less -e css"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP -f ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
