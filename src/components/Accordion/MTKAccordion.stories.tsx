import * as React from 'react'
import {MTKAccordion} from "./MTKAccordion";

export default {title: 'MTK Accordion'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-ACCORDION COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <MTKAccordion cfg="http://links.melify.com/tk/lib/components/w/data/accordion.json" show={0}/>
		</div>
	    </div>
	</div>
    </div>
)
