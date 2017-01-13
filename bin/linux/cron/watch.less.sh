#!/bin/sh

PATH=$PATH:/usr/local/bin

cd /Melify/mtk/dev
rm -f Watchfile

MYPROG="watch.less.sh"
RESTART="/home/DTCC/mheravi/node_modules/watch-compile/bin/watchcompile -c"
PGREP="/bin/pgrep"

# FIND MYPROG PID
$PGREP -f ${MYPROG}

# IF NOT RUNNING
if [ $? -ne 0 ]
then
    $RESTART
fi
