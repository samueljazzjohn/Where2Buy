var express = require('express');
var router = express.Router();
var UserModel = require('../models/user-model')
var CustomerModel = require('../models/customer-model')
var ShopModel = require('../models/shop-model')
var userHelper = require('../Helpers/user-helper')
const multer = require('multer')
const path = require('path')
const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')
const middleware = require('../middleware')
const uploadHelper = require('../Helpers/upload-helper');
const shopHelper = require('../Helpers/shop-helper')
const ProductModel = require('../models/product-model');
const productHelper = require('../Helpers/product-helper');
const shopModel = require('../models/shop-model');
// const { ObjectId } = require('mongodb');
const mongoose = require('mongoose');
const { ifError } = require('assert');


dotenv.config()


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    console.log('________', file)
    console.log('_________', file.fieldname);
    // if(file.fieldname['type']=='profile'){
    //   cb(null, 'uploads/profiles')
    // }else{
    //   cb(null, 'uploads/products')
    // }
    cb(null, 'uploads/')
  },
  filename: (req, file, cb) => {
    console.log(req.body)
    console.log(req.file)
    cb(null, file.fieldname + '-' + Date.now() + '.jpg')
  }
})


const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 6,
  },
  fileFilter: uploadHelper.imageFilter
})


// Getting the store profile data
router.get('/profiledata', middleware.athenticateToken, async (req, res) => {
  console.log("inside", req.user)

  const data = await ShopModel.findOne({ user: mongoose.Types.ObjectId(req.user.userId) })
    .select('phone place shopImg').exec()

  if (data == null) {
    return res.status(401).json({
      message: "no data found"
    })
  }
  return res.status(200).json({
    'phone': data.phone,
    'place': data.place,
    // 'shopImg':data.shopImg
  })
})

// Update shopimage
router.patch('/upload/image', middleware.athenticateToken, upload.single(''), async (req, res, next) => {
  console.log(req.file)
  console.log(req.user.mail)
  var userId = userHelper.getUserId(req.user.mail)
  console.log(userId)
  if (req.fileValidationError) {
    return res.send(req.fileValidationError)
  } else {
    let doc = await ShopModel.findOneAndUpdate({ user: mongoose.Types.ObjectId(userId) }, { shopImg: req.file.path }).exec()
    await doc.save((err) => {
      return res.status(502).json({
        error: err
      });
    })
    return res.status(200).json({
      message: 'success'
    })
  }
});




// Updating profile data

// router.post('/profileupdate', async function (req, res, next) {
//   console.log(req.body)
//   await userHelper.getUserId(req.body.mail).then((userId) => {
//     console.log(userId)
//     var data = UserModel.findOne({user:UserId});
//       if (!userId) {
//       return res.status(404).json({
//         message: "user not found"
//       });
//     }
//     let doc=await ShopModel.findOneAndUpdate({user:userId},{
//       "$set":{
//         "phone":req.body.phone,
//         "place":req.body.place,
//         "category":req.body.category,
//       }
//     })
// await doc.save((err)=>{
//   return res.status(502).json({
//     error: err
//   });

//   }).catch(err => {
//     console.log(err);
//     res.status(501).json({
//       error: "Error occured"
//     });
//   });
// });


// Adding profile data
router.post('/profileadd', middleware.athenticateToken, async function (req, res, next) {
  console.log(req.body)
  // await userHelper.getUserId(req.user.mail).then((userId) => {
  console.log(req.user.userId)
  var data = await ShopModel.findOne({ user: mongoose.Types.ObjectId(req.user.userId) }).exec()
  if (data != null) {
    return res.status(402).json({
      message: "Data already added"
    })
    // res.redirect(url.format({
    //   pathname:"/profileupdate",
    //   query:req.body,
    // }));
  }
  const shop = new ShopModel({
    phone: req.body.phone,
    place: req.body.place,  
    category: req.body.category,
    // location: {
    //     'type': 'Point',
    //     'coordinates': []
    //   },
    user: req.user.userId,
    shopImg: ""
  })
  return shop.save((err) => {
    if (err) return res.status(503).json({
      error: err.message
    });
    return res.status(200).json({
      message: "success"
    })
  })
  // }).catch(err => {
  //   console.log(err);
  //   res.status(501).json({
  //     error: "Error occured"
  //   });
  // });

  // UserModel.updateOne({_id:UserId},{})

});

