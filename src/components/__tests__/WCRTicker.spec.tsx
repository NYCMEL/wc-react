import * as React from 'react'
import {render} from '@testing-library/react'
import '@testing-library/jest-dom/extend-expect'
import {Ticker} from "../..";

test('Renders', async () => {
    const {getByRole} = render(<Ticker symbols={["AAPL", "TSLA"]}/>)
    expect(getByRole('heading')).toHaveTextContent('My First Component')
})
