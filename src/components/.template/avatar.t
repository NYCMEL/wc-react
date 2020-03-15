array set ta {
    name "avatar"

    props {
	id?: string;
	img: string;
	width: string;
	height: string;
	background:: string;
	title: JSX.Element | string | JSX.Element[];
    }

    sample {
	<wc-avatar id={props.id} class="text-center p-4 border" {...props}>
	    {props.title}
	</wc-avatar>
    }

    story {
	<MTKavatar id="my-avatar" title="HELLO MEL"></MTKavatar>
    }
}
