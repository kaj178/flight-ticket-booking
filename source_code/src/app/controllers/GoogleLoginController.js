const flash = require('connect-flash')
const passport = require('passport')
const GoogleStrategy = require('passport-google-oauth').OAuth2Strategy


// const passport = require('passport')

// app.use(cookieParser())

// client_id và client secret nằm trong file client_secret_801163277037-sjj2666is5v083iif85ol5ac3be1p0t3.apps.googleusercontent.com.json
const GOOGLE_CLIENT_ID = process.env.GOOGLE_CLIENT_ID || '801163277037-sjj2666is5v083iif85ol5ac3be1p0t3.apps.googleusercontent.com'
const GOOGLE_CLIENET_SECRET = process.env.GOOGLE_CLIENET_SECRET || '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'

passport.use(new GoogleStrategy(
    {
      clientID: GOOGLE_CLIENT_ID,
      clientSecret: GOOGLE_CLIENET_SECRET,
      callbackURL: process.env.GOOGLE_CALLBACK_URL || 'http://localhost:3000/auth/google/callback' // Callback xử lý sau khi đăng nhập gg thành công
    },
    (accessToken, refreshToken, profile, done) => {
        const user = {
            id: profile.id,
            name: profile.displayName,
            email: profile.emails[0].value,
        }
        return done(null, user)
    }
  )
)

passport.serializeUser(function(user, done) {
    done(null, user);
  });
  
passport.deserializeUser(function(user, done) {
    done(null, user);
});


// Kiểm tra xem người dùng đã xác thực hay chưa
function isAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        next()
    } else {
        res.redirect('/')
    }
}

exports.login = passport.authenticate('google', {
    scope: ['profile', 'email'],
})

exports.callback = passport.authenticate('google', {
    // successRedirect: '/',
    failureRedirect: '/500',
})

exports.logout = (req, res) => {
    req.logout(() => {
        res.clearCookie('user-cookie') // Xóa Cookie người dùng
        res.redirect('/')
    })
}