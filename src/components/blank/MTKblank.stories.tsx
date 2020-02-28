import * as React from 'react'
import {MTKblank} from "./MTKblank";

export default {title: 'MTK blank'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-blank COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <h1><MTKblank id="my-blank" title="HELLO MEL"></MTKblank></h1>
		</div>
	    </div>
	</div>
    </div>
)

