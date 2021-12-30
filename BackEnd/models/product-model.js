const mongoose = require('mongoose')

const ProductSchema = new mongoose.Schema({
    _sid:{type:mongoose.Schema.Types.ObjectId,ref:'ShopModel'},
    pname:{type:String,required:true},
    qty:{type:Number,required:true},
    price:{type:Number,required:true},
    Image:{type:Buffer,required:true},
})

model.exports = mongoose.model('ProductSchema',ProductSchema)