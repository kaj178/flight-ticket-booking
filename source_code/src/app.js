const express = require('express')
const flash = require('connect-flash')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const path = require('path')
const handlebars = require('express-handlebars')
const dotenv = require('dotenv')
const session = require('express-session')
const passport = require('passport')
const bodyParser = require('body-parser')

const route = require('./routes')
//const ggRoutes = require('./routes/ggLoginRoutes')

const port = 3000
const app = express()

dotenv.config()

// Thiết lập đường dẫn đến các file tĩnh
app.use(express.static(path.join(__dirname, 'public')))
console.log(path.join(__dirname, 'public'))

// Tạo middleware thiết lập lại đuôi extension của 'handlebars' -> 'hbs' dùng hàm create()
app.engine(
  'hbs',
  handlebars.create({
    defaultLayout: 'main',
    extname: '.hbs',
  }).engine
)
app.set('view engine', 'hbs')

// Thiết lập đường dẫn đến templates
app.set('views', path.join(__dirname, 'resources/views'))

//middlewares
app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(flash())
app.use(bodyParser.urlencoded({ extended: true }))

app.use(session({
  name: 'user-session',
  secret: process.env.SESSION_SECRET || 'flightticketbooking',
  resave: true,
  saveUninitialized: true,
}))

app.use(passport.initialize())
app.use(passport.session())


// Route init
route(app)

// Bắt lỗi 404
// app.use((req, res) => {
//   res.type('text/plain')
//   res.status(404)
//   res.redirect('/404')
// })

// // Bắt lỗi 500
// app.use((err, req, res, next) => {
//   res.type('text/plain')
//   res.status(500)
//   res.redirect('/500')
// })


// Lắng nghe cổng server
app.listen(port, () => console.log(
    `Server is running at http://localhost:${port} \n` +
    'Press Ctrl + C tp cancel.'
))
