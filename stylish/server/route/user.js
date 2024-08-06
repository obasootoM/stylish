const express = require('express');
const {product} = require('../model/product');
const userRoute = express.Router();
const auth = require('../middleware/auth');

userRoute.post('/api/product',auth, async (req, res) => {
  try{
    const {id} = req.body;
  }catch(e) {

  }
});
module.exports = userRoute;
