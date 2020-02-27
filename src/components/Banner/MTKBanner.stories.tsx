import * as React from 'react'
import {MTKBanner} from "./MTKBanner";

export default {title: 'MTK Banner'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-BANNER COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <MTKBanner title="MEL WAS HERE" subtitle={
			<wc-include href="http://links.melify.com/mtk/render?callback=tk::dummy::3"></wc-include>
		    }
		    />
		</div>
	    </div>
	</div>
    </div>
)
