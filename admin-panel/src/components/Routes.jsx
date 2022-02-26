import React from 'react'

import { Route, Switch } from 'react-router-dom'

import Dashboard from '../pages/Dashboard'
import Customers from '../pages/Customers'
import Stores from '../pages/Stores'
import Login from '../pages/Login'
import Layout from './layout/Layout'
import { BrowserRouter } from 'react-router-dom/cjs/react-router-dom.min'

const Routes = () => {
    return (
        <BrowserRouter>
        <Switch>
            <Route path='/' exact component={Layout}/>
            {/* <Route path='/layout' component={Layout}/> */}
            <Route path='/dashboard' component={Dashboard}/>
            <Route path='/customers' component={Customers}/>
            <Route path='/Stores' component={Stores}/>
        </Switch>
        </BrowserRouter>   
    )
}

export default Routes
