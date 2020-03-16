array set ta {
    name "list"

    props {
	id?: string;
	title: JSX.Element | string | JSX.Element[];
    }

    sample {
	<wc-list id={props.id} class="text-center p-4 border" {...props}>
	    {props.title}
	</wc-list>
    }

    story {
	<MTKlist id="my-list" title="HELLO MEL"></MTKlist>
    }
}
