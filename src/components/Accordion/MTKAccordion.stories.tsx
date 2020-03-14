import * as React from 'react'
import {MTKAccordion} from "./MTKAccordion";

export default {title: 'MTK Accordion'}

export const basic = () => {

    const accordionData = [
        {
            "header": "Card I",
            "body": "http://links.melify.com/mtk/render?ajax=1&callback=tk::dummy::3",
            "icon": "<i class='fa fa-comments'></i>"
        },
        {
            "header": "Card II",
            "body": "http://links.melify.com/mtk/render?ajax=1&callback=tk::dummy::3",
            "icon": "<i class='fa fa-gear'></i>"
        },
        {
            "header": "Card III",
            "body": "http://links.melify.com/mtk/render?ajax=1&callback=tk::dummy::3",
            "icon": "<i class='fa fa-calendar'></i>"
        }
    ];

    return (
        <div id="wc">
            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-8">
                        <MTKAccordion
                            cfg={accordionData}
                            show={1}
                        />
                    </div>
                </div>
            </div>
        </div>
    )
};
