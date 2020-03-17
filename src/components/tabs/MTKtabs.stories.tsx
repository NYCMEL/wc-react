import * as React from 'react'
import {MTKtabs} from "./MTKtabs";

export default {title: 'MTK Tabs'}

export const basic = () => {
    const tabsData = [
        {
            "header": "Card I",
            "body": "<wc-include href='http://links.melify.com/mtk/render?ajax=1&callback=lorem&size=100'></wc-include>",
            "icon": "<i class='fa fa-comments'></i>"
        },
        {
            "header": "Card II",
            "body": "<wc-include href='http://links.melify.com/mtk/render?ajax=1&callback=lorem&size=100'></wc-include>",
            "icon": "<i class='fa fa-gear'></i>"
        },
        {
            "header": "Card III",
            "body": "<wc-include href='http://links.melify.com/mtk/render?ajax=1&callback=lorem&size=100'></wc-include>",
            "icon": "<i class='fa fa-calendar'></i>"
        }
    ];

    return (
        <div id="wc">
            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-8">
                        <MTKtabs cfg={tabsData} show={1} />
                    </div>
                </div>
            </div>
        </div>
    )
};
