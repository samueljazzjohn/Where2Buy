const multer = require('multer')
const path = require('path')


exports.imageFilter = (req,file,cb)=>{
    if(file.mimetype=="image/jpeg" || file.mimetype == "image/png"){
        cb(null,true)
    }else{
        cb(null,false)
    }
  }

exports.storage = multer.diskStorage({
    destination:(req,file,cb)=>{
        cb(null,'uploads/')
    },
    filename:(req,file,cb)=>{
        cb(null,'samuel'+'.jpg')
    }
  })


