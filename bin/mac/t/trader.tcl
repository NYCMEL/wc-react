#!/Melify/bin/mac/tclkit

source "/Melify/mtk/dev/tk/src/utl/json2dict.tcl"

if {$argc != 1} {
    puts "\nUSAGE: trader <symbol>"
    puts "EXAMPLE: trader AAPL\n"
    exit
}

set symbol [string toupper [lindex $argv 0]]

######################################################
##### 
######################################################
proc process {} {
    set h {
	"assetType" "symbol" "description" "bidPrice" "bidSize" "bidId" "askPrice" "askSize" "askId" "lastPrice" "lastSize" "lastId" "openPrice" "highPrice" "lowPrice"
	"bidTick" "closePrice" "netChange" "totalVolume" "quoteTimeInLong" "tradeTimeInLong" "mark" "exchange" "exchangeName" "marginable" "shortable" "volatility" "digits" "52WkHigh" "52WkLow" "nAV"
	"peRatio" "divAmount" "divYield" "divDate" "securityStatus" "regularMarketLastPrice" "regularMarketLastSize" "regularMarketNetChange" "regularMarketTradeTimeInLong"
	"netPercentChangeInDouble" "markChangeInDouble" "markPercentChangeInDouble" "regularMarketPercentChangeInDouble" "delayed"
    }

    set output ""

    while {1} {
	if {[catch {
	    regsub -all "," $::symbol "%2C" ::symbol
	    exec curl -X GET --header "Authorization: " "https://api.tdameritrade.com/v1/marketdata/quotes?apikey=N6RSFI69A6DPXUVJM22BB8T7HFUMXOIW&symbol=$::symbol"
	} e] != 0} {
	    set d [json::json2dict $e]

	    foreach i [dict keys $d] {
		puts ""
		puts [dict get $d $i]
	    }
	}

	exit
    }
}

######################################################
##### 
######################################################
process
