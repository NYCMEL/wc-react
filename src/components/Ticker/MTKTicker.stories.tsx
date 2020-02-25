import * as React from 'react'
import {MTKTicker} from "./MTKTicker";

export default {title: 'MTK Ticker'}

export const basic = () => (
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12 p-2">
		    <MTKTicker id="test" symbols={["TSLA", "C", "MSFT", "AAPL", "JPM", "AMZN"]} interval={5} />
    		</div>
	    </div>
	</div>
    </div>
}
