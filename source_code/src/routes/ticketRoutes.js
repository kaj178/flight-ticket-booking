const express = require('express')
const route = express.Router()
const Ticket = require('../app/controllers/TicketController')

route.get('/order', Ticket.order)

route.post('/submit', Ticket.submit)

module.exports = route
