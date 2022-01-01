const mongoose = require('mongoose')

const ProductSchema = new mongoose.Schema({
    store:{type:mongoose.Schema.Types.ObjectId,ref:'ShopModel'},
    pname:{type:String,required:true},
    qty:{type:Number,required:true},
    price:{type:Number,required:true},
    Image:{type:String},
},{collection:'products'}
)

module.exports = mongoose.model('ProductModel',ProductSchema)