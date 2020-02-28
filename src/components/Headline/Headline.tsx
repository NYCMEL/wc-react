import * as React from 'react'
import {useEffect} from "react";
import {CommonProps} from "../../Common";
import "./Headline.css";

declare global {
    namespace JSX {
        interface IntrinsicElements {
            'wc-headline': any;
            'wc-headline-title': any;
            'wc-headline-body': any;
            'wc-headline-date': any;
            'wc-headline-author': any
            'wc-include': any
            wc: any;
        }
    }
}

interface HeadlineProps extends CommonProps {
    id?: string;
    title: JSX.Element  | string | JSX.Element[];
    author: JSX.Element | string | JSX.Element[];
    body: JSX.Element   | string | JSX.Element[];
    date: JSX.Element   | string | JSX.Element[];
}

export const Headline = (props: HeadlineProps) => {
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
            <wc-headline id="my-headline-1">
                <wc-headline-title>
                    {props.title}
                </wc-headline-title>
                <wc-headline-body>
                    {props.body}
                </wc-headline-body>
                <wc-headline-date>
                    {props.date}
                </wc-headline-date>
                <wc-headline-author>
                    {props.author}
                </wc-headline-author>
            </wc-headline>
        </div>
    )
};
