const express = require('express')
const router = express.Router()
const registerValidator = require('../app/middlewares/RegisterValidator')
const loginValidator = require('../app/middlewares/LoginValidator')
const accountController = require("../app/controllers/AccountController")

router.get('/login', accountController.showLoginForm)
router.post('/login', loginValidator, accountController.login)
router.get('/register', accountController.showRegisterForm)
router.post('/register', registerValidator, accountController.register)

module.exports = router