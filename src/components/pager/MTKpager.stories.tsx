import * as React from 'react'
import {MTKpager} from "./MTKpager";

export default {title: 'MTK pager'}

export const basic = () => {
    const pagerData = [
	{
	    "cache": "true",
	    "page": "home",
	    "label": "Welcome",
	    "url": "<wc-include href='/tk/lib/components/w/html/parts/pager/home.html'></wc-include>"

	},
	{
	    "cache": "true",
	    "page": "products",
	    "label": "Our Products",
	    "url": "<wc-include href='/tk/lib/components/w/html/parts/pager/products.html'></wc-include>"
	},
	{
	    "cache": "false",
	    "page": "contact",
	    "label": "Contact us",
	    "url": "<wc-include href='/tk/lib/components/w/html/parts/pager/contact.html'></wc-include>"
	},
	{
	    "cache": "true",
	    "page": "login",
	    "label": "Sign-In",
	    "url": "<wc-include href='/tk/lib/components/w/html/parts/pager/login.html'></wc-include>"
	},
	{
	    "cache": "true",
	    "page": "cart",
	    "label": "Shopping Cart",
	    "url": "<wc-include href='/tk/lib/components/w/html/parts/pager/cart.html'></wc-include>"
	}
    ];

    return (
	<div id="wc">
	    <div className="container mt-5">
		<div className="row">
		    <div className="col-md-12">
			<MTKpager id="my-pager" class="wc-maximize" cfg={pagerData}></MTKpager>
		    </div>
		</div>
	    </div>
	</div>
    )
};
