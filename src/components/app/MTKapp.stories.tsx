import * as React from 'react'
import {MTKapp} from "./MTKapp";

export default {title: 'MTK app'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-app COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <MTKapp id="my-app" path="http://links.melify.com/tk/lib/components/w/html/parts/app/.react" page="page-0"></MTKapp>
		</div>
	    </div>
	</div>
    </div>
)

