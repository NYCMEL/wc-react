array set ta {
    name "blank"

    props {
	id?: string;
	title: JSX.Element | string | JSX.Element[];
    }

    sample {
	<wc-blank id={props.id} class="text-center p-4 border" {...props}>
	    {props.title}
	</wc-blank>
    }

    story {
	<MTKblank id="my-blank" title="HELLO MEL"></MTKblank>
    }
}
