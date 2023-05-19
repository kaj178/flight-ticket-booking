const db = require('../database/connection')
class SiteController {

    // [GET] /
    index(req, res) {
        var destinationArray
        const sql = 'SELECT * FROM destination'
        db.query(sql, (error, result, fields) => {
            destinationArray = result
            res.render('home', {
                destination: destinationArray,
                title: 'Trang chủ',
                successMsg: req.flash('success'),
                errorMsg: req.flash('error')
            });
        })
        
    }

    login(req, res) {
        res.render('login', { title: 'Đăng nhập', layout: 'blank' })
    }

    register(req, res) {
        res.render('register', { title: 'Đăng ký', layout: 'blank' })
    }

    contact(req, res) {
        res.render('contacts', { title: 'Liên hệ', layout: 'blank' })
    }

    page404(req, res){
        res.render('404', {title: '404 ERROR', layout: 'blank'})
    }

    page500(req, res){
        res.render('500', {title: 'SERVER ERROR', layout: 'blank'})
    }
}

module.exports = new SiteController()