import * as React from 'react'
import {MTKFlip} from "./MTKFlip";

export default {title: 'MTK Flip'}

export const basic = () => (
    <div id="wc">
        <div className="container mt-5">
            <div className="row">
                <div className="col-md-6">
                    <MTKFlip id="test" style={{width: "400px", height: "200px"}}
                             front={<h5>IF YOU CLICK ME <br/> i will flip and show you more stuff</h5>}
                             back={<h5>IF YOU MOUSE OUT <br/>i flip back</h5>}
                    />
                </div>
            </div>
        </div>
    </div>
)
