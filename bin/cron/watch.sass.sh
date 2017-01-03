#!/bin/sh

MYPROG="sass"
RESTART="cd /Melify/mtk/dev && /usr/local/bin/sass --watch --style compressed /Melify/"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
   $RESTART
fi
