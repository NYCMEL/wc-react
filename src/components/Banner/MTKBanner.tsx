import * as React from "react";
import {useEffect} from "react";
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

interface MTKBannerProps {
    id?: string;
    title: string;
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
	<wc-banner id="my-banner-1" background="#FFF">
	    <wc-banner-lhs className="col-md-6">
		<div>
		    <wc-banner-title className="display-4">
			{props.title}
		    </wc-banner-title>

		    <wc-banner-subtitle className="lead">
			Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
			sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
		    </wc-banner-subtitle>

		    <p>
			<hr/>
			Hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilis
		    </p>

		    <wc-banner-actions className="lead">
			<a id="btn-more-1" className="btn btn-primary btn-action" href="#" role="button">More I</a>
			<a id="btn-more-2" className="btn btn-primary btn-action" href="#" role="button">More II</a>
		    </wc-banner-actions>
		</div>
	    </wc-banner-lhs>

	    <wc-banner-rhs className="col-md-6 cover">
	    </wc-banner-rhs>
	</wc-banner>
    )
};


