import * as React from 'react'
import {MTKAccordion} from "./MTKAccordion";

export default {title: 'MTK Accordion'}

export const basic = () => {
    const accordionData = [
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

    function sayHello(ind) {
	alert('Hello!' + ind);
    }
    
    var codeStyle = {
	color: 'brown',
	fontSize: '14px',
	fontFamily: "fixed"
    };

    return (
        <div id="wc">
            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-12">
			<div id="my-btn-group" className="btn-group" role="group" aria-label="Basic example">
			    <button type="button" className="btn btn-outline-secondary" onClick={sayHello(1)}>1 - Open Panel One</button>
			    <button type="button" className="btn btn-outline-secondary">2 - Load Panel One From URL</button>
			    <button type="button" className="btn btn-outline-secondary">3 - Load Panel One From HTML</button>
			</div>
                    </div>
                </div>
            </div>

            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-12">
			<h5>JSON requests</h5>
			<ol>
			    <li><code style={codeStyle}>&#123;requestor:"my-accordion", request:"open", panel:1&#125;</code></li>
			    <li><code style={codeStyle}>&#123;requestor:"my-accordion", request:"load", panel:0, url:"/mtk/render?ajax=1&callback=tk::dummy::3&#125;"</code></li>
			    <li><code style={codeStyle}>&#123;requestor:"my-accordion", request:"load", panel:0, html:"&lt;h1&gt;Mel was here&lt;/h1&gt;&#125;"</code></li>
			</ol>
                    </div>
                </div>
            </div>

            <div className="container mt-5">
                <div className="row">
                    <div className="col-md-8">
			<h5>my-accordion</h5>
                        <MTKAccordion id="my-accordion" cfg={accordionData} show={1} />
                    </div>
                </div>
            </div>
        </div>
    )
};
