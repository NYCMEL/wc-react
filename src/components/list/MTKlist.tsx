import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKlist.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-list': any;
            wc: any;
        }
    }
}

interface MTKlistProps extends CommonProps {
    id?: string;
    children: JSX.Element | string | JSX.Element[];
    arrows: JSX.Element | string | JSX.Element[];
}

export const MTKlist = (props: MTKlistProps) => {
    useEffect(() => {
        const listener = (e:any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-list', listener);

        return () => {
	    window.removeEventListener('wc-list', listener);
        }
    }, []);
    return (
	<wc-list id={props.id} {...props}></wc-list>
    )
};

