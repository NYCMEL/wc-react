import * as React from "react";
import {useEffect} from "react";
import "./Accordion.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-accordion': any;
            wc: any;
        }
    }
}
require('./wc.bundle.js');

interface AccordionProps {
    id?: string;
    cfg: string;
    show: number;
}

export const Accordion = (props: AccordionProps) => {
    useEffect(() => {
        const listener = (e: any) => {
            console.log(e.detail.action, "EVENT ===============");
        }

        window.addEventListener('wc-accordion', listener);

        return () => {
            window.removeEventListener('wc-accordion', listener);
        }
    }, []);
    return (
	<wc-accordion id="my-accordion-1" cfg={props.cfg} show={props.show}></wc-accordion>
    )
};


