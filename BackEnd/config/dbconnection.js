var mongoose = require('mongoose');


var url = process.env.MONGO_URI

mongoose.connect(url,{ useNewUrlParser: true, useUnifiedTopology: true },(err,db)=>{
    if(err) throw err;
    var database = mongoose.connection;
    console.log('Database Created Successfully')
})