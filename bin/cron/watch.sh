#!/bin/sh
PATH=/opt/someApp/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

cd /Melify && /usr/local/bin/watch-less
cd /Melify && /usr/local/bin/sass --watch --style compressed .
