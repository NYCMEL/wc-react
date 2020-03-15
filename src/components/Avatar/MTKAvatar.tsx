import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKavatar.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-avatar': any;
            wc: any;
        }
    }
}

interface MTKavatarProps extends CommonProps {
    id?: string;
    img: string;
    width: string;
    height: string;
    background:: string;
    title: JSX.Element | string | JSX.Element[];
}

export const MTKavatar = (props: MTKavatarProps) => {
    useEffect(() => {
        const listener = (e: any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-avatar', listener);

        return () => {
	    window.removeEventListener('wc-avatar', listener);
        }
    }, []);
    return (
	<wc-avatar id={props.id} class="text-center p-4 border" {...props}>
	    {props.title}
	</wc-avatar>
    )
};

