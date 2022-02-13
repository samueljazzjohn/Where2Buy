import React from 'react'

import Table from '../components/table/Table'

import storeList from '../assets/JsonData/store-list.json'

const storeTableHead = [
    '',
    'name',
    'email',
    'phone',
    'location',
]

const renderHead = (item, index) => <th key={index}>{item}</th>

const renderBody = (item, index) => (
    <tr key={index}>
        <td>{item.id}</td>
        <td>{item.name}</td>
        <td>{item.email}</td>
        <td>{item.phone}</td>
        <td>{item.location}</td>
    </tr>
)
const Stores = () => {
    return (
        <div>
        <h2 className="page-header">
            customers
        </h2>
        <div className="row">
            <div className="col-12">
                <div className="card">
                    <div className="card__body">
                        <Table
                            limit='10'
                            headData={storeTableHead}
                            renderHead={(item, index) => renderHead(item, index)}
                            bodyData={storeList}
                            renderBody={(item, index) => renderBody(item, index)}
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
    );
};

export default Stores;
