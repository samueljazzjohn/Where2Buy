const ShopModel = require('../models/shop-model')


module.exports = {
    
    getShopId : async (userId)=>{
        const shopId = await ShopModel.findOne({user:userId}).select('_id').exec()
        return shopId
    }
}