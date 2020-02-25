import * as React from 'react'
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKHeadline.css";

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

interface MTKHeadlineProps {
    id?: string;
    front: JSX.element | string | JSX.element[];
    back: JSX.element | string | JSX.element[];
}

export const MTKHeadline = (props: CommonProps) => {
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
	    <wc-flip {...props}>
		<wc-flip-front style={{background: 'wheat', padding: '30px', textAlign: 'center'}}>
		    {props.front}
		</wc-flip-front>
		
		<wc-flip-back style={{background: 'khaki', padding: '30px', textAlign: 'center'}}>
		    {props.back}
		</wc-flip-back>
	    </wc-flip>
	</div>
    )
};
