import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKCard.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-card': any;
            wc: any;
        }
    }
}

interface MTKCardProps extends CommonProps {
    id?: string;
    cfg: string;
}

export const MTKCard = (props: MTKCardProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log(e.detail.action, "EVENT ===============");
        }

        window.addEventListener('wc-card', listener);

        return () => {
	    window.removeEventListener('wc-card', listener);
        }
    }, []);
    return (
        <div role='heading'>
	    <wc-card id="my-card-2" cfg={props.cfg}}></wc-card>
	</div>
    )
};
