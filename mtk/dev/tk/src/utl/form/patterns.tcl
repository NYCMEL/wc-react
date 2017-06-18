namespace eval tk {
    namespace eval form {
    }
}

array set tk::form::pattern {
    text	{[A-Za-z0-9 ]}
    phone	{^(?d{3})?[- ]?d{3}[- ]?d{4}$}
    email	{[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
    city	{[A-Za-z ]+}
    state	{[A-Za-z]{1,50}}
    zipcode	{\d{5,5}(-\d{4,4})?}
    ssn		{^(\d{3}-|(\d{3})\s)\d{2}-\d{4}$}
    amount	{^[$\-\s]*[\d\,]*?([\.]\d{0,2})?\s*$}
    number	{\d*}
}

parray tk::form::pattern

h1 $tk::form::pattern(email)
