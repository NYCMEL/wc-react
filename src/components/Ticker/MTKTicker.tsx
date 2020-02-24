import * as React from 'react'
import {CommonProps} from "../../Common";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-ticker': any;
            wc: any;
        }
    }
}

interface MTKTickerProps extends CommonProps {
    id?: string;
    symbols: string[];
    interval?: number;
}

export const MTKTicker = (props: MTKTickerProps) => {
    // @ts-ignore
    window.wcENV = "dev";

    return (
        <div role='heading'>
            <div id="wc">
		<div className="container mt-5">
		    <div className="row">
			<div className="col-md-12">
			    <wc-ticker  style={{fontFamily:"fal"}}
			    symbols={props.symbols}
			    interval={props.interval}
			    {...props}
			    />
			</div>
		    </div>
		</div>
	    </div>
	</div>
    )
};
