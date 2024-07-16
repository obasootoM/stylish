const mongoose = require('mongoose');

const userModel = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true
  },
  email:{
    required: true,
    type: String,
    trim: true,
    validator: {
        validate: (val) => {
            const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return val.match(re);
        },
        messge: 'please do enter a valid email'
        
    }
  },
  password: {
    required: true,
    type: String,
  },
//   confirm_pass: {
//     required: true,
//     type: String,
//     trim: true
//   }
type: {
  type: String,
  default: 'user'
}
})
const User = mongoose.model('User',userModel);
module.exports = User;