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
const ProductModel = require('../models/product-model');
const productHelper = require('../Helpers/product-helper');


dotenv.config()


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
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


//  Getting shop details
router.get('/', middleware.athenticateToken, async (req, res, next) => {
  console.log(req.user)
  ShopModel.find({})
    .select("location place category phone _id")
    .populate('user')
    .exec()
    .then(data => {
      if (!data) {
        return res.status(404).json({
          message: "Order not found"
        });
      } else {
        res.status(200).json({
          data: data
        })
      }
    }).catch((err) => {
      console.log(err)
    })
})

// Getting the store profile data
router.get('/profiledata',  async (req, res, next) => {
  console.log(req.user)
  var UserId;
  userHelper.getUserId(req.body.mail).then((userId)=>{
    UserId=userId;
    if(UserId==null){
      return res.status(403).json({
        message:"no data found"
      })
    }
    if(!userId){
      return res.status(404).json({
        message: "Product not found"
      });
    }
    ShopModel.findOne({user:UserId},(data)=>{
      return res.status(200).json({
        phone:data.phone,
        place:data.place,
        shopImg:data.shopImg
      })
    }).catch(err => {
      console.log(err);
      res.status(500).json({
        message: err.Message
      });
    });
  });
})

// Update shopimage
router.patch('/upload/image', upload.single('imagefile'), async (req, res, next) => {
  console.log(req.file)
  console.log(req.body.mail)
  if (req.fileValidationError) {
    return res.send(req.fileValidationError)
  } else {
    ShopModel.updateOne({})
  }
});




// Updating
router.post('/profileupdate', middleware.athenticateToken, async function (req, res, next) {
  console.log(req.user)
  await userHelper.getUserId(req.body.mail).then((userId) => {
    console.log(userId)
    if (!userId) {
      return res.status(404).json({
        message: "Product not found"
      });
    }
    const shop = new ShopModel({
      phone: req.body.phone,
      place:req.body.place,
      category:req.body.category,
      location: req.body.location,
      user: userId
    })
    return shop.save((err) => {
      if (err) throw err;
    })
  }).catch(err => {
    console.log(err);
    res.status(500).json({
      error: err
    });
  });
  
  // UserModel.updateOne({_id:UserId},{})

});



// Add product details
router.post('/product/add', middleware.athenticateToken, async function (req, res, next) {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      const product = new ProductModel({
        pname: req.body.pname,
        price: req.body.price,
        qty: req.body.qty,
        store: shopId
      })
      return product.save((err) => {
        if (err) throw err;
        console.log('Product details added')
      })
    }).catch(err => {
      console.log(err);
      res.status(500).json({
        error: err
      });
    });
  }).catch(err => {
    console.log(err);
    res.status(500).json({
      error: err
    });
  });
});


// update Product
router.patch('/product/update', async (req, res, next) => {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      ProductModel.findOneAndUpdate({ store: shopId, pname: req.body.oldname }, { pname: req.body.pname, price: req.body.price, qty: req.body.qty }).exec()
        .then((doc) => {
          console.log(doc)
          if(doc==null){
            return res.status(403).json({"Message":"Update error"})
          }
          res.status(200).json({"Message":"Success"})
        })
    })
  })
})

// Delete Product
router.delete('/product/delete', async (req, res, next) => {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      ProductModel.remove({store:shopId,pname:req.body.pname},(err)=>{
        if(!err) return res.status(200).json({"Messsage":"Deleted successfully"});
        res.status(400).json({"Message":err})
      })
    })
  })

})

// Getting product Details
router.get('/product/get', async (req, res, next) => {
  userHelper.getUserId(req.body.mail).then((userId) => {
    productHelper.getShopId(userId).then((shopId) => {
      ProductModel.find({store:shopId}).exec()
        .then((doc) => {
          console.log(doc)
          if(doc==null){
            return res.status(403).json({"Message":"error"})
          }
          res.status(200).json({
            "data":doc,
            "Message":"Success"
          })
        })
    })
  })
})



module.exports = router;
