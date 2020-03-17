import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK Tabs'}

export const basic = () => {
    const tabsData = [
	{
	    "cache": "true",
	    "page": "home",
	    "label": "Welcome",
	    "url": "<wc-include href='http://links.melify.com/tk/lib/components/w/html/parts/pager/home.html'></wc-include>"

	},
	{
	    "cache": "true",
	    "page": "products",
	    "label": "Our Products",
	    "url": "<wc-include href='http://links.melify.com/tk/lib/components/w/html/parts/pager/products.html'></wc-include>"
	},
	{
	    "cache": "false",
	    "page": "contact",
	    "label": "Contact us",
	    "url": "<wc-include href='http://links.melify.com/tk/lib/components/w/html/parts/pager/contact.html'></wc-include>"
	},
	{
	    "cache": "true",
	    "page": "cart",
	    "label": "Shopping Cart",
	    "url": "<wc-include href='http://links.melify.com/tk/lib/components/w/html/parts/pager/cart.html'></wc-include>"
	}
    ];

    return (
        <div id="wc">
            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-12">
                        <MTKtabs cfg={tabsData} side="top" show={0} />
                    </div>
                </div>
            </div>
        </div>
    )
};
