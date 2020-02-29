import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKpanels.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-panels': any;
            wc: any;
        }
    }
}

interface MTKpanelsProps extends CommonProps {
    id?: string;
	cfg: string;
	parent: string;
}

export const MTKpanels = (props: MTKpanelsProps) => {
    useEffect(() => {
        const listener = (e: any) => {
	    console.log("EVENT ===============", e.detail);
        }

        window.addEventListener('wc-panels', listener);

        return () => {
	    window.removeEventListener('wc-panels', listener);
        }
    }, []);
    return (
	<div>
	    <wc-panels id={props.id} cfg={props.cfg} parent={props.parent} {...props}></wc-panels>

	    <script>
		var w = document.querySelector("wc-panels");
		w.open("panel-1");
	    </script>
	</div>
    )
};

