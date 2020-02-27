import * as React from 'react'
import {MTKBanner} from "./MTKBanner";

export default {title: 'MTK Banner'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-BANNER COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-8">
		    <MTKBanner cfg="http://localhost/tk/lib/components/w/data/banner.react.json" show={0}></MTKBanner>
		</div>
	    </div>
	</div>
    </div>
)
