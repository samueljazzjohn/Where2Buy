const mongoose = require('mongoose')
// var UserModel=require('./user-model')


const ShopSchema = new mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UserModel'
    },
    phone: { type: String, required: true },
    place: { type: String, required: true },
    category: { type:String, required: true },
    location: {
        type: {
            type: String,
            enum: ['Point'],
            default : 'point'
            // required: true
        },
        coordinates: {
            type: [Number],
            default: []
            // required: true
        }
    },
    shopImg: String
}, { collection: 'shops' }
)

ShopSchema.index({ location : "2dsphere" });

module.exports = mongoose.model('ShopModel', ShopSchema)