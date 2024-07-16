const express = require("express");
const authRoute = express.Router();
const User = require('../model/user');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth')


authRoute.post('/api/signup', async (req,res) => {
  try {
    const {name, email,password} = req.body;
    const existingUser = await User.findOne({email});
    if(existingUser) {
       return res.status(400).json({msg:"user already exist"});
    }
    const hashPass = await bcrypt.hash(password, 8); 
    let user = new User(
        {
        name,
        email,
        password: hashPass,  
    }
    )
    user = await user.save();
    res.json(user);
  }catch(e) {
    res.status(500).json({error: e.message})
  }
})

authRoute.post("/api/signin", async (req,res) => {
  try{
  const {email,password} = req.body;
  const user = await User.findOne({email})
  if(!user) {
    return res.status(400).json({msg: "user does not exist, please signup"})
  }
  const match = await bcrypt.compare(password, user.password)
  if(!match) {
    return res.status(400).json({msg: "password is not correct"});
  }
  const token = jwt.sign({id: user._id}, "passwordkey");
  res.json({token, ...user._doc});
  }catch(e){
    res.status(500).json({error: e.message});
  }
})

authRoute.post("/tokenIsVerified", async (req, res) => {
   try{
     const token = req.header("x-auth-token")
     if(!token) return res.json(false);
     const verified = jwt.verify(token, "passwordkey")
     if(!verified) return res.json(false);
     const user = await User.findById(verified.id)
     if(!user) return res.json(false)
     res.json(true);
   }catch(e) {
    res.status(500).json({error: e.message});
   }
})
authRoute.get('/',auth, async (req, res) => {
  const user = await User.findById(req.user)
  res.json({token: req.token, ...user});
})
module.exports = authRoute;