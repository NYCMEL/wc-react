import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKpager.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-pager': any;
            wc: any;
        }
    }
}

interface MTKpagerProps extends CommonProps {
    id?: string;
    cfg?: pagerItem[];
    env?: string;
}

export interface pagerItem {
    cache: string,
    page: string,
    label: string,
    url: string
}

export const MTKpager = (props: MTKpagerProps) => {
    useEffect(() => {
        let w = document.querySelector("wc-pager");

	console.log(">>>>>>>>>", JSON.stringify(props.cfg));

        // @ts-ignore
        w.configure(props.cfg);

        const listener = (e: any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-pager', listener);

        return () => {
	    window.removeEventListener('wc-pager', listener);
        }
    }, []);
    return (
	<wc-pager id={props.id} env={props.env}></wc-pager>
    )
};
