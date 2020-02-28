array set ta {
    name "panels"

    css {
    }

    props {
	id?: string;
	cfg: string;
	parent: string;
    }

    sample {
    	<wc-panels id={props.id} cfg={props.cfg} parent={props.parent} {...props}></wc-panels>
    }

    story {
	<MTKpanels id="my-panels" cfg="/tk/lib/components/w/html/parts/panels/config.json" parent="#panels-container">waiting...</wMTKpanels>
    }
}
