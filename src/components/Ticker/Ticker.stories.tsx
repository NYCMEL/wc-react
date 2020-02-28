import * as React from 'react'
import {Ticker} from "./Ticker";

export default {title: ' Ticker'}

export const basic = () => (
    <div id="wc">
        <div className="container mt-5">
            <div className="row">
                <div className="col-md-12 p-2">
                    <Ticker id="test" symbols={["TSLA", "C", "MSFT", "AAPL", "JPM", "AMZN"]} interval={5}/>
                </div>
            </div>
        </div>
    </div>
)
