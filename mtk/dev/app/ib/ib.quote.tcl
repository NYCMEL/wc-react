namespace eval ib {
    namespace eval quote {
	proc init {symbols every} {
	    ib::quote::update $every $symbols
	}
	
	proc update {every symbols} {
	    if {[catch {
		foreach i  [json::json2dict [exec curl -s -k -X GET "https://localhost:5000/v1/portal/iserver/marketdata/snapshot?conids=$symbols"]] {
		    puts "------------\n$i"
		}
	    } e] != 0} {
		puts >>>>>>>>>>$e
	    }
	    
	    after $every ib::quote::update $every $symbols
	}
    }
}
