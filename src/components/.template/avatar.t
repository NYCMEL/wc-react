array set ta {
    name "avatar"

    props {
	id?: string;
	img: string;
	title: string;
	width: string;
	height: string;
	background: string;
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
