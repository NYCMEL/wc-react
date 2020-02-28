import * as React from 'react'
import {render} from '@testing-library/react'
import '@testing-library/jest-dom/extend-expect'
import {MTKTicker} from "../..";

test('Renders', async () => {
    const {getByRole} = render(<MTKTicker symbols={["AAPL", "TSLA"]}/>)
    expect(getByRole('heading')).toHaveTextContent('My First Component')
})
