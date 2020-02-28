array set ta {
    name "app"

    css {
    }

    props {
	id?: string;
	path: string;
    }

    sample {
    	<wc-app id={props.id} path={props.path} {...props}></wc-app>
    }

    story {
	<MTKapp id="my-app" path="http://links.melify.com/tk/lib/components/w/html/parts/app/.react" page="page-0"></MTKapp>
    }
}
