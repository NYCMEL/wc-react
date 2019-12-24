set last ""
set date [clock format [clock seconds] -format %Y-%m-%d]

namespace eval ib {
    namespace eval quote {
	proc init {every symbols} {
	    foreach i [split $symbols ,] {
		puts "./data/$::date.$i.json"
		set ::f($i) [open ./data/$::date.$i.json a+]
	    }

	    ib::quote::pull $every $symbols
	}

	proc pull {every symbols} {
	    if {[catch {
		foreach i  [json::json2dict [exec curl -s -k -X GET "https://localhost:5000/v1/portal/iserver/marketdata/snapshot?conids=$symbols"]] {
		    if {$i != $::last} {
			set ind [lindex [split $i \n] 1]
			puts >>>>>>>>>$ind

			if {$ind != ""} {
			    puts -nonewline .;flush stdout
			    puts $::f($ind) $i;flush $::f($ind)
			    set ::last "$i"
			}
		    }
		}
	    } e] != 0} {
		puts >>>>>>>>>>$e
	    }

	    after $every ib::quote::pull $every $symbols
	}
    }

    proc order {conid orderType listingExchange price side ticker quantity} {
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
