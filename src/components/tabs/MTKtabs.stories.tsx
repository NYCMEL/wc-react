import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK tabs'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-tabs COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKtabs id="my-tabs"></MTKtabs>
		</div>
	    </div>
	</div>
    </div>
)

