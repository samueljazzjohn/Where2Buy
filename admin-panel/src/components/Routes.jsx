import React from 'react'

import { Route, Switch } from 'react-router-dom'

import Dashboard from '../pages/Dashboard'
import Customers from '../pages/Customers'
import Stores from '../pages/Stores'
import Login from '../pages/Login'

const Routes = () => {
    return (
        <Switch>
            <Route path='/' exact component={Login}/>
            <Route path='/dashboard' component={Dashboard}/>
            <Route path='/customers' component={Customers}/>
            <Route path='/Stores' component={Stores}/>
        </Switch>
    )
}

export default Routes
