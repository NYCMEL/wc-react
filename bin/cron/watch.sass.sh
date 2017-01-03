#!/bin/sh
PATH=/opt/someApp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# cd /Melify/mtk/dev && sass --watch --style compressed .

MYPROG="sass"
RESTART="sass --watch --style compressed \."
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
   $RESTART
fi
