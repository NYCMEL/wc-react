import * as React from 'react'
import {MTKHeadline} from "./MTKHeadline";

export default {title: 'MTK Headline'}

export const basic = () => (
    <div id="wc">
        <div className="container mt-5">
            <div className="row">
                <div className="col-md-6">
                    <MTKHeadline
                        author={"Mel"}
                        body={<div>body content</div>}
                        date="2/25/2020"
                        title={<h1>title</h1>}
                    />
                </div>
            </div>
        </div>
    </div>
)
