const PORT = 3000;
const express = require('express');
const app = express();
const mongoose = require('mongoose');
const authRoute =require('./route/auth');
const adminRoute = require('./route/admin');
const productRoute = require('./route/product');
const userRoute = require('./route/user');
const DB = 'mongodb+srv://onyearugbulem7:obasooto@stylish.ixfabhq.mongodb.net/?retryWrites=true&w=majority&appName=stylish';
app.use(express.json());
app.use(authRoute);
app.use(adminRoute);
app.use(productRoute);
// app.use(userRoute);

mongoose
.connect(DB)
.then(() => {
console.log('connection successful')
}).catch((e) => {
  console.log(e)
});
app.listen(PORT,'0.0.0.0', () => {
 console.log(`connected at ${PORT}`)
} );
