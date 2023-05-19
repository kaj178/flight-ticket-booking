const {validationResult} = require('express-validator')
const bcrypt = require('bcrypt')
const db = require('../database/connection')
const express = require('express')

class AccountController {

    showLoginForm(req, res, next) {
        if (req.session.user) {
            return res.redirect('/account/login')
        }

        const password = req.flash('password') || ''
        const email = req.flash('email') || ''
        const error = req.flash('error') || ''
        res.render('login', { 
            layout: 'blank',
            title: 'Login',
            error,
            email,
            password,
        })
    }

    login (req, res, next) {
        let result = validationResult(req)
        if(result.errors.length === 0) {
            const {email, password} = req.body
            const sql = 'SELECT * FROM user WHERE email = ?'
            const params = [email]
            db.query(sql, params, (error, result, fields) => {
                if(error) {
                    // throw error
                    req.flash('error', error.message)
                    req.flash('password', password)
                    req.flash('email', email)
                    return res.redirect('/account/login')  
                }
                else if (result.length === 0) {
                    req.flash('error', 'Sai email hoặc mật khẩu')
                    req.flash('password', password)
                    req.flash('email', email)
                    return res.redirect('/account/login')
                }
                else {
                    const hashedPassword = result[0].password
                    const match = bcrypt.compareSync(password, hashedPassword)
                    if (!match) {
                        req.flash('error', 'Sai email hoặc mật khẩu')
                        req.flash('password', password)
                        req.flash('email', email)
                        return res.redirect('/account/login')
                    }
                    else {
                        // Đăng nhập thành công
                        delete result[0].password
                        let user = result[0]
                        req.session.user = user
                        res.redirect('/')   
                    }
                }
            })
        }
        else {
            result = result.mapped()

            let message
            for (let fields in result) {
                message = result[fields].msg
                break
            }
            
            const {password, email} = req.body

            req.flash('error', message)
            req.flash('password', password)
            req.flash('email', email)
            res.redirect('/account/login')
        }
    }

    showRegisterForm(req, res, next) {
        const name = req.flash('name') || ''
        const email = req.flash('email') || ''
        const error = req.flash('error') || ''

        res.render('register', {
            layout: 'blank',
            title: 'Register', 
            error,
            name,
            email
        })
    }

    register(req, res, next) {
        let result = validationResult(req)

        if(result.errors.length === 0) {
            const {name, email, password} = req.body

            const hashedPassword = bcrypt.hashSync(password, 10)

            const sql = 'INSERT INTO user(name, email, password) VALUES (?, ?, ?)'
            const params = [name, email, hashedPassword]

            db.query(sql, params, (error, result, fields) => {
                if (error) {
                    req.flash('error', error.message)
                    req.flash('name', name)
                    req.flash('email', email)
                    return res.redirect('/account/register')  
                } 
                else if (result.affectedRows === 1) {
                    // Đăng kí thành công
                    return res.redirect('/account/login')
                } 

                req.flash('error', 'Đăng kí thất bại')
                req.flash('name', name)
                req.flash('email', email)
                return res.redirect('/account/register')
            })

        } else {
            result = result.mapped()

            let message
            for (let fields in result) {
                message = result[fields].msg
                break
            }
            
            const {name, email} = req.body

            req.flash('error', message)
            req.flash('name', name)
            req.flash('email', email)
            res.redirect('/account/register')
        }
    }
}

module.exports = new AccountController