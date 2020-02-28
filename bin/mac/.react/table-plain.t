array set ta {
    name "table-plain"

    css {
    }

    props {
	id?: string;
	href: string;
    }

    sample {
    	<wc-table-plain id={props.id} href={props.href} {...props}></wc-table-plain>
    }

    story {
	<MTKtablePlain id="my-table" href="http://links.melify.com/tk/lib/components/misc/webpack/src/w/data/table.html"></MTKtablePlain>
    }
}
