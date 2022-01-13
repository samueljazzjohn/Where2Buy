var mongoose = require('mongoose');

var url = 'mongodb+srv://jazzjohn:Jazz2%401999@where2buy.qgezx.mongodb.net/myFirstDatabase?retryWrites=true&w=majority'

mongoose.connect(url,{ useNewUrlParser: true, useUnifiedTopology: true },(err,db)=>{
    if(err) throw err;
    var database = mongoose.connection;
    console.log('Database Created Successfully')
})