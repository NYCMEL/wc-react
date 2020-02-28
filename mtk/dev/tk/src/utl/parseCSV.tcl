package require csv
package require struct::queue

##################################################################
#### set result [parseCSV ./locale.csv]
##################################################################
proc parseCSV {file} {
    set csv [ open $file {RDWR} ]

    ::struct::queue q
    ::csv::read2queue $csv q

    return [q peek [q size]]
}
