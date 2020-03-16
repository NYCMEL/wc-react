array set ta {
    name "tabs"

    props {
	id?: string;
	cfg: JSX.Element | string | JSX.Element[];
	show: number;
    }

    sample {
	<wc-tabs id={props.id} {...props}></wc-tabs>
    }

    story {
	<MTKtabs id="my-tabs"></MTKtabs>
    }
}
