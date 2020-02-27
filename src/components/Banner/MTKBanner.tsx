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
        <div role='heading'>
	    <wc-banner {...props}>
		<wc-banner-lhs className="col-md-6">
		    <div>
			<wc-banner-title className="display-4">
			    <h2>{props.title}</h2>
			</wc-banner-title>

			<wc-banner-subtitle className="lead">
			    {props.subtitle}
			</wc-banner-subtitle>
			
			<wc-banner-actions className="lead">
			    <a id="btn-more-1" className="btn btn-primary btn-action" href="#" role="button">More I</a>
			    <a id="btn-more-2" className="btn btn-primary btn-action" href="#" role="button">More II</a>
			</wc-banner-actions>
		    </div>
		</wc-banner-lhs>

		<wc-banner-rhs className="col-md-6 cover"></wc-banner-rhs>
	    </wc-banner>
	</div>
    )
};
