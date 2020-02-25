import * as React from 'react'
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKFlip.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-flip': any;
            'wc-flip-front': any;
            'wc-flip-back': any;
            wc: any;
        }
    }
}

export const MTKFlip = (props: CommonProps) => {
    // @ts-ignore
    window.wcENV = "dev";

    useEffect(() => {
        const listener = (e: any) => {
            console.log(e);
        }
        window.addEventListener('wc-flip', listener);
        return () => {
            window.removeEventListener('wc-flip', listener);
        }
    }, []);
    return (
        <div role='heading'>
            <div id="wc">
		<div className="container mt-5">
		    <div className="row">
			<div className="col-md-6">
			    <wc-flip {...props}>
				<wc-flip-front style={{background: 'wheat', padding: '30px', textAlign: 'center'}}>
				    <h5>If you click on me, i Can flip and show you more stuff</h5>
				</wc-flip-front>

				<wc-flip-back style={{background: 'khaki', padding: '30px', textAlign: 'center'}}>
				    <h5>Here is some more. if you move out, i will flip back</h5>
				</wc-flip-back>
			    </wc-flip>
			</div>
		    </div>
		</div>
	    </div>
	</div>
    )
};
