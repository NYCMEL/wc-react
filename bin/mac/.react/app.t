array set ta {
    name "app"

    css {
	wc-app {
	}

	.app__page {
	    height: 800px;
	    overflow: auto;
	    margin-top: 10px;
	    border:1px #ebebeb solid;
	}

	.app__page .container-fluid .col-md-12 {
	}
    }

    props {
	id?: string;
	path: string;
	page: string;
    }

    sample {
    	<wc-app id={props.id} path={props.path} {...props}></wc-app>
    }

    story {
	<MTKapp id="my-app" path="http://links.melify.com/tk/lib/components/w/html/parts/app/.react" page="page-0"></MTKapp>
    }
}
