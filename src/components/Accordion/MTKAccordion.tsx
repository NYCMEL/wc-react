import * as React from "react";
import {useEffect} from "react";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-accordion': any;
            wc: any;
        }
    }
}
require('./wc.bundle.js');

interface MTKAccordionProps {
    id?: string;
    cfg: string;
    show: boolean;
    show: PropTypes.number;
}

export const MTKAccordion = (props: MTKAccordionProps) => {

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
        <div role='heading'>
            {props.id}
            <div id="wc">
		<div className="container mt-5">
		    <div className="row">
			<div className="col-md-6">
			    <wc-accordion id="my-accordion-1" cfg="http://links.melify.com/tk/lib/components/w/data/accordion.json" show="2"></wc-accordion>
			</div>
		    </div>
		</div>
	    </div>
	</div>
    )
};


