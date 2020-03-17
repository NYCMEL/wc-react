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
    cfg?: string;
    show: number;
    side: string;
}

export interface tabsItem {
    cache: string,
    page: string,
    label: string,
    url: string
}

export const MTKtabs = (props: MTKtabsProps) => {
    useEffect(() => {
        // @ts-ignore
        const listener = (e: any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-tabs', listener);

        return () => {
	    window.removeEventListener('wc-tabs', listener);
        }
    }, []);

    return (
	<wc-tabs id={props.id} side={props.side} show={props.show} cfg={props.cfg}></wc-tabs>
    )
};

