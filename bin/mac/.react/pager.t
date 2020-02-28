array set ta {
    name "pager"

    css {
    }

    props {
	id?: string;
	env: string;
	path: string;
    }

    sample {
    	<wc-pager id={props.id} path={props.path} env={props.env} {...props}></wc-pager>
    }

    story {
	<MTKpager id="my-pager" class="wc-maximize" env="dev" path="http://links.melify.com/tk/lib/components/w/html/parts/pager/.react"></MTKpager>
    }
}
