import * as React from 'react'
import {MTKpager} from "./MTKpager";

export default {title: 'MTK pager'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-pager COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-12">
		    <MTKpager id="my-pager" class="wc-maximize" env="dev" path="http://links.melify.com/tk/lib/components/w/html/parts/pager/.react"></MTKpager>
		</div>
	    </div>
	</div>
    </div>
)
