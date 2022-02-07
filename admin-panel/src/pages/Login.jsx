import React,{useState,useEffect} from 'react';
import { Button, Col, Container, Form, Row } from "react-bootstrap";
import Swal from 'sweetalert2'
import axios from 'axios'
import {Redirect} from 'react-router-dom'

import 'bootstrap/dist/css/bootstrap.min.css';
import '../assets/css/login.css'

import Layout from '../components/layout/Layout'

import '../assets/css/login.css'

const Login = () => {

    const [username,setUsername]=useState("")
    const [password,setPassword] =useState("")
    const type="admin"

    const handleSubmit=(e)=>{
        e.preventDefault()
        let data={
            username:username,
            password:password
        }
        console.log(username)
        console.log(password)
        console.log(data)
        if(data.username==="admin"&&data.password==="admin123"){
            <Layout />
        }else{
            Swal.fire({
                icon:'error',
                title:'Username or password incorrect'
            })
        }
        // axios.post("", data).then(res => {
        // console.log(res.status)
        // console.log(res)
        // if(res.status===200){
        //     Swal.fire({
        //         icon: 'success',
        //         title: res.data,
        //       })
        //       return <Layout/>;
        // }
        // else if(res.status===201){
        //     Swal.fire({
        //         icon: 'error',
        //         title: 'Oops...',
        //         text: res.data,
        //       })
        //       return <Redirect to="/"></Redirect>;
        // }
        // else{
        //     Swal.fire({
        //         icon: 'error',
        //         title: 'Oops...',
        //         text: res.data,
        //       })
        //       return <Redirect to="/"></Redirect>;
        // }
        // })
        // .catch(err=>{
        //     console.log(err);
        // })
    }

    return (
        <>
            <div className="container">
                <div className="form-container">
                    <div className="header">
                        Admin
                    </div>
                    <Form className='form'>
                        <Form.Group className="mb-3" controlId="formBasicEmail">
                            <Form.Label>Username</Form.Label>
                            <Form.Control className='input' value={username} onChange={e=>setUsername(e.target.value)} type="text" placeholder="Enter username" />
                            
                        </Form.Group>

                        <Form.Group className="mb-3" controlId="formBasicPassword">
                            <Form.Label>Password</Form.Label>
                            <Form.Control className='input' value={password} onChange={e=>setPassword(e.target.value)} type="password" placeholder="Password" />
                        </Form.Group>

                        <div className="d-grid pt-2">
                            <Button className='btn btn-danger' onClick={handleSubmit}>Login</Button>
                        </div>

                    </Form>
                </div>
            </div>
        </>
    );
};

export default Login;
