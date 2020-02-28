import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK tabs'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-tabs COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <MTKtabs id="my-tabs" cfg="http://links.melify.com/tk/lib/components/misc/webpack/src/w/cfg/tabs.json"></MTKtabs>
		</div>
	    </div>
	</div>
    </div>
)

