import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKtabs.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-tabs': any;
            wc: any;
        }
    }
}

interface MTKtabsProps extends CommonProps {
    id?: string;
    cfg: string;
}

export const MTKtabs = (props: MTKtabsProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-tabs', listener);

        return () => {
	    window.removeEventListener('wc-tabs', listener);
        }
    }, []);
    return (
	<wc-tabs id={props.id} cfg={props.cfg} {...props}></wc-tabs>
    )
};
