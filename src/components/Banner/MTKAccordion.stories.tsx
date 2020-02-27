import * as React from 'react'
import {MTKAccordion} from "./MTKAccordion";

export default {title: 'MTK Accordion'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-ACCORDION COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-8">
		    <MTKAccordion cfg="http://localhost/tk/lib/components/w/data/accordion.react.json" show={0}></MTKAccordion>
		</div>
	    </div>
	</div>
    </div>
)
