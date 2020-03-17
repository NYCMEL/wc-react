import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK Tabs'}

export const basic = () => (
    // EXAMPLE USAGE OF WC-avatar COMPONENT
    <div id="wc">
        <div className="container mt-5">
            <div className="row">
                <div className="col-md-12 border padding-0 margin-0">
                    <MTKtabs id="my-tabs" cfg="http://links.melify.com/tk/lib/components/misc/webpack/src/w/cfg/tabs.json" side="lhs" show={0} />
                </div>
            </div>
        </div>
    </div>
)
