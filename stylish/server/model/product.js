const mongoose = require('mongoose');
const ratingSchema = require('./rating');
const productSchema = mongoose.Schema({
    title: {
       type: String,
       required: true
    },
    description: {
       required: true,
       type: String,
    },
    category: {
        required: true,
        type: String,
        
    },
    // price: {
    //     type: Number,
    //     required: true,
        
        
    // },
    // quantity: {
    //     type: Number,
    //     required: true,
       
        
    // },
    images : [
        {
            type: String,
            required: true
        }
    ],
    rating: [ratingSchema]
})
const Product = mongoose.model('Product', productSchema);
module.exports = { Product, productSchema};