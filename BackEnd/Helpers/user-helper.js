const UserModel = require('../models/user-model')

module.exports = {
    
    getUserId : async(mail)=>{
        const userId = await UserModel.findOne({email:mail}).select("_id").exec()
        return userId._id
    }

} 