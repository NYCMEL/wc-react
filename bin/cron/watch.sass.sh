#!/bin/sh

PATH=$PATH:/usr/local/bin

cd /Melify/mtk/dev

MYPROG="sass"
RESTART="/usr/local/bin/sass --trace --watch --style compressed /Melify/* >> /tmp/cron.sass.log"
PGREP="/usr/bin/pgrep"

# FIND MYPROG PID
$PGREP ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
