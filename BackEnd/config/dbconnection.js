var mongoose = require('mongoose');

var url = 'mongodb://127.0.0.1:27017/Where2Buy'

mongoose.connect(url,(err,db)=>{
    if(err) throw err;
    var database = mongoose.connection;
    console.log('Database Created Successfully')
})