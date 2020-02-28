array set ta {
    name "tabs"

    css {
    }

    props {
	id?: string;
	cfg: string;
    }

    sample {
    	<wc-tabs id={props.id} cfg={props.cfg} {...props}></wc-tabs>
    }

    story {
	<MTKtabs id="my-tabs" cfg="http://links.melify.com/tk/lib/components/misc/webpack/src/w/cfg/tabs.react.json"></MTKtabs>
    }
}
