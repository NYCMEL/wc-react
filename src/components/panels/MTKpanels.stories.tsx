import * as React from 'react'
import {MTKpanels} from "./MTKpanels";

export default {title: 'MTK panels'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-panels COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <div className="panels-container p-5 border shadow bg-light">
			<h1>HELLO MEL</h1>
		    </div>

		    <MTKpanels id="my-panels" cfg="http://links.melify.com/tk/lib/components/w/html/parts/panels/config.json" parent=".panels-container" />
		</div>
	    </div>
	</div>
    </div>
)

