import * as React from 'react'
import {MTKFlip} from "./MTKFlip";

export default {title: 'MTK Flip'}

export const basic = () => (
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKFlip id="test" style={{width:"400px",height:"200px"}}/>
    		</div>
	    </div>
	</div>
    </div>
}
