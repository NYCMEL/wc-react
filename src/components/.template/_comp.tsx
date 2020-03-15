import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKCNAME.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-CNAME': any;
            wc: any;
        }
    }
}

interface MTKCNAMEProps extends CommonProps {
    PROPS
}

export const MTKCNAME = (props: MTKCNAMEProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-CNAME', listener);

        return () => {
	    window.removeEventListener('wc-CNAME', listener);
        }
    }, []);
    return (
	SAMPLE
    )
};
