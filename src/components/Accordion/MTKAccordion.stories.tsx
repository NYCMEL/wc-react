import * as React from 'react'
import {MTKAccordion} from "./MTKAccordion";
import "./MTKAccordion.css"

export default {title: 'MTK Accordion'}

export const basic = () => <MTKAccordion cfg="./data.json" show={0}/>
