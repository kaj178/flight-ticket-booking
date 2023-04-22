const express = require('express')
const router = express.Router()

const siteController = require('../app/controllers/SiteController')

router.get('/404', siteController.page404)
router.get('/500', siteController.page500)

router.get('/', siteController.index)
router.get('/login', siteController.login)
router.get('/register', siteController.register)
router.get('/contact', siteController.contact)


module.exports = router