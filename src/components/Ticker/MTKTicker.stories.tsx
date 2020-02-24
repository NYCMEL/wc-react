import * as React from 'react'
import {MTKTicker} from "./MTKTicker";

export default {title: 'MTK Ticker'}

export const basic = () => <MTKTicker id="test"  style={{border:'10px solid yellow'}} symbols={["TSLA", "FB", "MSFT", "AMZN"]} interval={5}/>
