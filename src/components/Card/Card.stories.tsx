import * as React from 'react'
import {Card} from "./Card";

export default {title: ' Card'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-CARD COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <Card cfg="http://links.melify.com/tk/lib/components/w/cfg/cards/card-2.react.json" />
		</div>
	    </div>
	</div>
    </div>
)
