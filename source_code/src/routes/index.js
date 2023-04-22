const siteRouter = require('./site')
const accountRouter = require('./account')
const ggLoginRouter = require('./ggLoginRoutes')
const ticketRouter = require('./ticketRoutes')

function route(app)
{   
    app.use('/', siteRouter)
    app.use('/account', accountRouter)
    app.use('/auth', ggLoginRouter)
    app.use('/form', ticketRouter)

    // Bắt lỗi 404
    app.use((req, res) => {
        res.type('text/plain')
        res.status(404)
        res.redirect('/404')
    })

    // Bắt lỗi 500
    app.use((err, req, res, next) => {
        res.type('text/plain')
        res.status(500)
        res.redirect('/500')
    })
}

module.exports = route