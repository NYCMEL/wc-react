import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKapp.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-app': any;
            wc: any;
        }
    }
}

interface MTKappProps extends CommonProps {
    id?: string;
    path: string;
}

export const MTKapp = (props: MTKappProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-app', listener);

        return () => {
	    window.removeEventListener('wc-app', listener);
        }
    }, []);
    return (
	<wc-app id={props.id} path={props.path} {...props}></wc-app>
    )
};
