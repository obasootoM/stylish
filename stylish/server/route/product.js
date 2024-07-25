const express = require('express');
const productRoute = express.Router();
const Product = require('../model/product');
const auth = require('../middleware/auth');

productRoute.get('/api/product',auth, async(req, res) => {
    try {
       let product = await Product.find({category: req.query.category})
       res.json(product);
    }catch(e) {
      res.status(500).json({error: e.message});
    }
});

productRoute.get('/api/product/query/:title', auth, async(req, res) => {
  try {
      let product = await Product.find({
         title: {$regex: req.params.title, $options: 'i'}
      })
      res.json(product);
      
  }catch(e) {
     res.status(500).json({error: e.message});
  }
})
module.exports = productRoute;

