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
    cfg: JSX.Element | string | JSX.Element[];
    show: number;
}

export const MTKtabs = (props: MTKtabsProps) => {
    useEffect(() => {
        const listener = (e: any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-tabs', listener);

        return () => {
	    window.removeEventListener('wc-tabs', listener);
        }
    }, []);
    return (
	<wc-tabs id={props.id} {...props}></wc-tabs>
    )
};

