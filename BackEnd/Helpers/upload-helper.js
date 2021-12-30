const multer = require('multer')
const path = require('path')


exports.imageFilter = (req,file,cb)=>{
    if(file.mimetype=="image/jpeg" || file.mimetype == "image/png"){
        cb(null,true)
    }else{
        cb(null,false)
    }
  }

