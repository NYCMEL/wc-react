array set ta {
    name "blank"

    props {
	id?: string;
	title: JSX.Element | string | JSX.Element[];
    }

    sample {
	<wc-blank id={props.id} class="text-center p-4 border">
	    {props.title}
	</wc-blank>
    }
}
