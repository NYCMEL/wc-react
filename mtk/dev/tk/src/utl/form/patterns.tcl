array set pattern {
    phone	{\d{3}[\-]\d{3}[\-]\d{4}}
    text	{[a-zA-Z ]+}
    alnum	{[a-zA-Z][a-zA-Z0-9\s]*}
    email	{[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
    city	{[A-Za-z ]+}
    state	{[A-Za-z]{2}}
    zipcode     {\d{5,5}(-\d{4,4})?}
    ssn         {^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}
    amount	{^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}
    number	{\d*}
    date	{\d{1,2}/\d{1,2}/\d{4}}
}
