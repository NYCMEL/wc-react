import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK Tabs'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-tabs COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKtabs id="my-tabs" cfg="http://links.melify.com/tk/lib/components/misc/webpack/src/w/cfg/remote/tabs.lhs.json" show={0}></MTKtabs>
		</div>
	    </div>
	</div>
    </div>
)

