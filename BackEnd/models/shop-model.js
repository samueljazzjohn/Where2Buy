const mongoose = require('mongoose')
// var UserModel=require('./user-model')


const ShopSchema = new mongoose.Schema({
    _usersId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UserSchema'
    },
    Phone: { type: String, required:true},
    loc: {
        type: { type: String },
        coordinates: [Number],
        required:true
    },
    products:[String],
    shopImg:String
},{collection:shops}
)

ShopSchema.index({ "loc": "2dsphere" });

model.exports = mongoose.model( 'ShopSchema',ShopSchema )