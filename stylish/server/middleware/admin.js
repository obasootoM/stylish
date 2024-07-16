const jwt = require('jsonwebtoken');
const User = require('../model/user');

const admin = async (req,res, next) => {
    try {
    const token = req.header('x-auth-token');
    if(!token)
    res.status(400).json({msg: 'access denied token!'});
    const verified = jwt.verify(token, 'passwordkey');
    if(!verified)
    res.status(400).json({msg: 'token not verified, access denied'});
    const user =  User.findById(verified.id);
    if((user.type == 'user') || (user.type == 'admin'))
    res.status(400).json({msg: 'you are not an admin'});
    req.user = verified.id;
    req.token = token;
    next();
    }catch(e) {
     res.status(500).json({msg: e.message});
    }
}
module.exports = admin;