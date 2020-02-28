import * as React from 'react'
import {CommonProps} from "../../Common";
import "./Ticker.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-ticker': any;
            wc: any;
        }
    }
}

interface TickerProps extends CommonProps {
    id?: string;
    symbols: string[];
    interval?: number;
}

export const Ticker = (props: TickerProps) => {
    // @ts-ignore
    window.wcENV = "dev";

    return (
        <div role='heading'>
	    <wc-ticker style={{fontFamily:"fal"}} symbols={props.symbols} interval={props.interval}  {...props} />
	</div>
    )
};
