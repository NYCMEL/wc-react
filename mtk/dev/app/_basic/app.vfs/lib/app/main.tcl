###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

# USE MELIFY SERVER FOR ALL COMPONENTS OR THE LOCAL SERVER
set TKSERVER [expr {0 ? "http://www.melify.com" : "/Melify/mtk/$ENV"}]

set fluid       ""; # ACCEPTABLE VALUES ARE EITHER "" OR "-fluid"
set company	"Melify"
set isolate	"1"

##############################################################################
# NEED THIS LINE TO TALK TO YOUR CODE IN APP DIRECTORY
# WHEN YOU ADD NEW DIRECTORIES, YOU WILL NEED TO APPEND
# THE PATH TO THIS LINE
##############################################################################
lappend auto_path\
    $::starkit::topdir/lib/app

source $TKSERVER/tk/lib/paths.tcl

# INITIALIZE THE TOOLKIT WITH TRACING ON AND SQLITE DATABASE
tk::init\
    -admin    "Support@Melify.com"\
    -sqlitedb "$TKSERVER/app/$APP/db/sqlite.db"
