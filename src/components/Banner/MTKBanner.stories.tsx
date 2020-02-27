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
		    } actions={
			<div>
			    <a id="btn-more-1" class="btn btn-primary btn-action mr-3" href="#" role="button">More I</a>
			    <a id="btn-more-2" class="btn btn-primary btn-action" href="#" role="button">More II</a>
			</div>
		    }
		    />
		</div>
	    </div>
	</div>
    </div>
)
