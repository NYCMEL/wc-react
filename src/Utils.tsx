export const publish = (values: values): void => {

    console.log(values, "VALUES");
    var event = document.createEvent('CustomEvent');
    // @ts-ignore
    values.date = new Date().getTime();
    event.initCustomEvent(values.requestor, true, true, values);
    document.dispatchEvent(event);
}

interface values {
    requestor: string
    request: "open" | "load"
    panel: number
    url?: string
    html?: JSX.Element | string | JSX.Element[]
}


