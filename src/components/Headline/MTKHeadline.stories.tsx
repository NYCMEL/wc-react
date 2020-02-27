import * as React from 'react'
import {MTKHeadline} from "./MTKHeadline";

export default {title: 'MTK Headline'}

export const basic = () => (
    <div id="wc">
	<div className="aem pt-5">
            <MTKHeadline author="Mel" body={
		<wc-include href="http://links.melify.com/mtk/render?callback=tk::dummy::3"></wc-include>
	    } date="2/25/2020" title={
		<span>headline title</span>
	    } />
	</div>
    </div>
)
