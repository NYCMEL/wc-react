import * as React from 'react'
import {MTKHeadline} from "./MTKHeadline";

export default {title: 'MTK Headline'}

export const basic = () => (
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <wc-headline id="my-headline-1">
			<wc-headline-title>
			    Headline <small>(inline)</small>
			</wc-headline-title>

			<wc-headline-body>
			    Optional Supporting copy. Etiam varius leo vel eros iaculis, tempus porta lacus posuere. Nulla in erat gravida,
			    convallis nibh non, accumsan dui. Pellentesque ac vulputate elit,
			    et aliquam ipsum. Nam ut nulla volutpat, consequat libero vitae, tincidunt lectus.
			</wc-headline-body>

			<wc-headline-date>
			    08 Mar 2018
			</wc-headline-date>

			<wc-headline-author>
			    Mel M. Heravi
			</wc-headline-author>
		    </wc-headline>
    		</div>
	    </div>
	</div>
    </div>
}
