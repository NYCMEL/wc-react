import * as React from "react";
import {useEffect} from "react";
import "./MTKAccordion.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-accordion': any;
            wc: any;
        }
    }
}

interface MTKAccordionProps {
    id?: string;
    cfg?: AccordionItem[];
    show: number;
}

export interface AccordionItem {
    header: string,
    body: string,
    icon: string,
}

export const MTKAccordion = (props: MTKAccordionProps) => {
    useEffect(() => {
        let w = document.querySelector("wc-accordion");
        console.log(">>>>>>>>>>", props.cfg, w);

        // @ts-ignore
        w.configure(props.cfg);

        const listener = (e: any) => {
            console.log(e.detail.action, "EVENT ===============");
        }

        window.addEventListener('wc-accordion', listener);

        return () => {
            window.removeEventListener('wc-accordion', listener);
        }
    }, []);
    return (
        <wc-accordion id="my-accordion-1" show={props.show}></wc-accordion>
    )
};


