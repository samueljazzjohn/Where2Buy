const jwt = require('jsonwebtoken');

let authenticateToken = (req, res, next) => {
    let token = req.headers['Authorization']
    console.log(token)
    token = token.split(7,token.length)

    if (token == null) return res.sendStatus(401)
    if(token){
        jwt.verify(token, process.env.TOKEN_SECRET, (err,user) => {
            console.log(err)
    
            if (err) {
                console.log(err)
                return res.sendStatus(403)
            } 
            console.log(user)
            req.user = user
        })
    }
    next()
}

module.exports = {'athenticateToken':authenticateToken}