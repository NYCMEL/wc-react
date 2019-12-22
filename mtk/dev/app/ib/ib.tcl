namespace eval ib {
    proc quote {every symbols} {
	if {[catch {
	    foreach i  [json::json2dict [exec curl -s -k -X GET "https://localhost:5000/v1/portal/iserver/marketdata/snapshot?conids=$symbols"]] {
		puts "------------\n$i"
	    }
	} e] != 0} {
	    puts >>>>>>>>>>$e
	}

	after $every ib::quote $every $symbols
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
