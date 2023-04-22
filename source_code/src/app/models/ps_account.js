const db = require('../database/connection')
class Account {

    constructor(acId, email, password) {
        this.acId = acId
        this.email = email
        this.password = password
    } 

}

module.exports = Account