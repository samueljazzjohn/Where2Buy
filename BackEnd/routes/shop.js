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
const shopModel = require('../models/shop-model');
// const { ObjectId } = require('mongodb');
const mongoose = require('mongoose');


dotenv.config()


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    console.log(reg.file)
    if(req.file.fieldname['type']=='profile'){
      cb(null, 'uploads/profiles')
    }else{
      cb(null, 'uploads/products')
    }
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
router.get('/profiledata', middleware.athenticateToken,  async (req, res) => {
  console.log("inside",req.user)

  const data=await ShopModel.findOne({user:mongoose.Types.ObjectId(req.user.userId)})
  .select('phone place shopImg').exec()

  if(data==null){
    return res.status(401).json({
      message:"no data found"
    })
  }
    return res.status(200).json({
      'phone':data.phone,
      'place':data.place,
      // 'shopImg':data.shopImg
    }) 
})

// Update shopimage
router.patch('/upload/image', upload.single('imagefile'), async (req, res, next) => {
  console.log(req.file)
  console.log(req.body.mail)
  var userId=userHelper.getUserId(req.file.fields['mail'])
  if (req.fileValidationError) {
    return res.send(req.fileValidationError)
  } else {
    let doc = await ShopModel.findOneAndUpdate({user:userId},{shopImg:req.file.path})
    await doc.save((err)=>{
      return res.status(502).json({
        error: err
      });
  })
  return res.status(200).json({
    message:'success'
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
router.post('/profileadd', async function (req, res, next) {
  console.log(req.body)
  await userHelper.getUserId(req.body.mail).then((userId) => {
    console.log(userId)
    var data = ShopModel.findOne({user:UserId});
    if(data){
      return res.status(402).json({
        message:"Data already added"
      })
      // res.redirect(url.format({
      //   pathname:"/profileupdate",
      //   query:req.body,
      // }));
    }
    else{
      if (!userId) {
      return res.status(404).json({
        message: "user not found"
      });
    }
    const shop = new ShopModel({
      phone: req.body.phone,
      place:req.body.place,
      category:req.body.category,
      // location: {
      //     'type': 'Point',
      //     'coordinates': []
      //   },
      user: userId
    })
    return shop.save((err) => {
      if (err) res.status(502).json({
        error: err
      });
    })
  }
  }).catch(err => {
    console.log(err);
    res.status(501).json({
      error: "Error occured"
    });
  });
  
  // UserModel.updateOne({_id:UserId},{})

});



// Add product details
router.post('/product/add', middleware.athenticateToken, async function (req, res, next) {
  userHelper.getUserId(req.user.mail).then((userId) => {
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
