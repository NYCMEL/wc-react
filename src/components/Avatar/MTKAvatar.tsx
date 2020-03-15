import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKAvatar.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-avatar': any;
            wc: any;
        }
    }
}

interface MTKAvatarProps extends CommonProps {
    id?: string;
    img: string;
    title: string;
    width: string;
    height: string;
    background: string;
}

export const MTKAvatar = (props: MTKAvatarProps) => {
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
	<wc-avatar id={props.id} {...props}></wc-avatar>
    )
};

