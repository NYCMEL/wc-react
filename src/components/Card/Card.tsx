import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./Card.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-card': any;
            wc: any;
        }
    }
}

interface CardProps extends CommonProps {
    id?: string;
    cfg: string;
}

export const Card = (props: CardProps) => {
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
	<wc-card {...props} id="my-card-2" cfg={props.cfg} />
    )
};
