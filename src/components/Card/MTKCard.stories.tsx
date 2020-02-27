import * as React from 'react'
import {MTKCard} from "./MTKCard";

export default {title: 'MTK Card'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-CARD COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKCard cfg="http://links.melify.com/tk/lib/components/w/cfg/cards/card-2.json" />
		</div>
	    </div>
	</div>
    </div>
)
