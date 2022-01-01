const mongoose = require('mongoose')

const customerSchema = mongoose.Schema({
    user = {type:mongoose.Schema.Types.ObjectId,ref:'UserModel'},
    cimage = String,
},{collection:'customers'}
)

module.exports = mongoose.model('CustomerModel',customerSchema)