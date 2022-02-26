var express = require('express');
var router = express.Router();
var CustomerModel = require('../models/customer-model')
var userHelper = require('../Helpers/user-helper')
var productHelper = require('../Helpers/product-helper')
var ProductModel = require('../models/product-model')
const multer = require('multer')
const path = require('path')
const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')
const middleware = require('../middleware')
const uploadHelper = require('../Helpers/upload-helper');
const mongoose = require('mongoose')


dotenv.config()


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/profiles')
  },
  filename: (req, file, cb) => {
    console.log(req.body)
    console.log(req.file)
    cb(null, file.fieldname + '-'+ Date.now()+'.jpg')
  }
})


const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 6,
  },
  fileFilter: uploadHelper.imageFilter
})


// getting customer details
router.get('/details',middleware.athenticateToken,async(req,res,next)=>{
    await userHelper.getUserId(req.body.mail).then((userId)=>{
        CustomerModel.findOne({cuser:userId}).
        populate()
        .exec()
        .then((data)=>{
          console.log(data)
          if(!data){
            return res.status(403).json({
              "message":"customer not found"
            })
          }
          console.log(data.cuser)
          return res.status(200).json({
            data:data
          })
        }).catch((err)=>{
          return res.status(400).json({
            "message":err
          })
        })
    })
})



// uploading customer image 
router.post('/upload/image',middleware.athenticateToken, upload.single('imagefile'), async (req, res, next) => {
    console.log(req.file)
    console.log(req.body.mail)
    if (req.fileValidationError) {
      return res.send(req.fileValidationError)
    } else {
      await userHelper.getUserId(req.body.mail).then((userId)=>{
        const customer=new CustomerModel({
          cuser:userId,
          cimage:req.file.path
        });
        customer.save().catch((err)=>{res.status(401).json({"msg":"database save"+err})})
        return res.status(200).json({ "msg": "success" })
      }).catch((err)=>{
        return res.status(403).json({"msg":"invalid user"+err})
      })
    }
  });

  //  Getting product details

  router.post('/product/get', middleware.athenticateToken, async (req, res, next) => {
    // userHelper.getUserId(req.body.mail).then((userId) => {
    console.log(req.body)
    const doc = await ProductModel.find({ store: mongoose.Types.ObjectId(req.body.id) }).select('pname qty price Image').exec()
    console.log(doc)
    if (!doc || doc == null) {
      return res.status(403).json({ "Message": "error" })
    }
    return res.status(200).json({
      "data": doc
    })
  })


  module.exports = router;
