import * as React from "react";
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKBanner.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-banner': any;
	    'wc-banner-title': any;
	    'wc-banner-subtitle': any;
	    'wc-banner-lhs': any;
	    'wc-banner-rhs': any;
	    'wc-banner-actions': any;
            wc: any;
        }
    }
}

interface MTKBannerProps extends CommonProps {
    id?: string;
    title: JSX.Element | string | JSX.Element[];
    subtitle: JSX.Element | string | JSX.Element[];
    actions: JSX.Element | string | JSX.Element[];
}

export const MTKBanner = (props: MTKBannerProps) => {
    useEffect(() => {
        const listener = (e: any) => {
 	    console.info(`SUBSCRIPTION TRIGGERED ${e.type} > ${JSON.stringify(e.detail)}`);
        }

        window.addEventListener('wc-banner', listener);

        return () => {
	    window.removeEventListener('wc-banner', listener);
        }
    }, []);
    return (
        <div role='heading'>
	    <wc-banner {...props}>
		<wc-banner-lhs class="col-md-6 d-block">
		    <div className="border">
			<wc-banner-title class="display-4">
			    {props.title}
			</wc-banner-title>

			<wc-banner-subtitle class="lead">
			    {props.subtitle}
			</wc-banner-subtitle>
			
			<wc-banner-actions class="lead">
			    {props.actions}
			</wc-banner-actions>
		    </div>
		</wc-banner-lhs>

		<wc-banner-rhs class="col-md-6 cover"></wc-banner-rhs>
	    </wc-banner>
	</div>
    )
};
