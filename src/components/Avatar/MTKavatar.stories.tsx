import * as React from 'react'
import {MTKavatar} from "./MTKAvatar";

export default {title: 'MTK Avatar'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-avatar COMPONENT
    <div id="wc">
	<div className="container mt-5">
	    <div className="row">
		<div className="col-md-6">
		    <wc-avatar id="my-avatar" img="http://links.melify.com/tk/img/common/mel.co.png" title="Mel" width="150px" height="150px" background="#000"></wc-avatar>
		</div>
	    </div>
	</div>
    </div>
)

