const express = require('express');
const productRoute = express.Router();
const {Product} = require('../model/product');
const auth = require('../middleware/auth');

productRoute.get('/api/product',auth, async(req, res) => {
    try {
       let product = await Product.find({category: req.query.category})
       res.json(product);
    }catch(e) {
      res.status(500).json({error: e.message});
    }
});

productRoute.get('/api/product/query/:key', auth, async(req, res) => {
  try {
      let product = await Product.find({
         "$or": [    
         {title: {$regex: req.params.key}},
         {description: {$regex: req.params.key}},
         {category: {$regex: req.params.key}} 
         ]
      })
      res.json(product);
      
  }catch(e) {
     res.status(500).json({error: e.message});
  }
});

productRoute.post('/add/product/rating',auth, async (req, res) => {
   try{
     const {id, rating} = req.body;
     let product = await Product.findById(id);
     for(let i = 0; i<product.rating.length; i++) {
      if(product.rating[i].userId == req.user) {
         product.rating.splice(i,1);
         break;
      }
     }
     const ratingSchema = {
         userId: req.user,
         rating,
     }
     product.rating.push(ratingSchema);
     product = await product.save();
     res.json(product);
   }catch(e) {
    res.status(500).json({error: e.message});
   }
});


module.exports = productRoute;

