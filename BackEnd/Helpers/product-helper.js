const productModel = require('../models/product-model')
const ShopModel = require('../models/shop-model')
var express = require('express');
var userHelper = require('./user-helper')



module.exports = {
    
    getShopId : async (userId)=>{
        const shopId = await ShopModel.findOne({user:userId}).select('_id').exec()
        return shopId
    },

}