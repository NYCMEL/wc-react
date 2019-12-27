set date [clock format [clock seconds] -format %Y-%m-%d]

namespace eval ib {
    namespace eval quote {
	proc init {every symbols} {
	    foreach i [split $symbols ,] {
		puts "./data/$::date.$i.json"
		set ::f($i) [open ./data/$::date.$i.dat w]
		set ::last($i) 0
	    }

	    set res [json::json2dict [exec curl -s -k -X POST "https://localhost:5000/v1/portal/iserver/account" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"acctId\": \"U3401789\"}"]]
	    puts "INFO: $res"

	    ib::quote::pull $every $symbols
	}

	proc pull {every symbols} {
	    if {[catch {
		foreach i [json::json2dict [exec curl -s -k -X GET "https://localhost:5000/v1/portal/iserver/marketdata/snapshot?conids=$symbols&fields=31"]] {
		    array set ta $i
		    set ind $ta(conid)
		    
		    if {$ta(31) != $::last($ind)} {
			foreach j [split $i \n] {
			    puts -nonewline .;flush stdout
			    puts $::f($ind) $i;flush $::f($ind)
			    set ::last($ind) $ta(31)
			}
		    }
		}
	    } e] != 0} {
		puts "ERROR: $e"
	    }

	    after $every ib::quote::pull $every $symbols
	}
    }

    namespace eval order {
	proc place {conid orderType listingExchange price side ticker quantity} {
	    set order [subst {
		"acctId": "U3401789",
		"conid": "$conid",
		"secType": "$conid.STK",
		"cOID": "My-$conid",
		"orderType": "$orderType",
		"listingExchange": "$listingExchange",
		"outsideRTH": true,
		"price": $price,
		"side": "$side",
		"ticker": "$ticker",
		"tif": "Market",
		"quantity": $quantity,
		"useAdaptive": true
	    }]

	    puts "\nORDER: $order"

	    regsub -all "\\n" $order "" order

	    if {[catch {
		puts [exec curl -s -k -X POST "https://localhost:5000/v1/portal/iserver/account/U3401789/order" -H "accept:application/json" -H "Content-Type:application/json" -d [list $order]]
	    } e] != 0} {
		puts >>>>>>>>>>>$e
	    }
	}
    }
}
