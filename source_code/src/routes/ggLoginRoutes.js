const express = require('express')
const app = express()
const router = express.Router()
const ggLoginController = require('../app/controllers/GoogleLoginController')


// GG login routing
router.get('/google', ggLoginController.login)

// GG Authenticating account routing
router.get('/google/callback', ggLoginController.callback, (req, res) => {
    // Lưu người dùng vào Cookie
    const user = req.user
    res.cookie('user-cookie', user, { maxAge: 86400000 }) // Xóa Cookie sau 1 ngày
    res.redirect('/')
})

// Logout routing
router.get('/logout', ggLoginController.logout)

module.exports = router

