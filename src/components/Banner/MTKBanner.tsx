import * as React from "react";
import {useEffect} from "react";
import "./MTKBanner.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-banner': any;
            wc: any;
        }
    }
}

interface MTKBannerProps {
    id?: string;
    cfg: string;
    show: number;
}

export const MTKBanner = (props: MTKBannerProps) => {
    useEffect(() => {
        const listener = (e: any) => {
            console.log(e.detail.action, "EVENT ===============");
        }

        window.addEventListener('wc-banner', listener);

        return () => {
            window.removeEventListener('wc-banner', listener);
        }
    }, []);
    return (
	<wc-banner id="my-banner-1" cfg={props.cfg} show={props.show}></wc-banner>
    )
};


