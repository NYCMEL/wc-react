###HEADS###################################################################
#
#   COPYRIGHT (C) 1993,2009 Melify                                       
#   EMAIL:        Support@Melify.com                                        
#   URL:          http://www.Melify.com                                    
#   
#   A LICENSE IS REQUIRED FOR ALL PUBLIC FACING USE OF THIS TOOLKIT
#   
#   SOME JAVASCRIPTS INCLUDED IN THIS PACKAGE MAY REQUIRE A SEPARATE         
#   LICENSE, PLEASE COMPLY WITH THEIR LICENSING AGREEMENTS                   
#
###HEADE###################################################################

namespace eval test {}

######################################################
##### 
######################################################
m::proc -public test::id {
} {
    Documentation goes here...
} {
    Trace
    
    return "test"
}

######################################################
##### 
######################################################
m::proc -public test::narative {
} {
    Documentation goes here...
} {
    Trace

    put "this is a test page"
}

######################################################
##### 
######################################################
m::proc -public test::title {
} {
    Documentation goes here...
} {
    Trace
    
    return "Test"
}

######################################################
##### 
######################################################
m::proc -public test::init {
} {
    Documentation goes here...
} {    
    Trace
    variable _id [id]

    tk::test:procs
}
