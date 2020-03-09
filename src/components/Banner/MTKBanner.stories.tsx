import * as React from 'react'
import {MTKBanner} from "./MTKBanner";

export default {title: 'MTK Banner'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-BANNER COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <MTKBanner title="Banner title" subtitle={
			<wc-include href="http://links.melify.com/mtk/render?callback=lorem&size=40"></wc-include>
		    } actions={
			<div>
			    <hr/>
			    <button className="btn btn-primary btn-action btn-more-1 mr-3" role="button">More I</button>
			    <button className="btn btn-primary btn-action btn-more-2" role="button">Even More II</button>
			</div>
		    }
		    />
		</div>
	    </div>
	</div>
    </div>
)
