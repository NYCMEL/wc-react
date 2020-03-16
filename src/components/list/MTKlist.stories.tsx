import * as React from 'react'
import {MTKlist} from "./MTKlist";

export default {title: 'MTK list'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-list COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKlist id="my-list">
			<div className="border">
			    <a href="#" id="item-1">Item 1</a>
			    <div>
				<a href="#" id="item-11">Item 1.1</a>
				<a href="#" id="item-12">Item 1.2</a>
				<a href="#" id="item-13">Item 1.3</a>
			    </div>
			    <a href="#" id="item-2">Item 2</a>
			    <a href="#" id="item-3">Item 3</a>
			</div>
		    </MTKlist>
		</div>
	    </div>
	</div>
    </div>
)

