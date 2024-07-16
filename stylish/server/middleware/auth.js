const jwt = require("jsonwebtoken");
const  auth = async (req,res,next) => {
   
    try{
      const token = req.header("x-auth-token");
      if(!token)
        return res.status(401).json({msg:'no auth token, access denied'}); 
      const verified = jwt.verify(token, "passwordkey"); //if jwt is verified
      if (!verified) 
        return res.status(401).json({msg:'Token verification failed, access denied'});
        req.user =  verified.id;
        req.token = token;
        next();
    }catch(e) {
       res.status(500).json({msg: e.message});
    }
}

module.exports = auth;