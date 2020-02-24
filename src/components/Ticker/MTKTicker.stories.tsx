import * as React from 'react'
import {MTKTicker} from "./MTKTicker";

export default {title: 'MTK Ticker'}

export const basic = () => <MTKTicker id="test" symbols={["TSLA", "C", "MSFT", "AAPL", "JPM", "AMZN"]} interval={5}/>
