const express = require('express');
const { Product} = require('../model/product');
const userRoute = express.Router();
const User  = require('../model/user')
const auth = require('../middleware/auth');

userRoute.post('/api/add-cart',auth, async (req, res) => {
  try{
    const {id} = req.body;
    const product = await Product.findById(id);
    const user = await User.findById(req.user);
    if (user.cart.length == 0) {
      user.cart.push({product,quantity: 1})
    }else {
      let isProduct = false;
      for (let i = 0; i < user.cart.length; i++) {
        if(user.cart[i].product._id.equals(product.id)) {
          isProduct = true;
        }
      }
      if(isProduct) {
        let products = user.cart.find((productx) => productx.product._id.equals(product.id))
        products += 1;
      }else{
        user.cart.push({product, quantity:1})
      }
    }
    user = await user.save();
    res.json(user)
  }catch(e) {
    res.status(500).json({error:e.message});
  }
});

userRoute.delete('/api/cart-delete/:id',auth, async(req,res) => {
  try{
    const {id} = req.params;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    for(let i = 0; i < user.cart.length; i++) {
      if(user.cart[i].product._id.equals(product.id)) {
        if(user.cart[i].product == 1) {
          user.cart.splice(i,1)
        }else{
          user.cart[i].quantity -= 1;
        }
      }
    }
  user = await user.save();
  res.json(user);
  }catch(e) {
    res.status(500).json({error: e.message});
  }

})
module.exports = userRoute;
