const productModel = require('../models/product-model')
const ShopModel = require('../models/shop-model')
var express = require('express');
var userHelper = require('./user-helper')


module.exports = {

    getSupermarket : async () =>{
        var supermarket =await ShopModel.find({category:'Super Market'},'shopImg shopImg category phone place').populate({path:'user',select:'username -_id'}).exec()
        console.log(supermarket)
        return supermarket;
    },
    getGrocery : async () =>{
        var grocery =await ShopModel.find({category:'Grocery Shop'},'shopImg shopImg category phone place').populate({path:'user',select:'username -_id'}).exec()
        console.log(grocery)
        return grocery;
    },
    getElectric : async () =>{
        var electric =await ShopModel.find({category:'Electronic Shop'},'shopImg shopImg category phone place').populate({path:'user',select:'username -_id'}).exec()
        console.log(electric)
        return electric;
    },
    getOthers : async () =>{
        var others =await ShopModel.find({category:'others'},'shopImg shopImg category phone place').populate({path:'user',select:'username -_id'}).exec()
        console.log(others)
        return others;
    }
}