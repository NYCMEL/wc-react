import * as React from 'react'
import {MTKlist} from "./MTKlist";

export default {title: 'MTK list'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-list COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKlist id="my-list" title="HELLO MEL"></MTKlist>
		</div>
	    </div>
	</div>
    </div>
)

