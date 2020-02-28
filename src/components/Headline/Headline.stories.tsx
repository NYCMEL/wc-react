import * as React from 'react'
import {Headline} from "./Headline";

export default {title: ' Headline'}

export const basic = () => (
    <div id="wc">
	<div className="aem p-5">
            <Headline author="Mel" body={
		<wc-include href="http://links.melify.com/mtk/render?callback=tk::dummy::3"></wc-include>
	    } date="2/25/2020" title={
		<span>headline title</span>
	    } />
	</div>
    </div>
)
