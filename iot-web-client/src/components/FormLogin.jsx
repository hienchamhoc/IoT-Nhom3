import React, { useState } from 'react';
import { TextField, Grid, Snackbar, Slide } from '@material-ui/core';
import { BiUserCircle } from 'react-icons/bi';
import { CgPassword } from 'react-icons/cg';
import call_api from '../services/request';
import { HiUser } from 'react-icons/hi';
import { RiLockPasswordFill } from 'react-icons/ri';


function SlideTransition(props) {
    return <Slide {...props} direction="up" />;
}

function FormLogin() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [open, setOpen] = useState(false);
    const [errorMessage, setErrorMessage] = useState('');

    const handleClose = (reason) => {
        setOpen(false);
    };

    async function login() {
        const res = await call_api({
            method: 'POST',
            url: '/login',
            data: {
                username,
                password
            }
        });

        const { data } = res;

        if (data.code === 200) {
            localStorage.setItem('token', data.data?.token);
            localStorage.setItem('user', data.data?.username);
            window.location = '/';
        } else {
            setErrorMessage(data.data);
            setOpen(true);
        }
    }

    window.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            login();
        };
    });

    return (
        <div className="col-md-6 bg-main">
            <div className="container d-flex justify-content-center align-items-center full-height">
                <form className="shadow border rounded col-md-7 bg-white p-4 mb-3 mt-3">
                    <h2>Đăng nhập</h2>
                    <Grid container alignItems="flex-end">
                        <Grid item xs={2}>
                            <HiUser size="1.5em" color="#ef9a9a" />
                        </Grid>
                        <Grid item xs={10}>
                            <TextField
                                label="Tài khoản"
                                fullWidth
                                value={username}
                                color="secondary"
                                onChange={(e) => setUsername(e.target.value)} />
                        </Grid>
                    </Grid>
                    <Grid className="mt-2" container alignItems="flex-end">
                        <Grid item xs={2}>
                            <RiLockPasswordFill size="1.5em" color="#ef9a9a" />
                        </Grid>
                        <Grid item xs={10}>
                            <TextField
                                type="password"
                                label="Mật khẩu"
                                value={password}
                                fullWidth
                                color="secondary"
                                onChange={(e) => setPassword(e.target.value)} />
                        </Grid>
                    </Grid>
                    <Snackbar
                        anchorOrigin={{
                            vertical: 'bottom',
                            horizontal: 'right',
                        }}
                        TransitionComponent={SlideTransition}
                        open={open}
                        autoHideDuration={3000}
                        onClose={handleClose}
                        message={errorMessage}
                    />
                    <button type="button" onClick={login} class="mt-4 btn btn-custom">Đăng nhập</button>
                </form>
            </div>
        </div>
    );
}

export default FormLogin;