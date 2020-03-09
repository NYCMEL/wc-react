import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKblank.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-blank': any;
            wc: any;
        }
    }
}

interface MTKblankProps extends CommonProps {
    id?: string;
	title: JSX.Element | string | JSX.Element[];
}

export const MTKblank = (props: MTKblankProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-blank', listener);

        return () => {
	    window.removeEventListener('wc-blank', listener);
        }
    }, []);
    return (
	<wc-blank id={props.id} class="text-center p-4 border" {...props}>
	    {props.title}
	</wc-blank>
    )
};

