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
	env: string;
	path: string;
}

export const MTKpager = (props: MTKpagerProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-pager', listener);

        return () => {
	    window.removeEventListener('wc-pager', listener);
        }
    }, []);
    return (
	<wc-pager id={props.id} path={props.path} env={props.env} {...props}></wc-pager>
    )
};

