const express = require('express');
const adminRoute = express.Router();
const {Product} = require('../model/product');
const admin = require('../middleware/admin')



adminRoute.post('/api/product', admin, async(req, res) => {
    try{
      const {title, description, price, category, quantity, images} = req.body;
      let product = new Product({
        title,
        description,
        price,
        category,
        quantity,
        images
      });
      product = await product.save();
      res.json(product)
    }catch(e) {
        res.status(500).json({error: e.message});
    }
})
adminRoute.get('/api/get-product', admin, async(req,res) => {
    try{
      let product = await Product.find({});
      res.json(product);
    }catch(e){
     res.status(500).json({error: e.message});
    }
});
adminRoute.delete('/api/delete-product',admin, async(req,res) => {
    try{
        const {id} = req.body;
        const deleteById = await Product.findByIdAndDelete(id);
        res.json(deleteById);
    }catch(e){
     res.status(500).json({error: e.message});
    }
})

module.exports = adminRoute;