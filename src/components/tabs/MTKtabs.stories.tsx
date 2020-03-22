import * as React from 'react'
import {MTKtabs} from "./MTKtabs";
import {publish} from "../../Utils";

export default {title: 'MTK Tabs'}

export const basic = () => {
    return (
	<div id="wc">
            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-12 margin-0 padding-0">
                        <div id="my-btn-group" className="btn-group" role="group" aria-label="Basic example">
                            <button type="button" className="btn btn-outline-secondary" onClick={() => publish({
				requestor: "my-tabs", request: "open", tab: 1}
			    )} > 1 - Open Tab One</button>

                            <button type="button" className="btn btn-outline-secondary" onClick={() => publish({
				requestor: "my-tabs", request: "load", tab: 1, url: "http://links.melify.com/mtk/render?ajax=1&callback=tk::dummy::3"
			    })} > 2 - Load Tab One From URL
                            </button>

                            <button type="button" className="btn btn-outline-secondary" onClick={() => publish({
                                requestor: "my-tabs", request: "load", tab: 1, html: "<h1>It worked!</h1>"})} > 3 - Load Tab One From URL
                            </button>
                        </div>
                    </div>
                </div>
            </div>

	    <div className="container mt-5">
		<div className="row">
		    <div className="col-md-12 border">
			<MTKtabs id="my-tabs" cfg="http://links.melify.com/tk/lib/components/misc/webpack/src/w/cfg/tabs.json" side="top" show={2} />
		    </div>
		</div>
	    </div>
	</div>
    )
};

