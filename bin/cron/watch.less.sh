#!/bin/sh
PATH=/opt/someApp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# cd /Melify && /usr/local/bin/watch-less

MYPROG="watch-less"
RESTART="cd /Melify/mtk/dev && watch-less >> /tmp/less.log"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
   $RESTART
fi
