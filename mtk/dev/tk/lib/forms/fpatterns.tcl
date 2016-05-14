array set patterns {
    text	{[A-Za-z0-9 ]}
    phone	{^(?d{3})?[- ]?d{3}[- ]?d{4}$}
    email	{[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$}
    city	{[A-Za-z ]+}
    state	{[A-Za-z]{1,50}}
    zipcode	{d{5}-?(d{4})?}
    ssn		{^d{3}-d{2}-d{4}$}
}

#parray patterns

