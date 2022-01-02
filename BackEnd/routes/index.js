var express = require('express');
var router = express.Router();
var UserModel = require('../models/user-model')
var ProductModel = require('../models/product-model')
var ShopModel = require('../models/shop-model')
var CustomerModel = require('../models/customer-model')
const multer = require('multer')
const path = require('path')
const uploadHelper = require('../Helpers/upload-helper');
const userHelper = require('../Helpers/user-helper')
const productHelper = require('../Helpers/product-helper')
const { request } = require('http');
const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')
const middleware = require('../middleware')

dotenv.config()

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/')
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

/* GET home page. */
router.get('/', function (req, res, next) {
  res.send('Hello Express');
});


router.post('/login',(req,res,next)=>{
  UserModel.findOne({username:req.body.username},(err,doc)=>{
    if (err) return res.status(500).json({"msg":err});
    if(doc==null){
      return res.status(403).json('username Incorrect');
    }
    if(doc.password==req.body.password){
      let token = jwt.sign({username:req.body.username},process.env.JWT_SECRET_KEY,{
        expiresIn:"24h"
      });
      return res.json({
        token:token,
        msg:"Success"
      })
    }
    return res.status(403).json('password incorrect')
    
  })
})


//  Adding the users details
router.post('/signup', async function (req, res, next) {
  console.log(req.body);
  await UserModel.create(req.body).then(() => {
    console.log('Signup Successfully')
    res.status(200).json({ "msg": "Success" })
  }).catch((err) => {
    console.log('Error occured' + err)
    res.status(403).json({ "msg": "error" })
  })
});



// uploading image 
router.post('/upload/image', upload.single('imagefile'), async (req, res, next) => {
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


module.exports = router;
