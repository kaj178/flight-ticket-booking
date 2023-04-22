const express = require('express')
const app = express()
// const bodyParser = require('body-parser')

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

module.exports.order = (req, res) => {
    res.render('ticket_order', { title: 'Đặt vé' })
}

module.exports.submit = (req, res) => {
    let firstName = req.body.firstName
    let lastName = req.body.lastName
    let phoneNumber = req.body.phoneNumber
    let email = req.body.email

    res.render('ticket-view', {
        title: 'Vé',
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email
    })
}
