import * as React from 'react'
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./MTKFlip.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-flip': any;
            'wc-flip-front': any;
            'wc-flip-back': any;
            wc: any;
        }
    }
}

interface MTKFlipProps extends CommonProps {
    id?: string;
    front: JSX.Element | string | JSX.Element[];
    back: JSX.Element | string | JSX.Element[];
}

export const MTKFlip = (props: MTKFlipProps) => {
    // @ts-ignore
    window.wcENV = "dev";

    useEffect(() => {
        const listener = (e: any) => {
            console.log(e);
        }
        window.addEventListener('wc-flip', listener);
        return () => {
            window.removeEventListener('wc-flip', listener);
        }
    }, []);
    return (
        <div role='heading'>
            <wc-flip {...props}>
                <wc-flip-front style={{background: 'wheat', padding: '30px', textAlign: 'center'}}>
                    {props.front}
                </wc-flip-front>

                <wc-flip-back style={{background: 'khaki', padding: '30px', textAlign: 'center'}}>
                    {props.back}
                </wc-flip-back>
            </wc-flip>
        </div>
    )
};
