const mongoose = require('mongoose')

const customerSchema = mongoose.Schema({
    cuser:{type:mongoose.Schema.Types.ObjectId,ref:'UserModel'},
    cimage : String,
},{collection:'customers'}
)

module.exports = mongoose.model('CustomerModel',customerSchema)