// getting shop shop image and 
// supermarket
router.get('/supermarket/details',middleware.athenticateToken, async function(req,res,next){
  var shopId= await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  var supermarket =await shopHelper.getSupermarket()
  if(!supermarket){
    return res.status(400).json({
      error:'no data found'
    })
  }
  return res.status(200).json({
    data:supermarket,
  })
})

// Grocery
router.get('/grocery/details',middleware.athenticateToken, async function(req,res,next){
  var shopId= await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  var grocery = await shopHelper.getGrocery()
  if(!supermarket){
    return res.status(400).json({
      error:'no data found'
    })
  }
  return res.status(200).json({
    data:grocery,
  })
})

// electric
router.get('/electric/details',middleware.athenticateToken, async function(req,res,next){
  var shopId= await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  var electric = await shopHelper.getElectric()
  if(!grocery){
    return res.status(400).json({
      error:'no data found'
    })
  }
  return res.status(200).json({
    data:electric,
  })
})

// others
router.get('/others/details',middleware.athenticateToken, async function(req,res,next){
  var shopId= await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  var others = await shopHelper.getOthers()
  if(!electric){
    return res.status(400).json({
      error:'no data found'
    })
  }
  return res.status(200).json({
    data:others,
  })
})



// Add product details
router.post('/product/add', middleware.athenticateToken, async function (req, res, next) {
  // userHelper.getUserId(req.user.mail).then((userId) => {
  console.log(".......", req.user.userId)
  const shopId = await productHelper.getShopId(req.user.userId)
  if (!shopId || shopId == null) {
    res.status(401).json({
      message: "Shop id retrieval error"
    })
  }
  const product = new ProductModel({
    pname: req.body.pname,
    price: req.body.price,
    qty: req.body.qty,
    Image: " ",
    store: shopId
  })
  return product.save((err) => {
    if (err) throw err;
    console.log('Product details added')
    res.status(200).json({
      message: "product added successfully"
    })
  })
})

// product image update

router.patch('/product/image/update', middleware.athenticateToken, upload.single('imagefile'), async (req, res, next) => {
  console.log(req.file)
  console.log(req.user.mail)
  var userId = await userHelper.getUserId(req.user.mail)
  console.log('userid______', userId)
  var shopId = await productHelper.getShopId(userId)
  console.log('shopid_____', shopId._id)
  if (req.fileValidationError) {
    return res.status(401).json({
      err: req.fileValidationError
    })
  } else {
    let doc = await ProductModel.findOneAndUpdate({ store: shopId._id }, { Image: req.file.path }).exec()
    await doc.save((err) => {
      if (err) return res.status(502).json({
        error: err
      });
      return res.status(200).json({
        message: 'success'
      })
    })
  }
});


// update Product
router.patch('/product/update', middleware.athenticateToken, async (req, res, next) => {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      ProductModel.findOneAndUpdate({ store: shopId, pname: req.body.oldname }, { pname: req.body.pname, price: req.body.price, qty: req.body.qty }).exec()
        .then((doc) => {
          console.log(doc)
          if (doc == null) {
            return res.status(403).json({ "Message": "Update error" })
          }
          res.status(200).json({ "Message": "Success" })
        })
    })
  })
})

// Delete Product
router.delete('/product/delete', middleware.athenticateToken, async (req, res, next) => {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      ProductModel.remove({ store: shopId, pname: req.body.pname }, (err) => {
        if (!err) return res.status(200).json({ "Messsage": "Deleted successfully" });
        res.status(400).json({ "Message": err })
      })
    })
  })

})

// Getting product Details
router.get('/product/get', middleware.athenticateToken, async (req, res, next) => {
  // userHelper.getUserId(req.body.mail).then((userId) => {
  console.log(req.user)
  var shopId = await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  console.log('___', shopId)
  const doc = await ProductModel.find({ store: shopId }).select('-_id pname qty price Image').exec()
  console.log(doc)
  if (!doc || doc == null) {
    return res.status(403).json({ "Message": "error" })
  }
  return res.status(200).json({
    "data": doc
  })
})

//  getting search result

router.post('/search/details', middleware.athenticateToken, async function(req,res,next){
  console.log(req.body)
  var shopId= await productHelper.getShopId(mongoose.Types.ObjectId(req.user.userId))
  var data= await ProductModel.
  find({pname:req.body.searchItem},'store -_id')
  .populate({path:'store',select:'user -_id',populate:{path:'user shopImg',select:'username -_id'}})
  // .populate({path:'store.user',select:'store.username -_id'})
  .exec()
  console.log(data)
  if(data){
    return res.status(200).json({
      data:data
    })
  }
  return res.status(402).json({
    error:err
  })
})



module.exports = router;
