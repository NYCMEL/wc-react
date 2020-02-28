import * as React from 'react'
import {Accordion} from "./Accordion";

export default {title: ' Accordion'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-ACCORDION COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-8">
		    <Accordion cfg="http://localhost/tk/lib/components/w/data/accordion.react.json" show={0}></Accordion>
		</div>
	    </div>
	</div>
    </div>
)
