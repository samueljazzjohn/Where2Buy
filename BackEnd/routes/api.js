var express = require('express');
var router = express.Router();
var UserModel = require('../models/user-model')
var ProductModel = require('../models/product-model')
var ShopModel = require('../models/shop-model')
const multer = require('multer')
const path = require('path')
const uploadHelper = require('../Helpers/upload-helper');
const userHelper = require('../Helpers/user-helper')
const productHelper = require('../Helpers/product-helper')
const { request } = require('http');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/')
  },
  filename: (req, file, cb) => {
    cb(null, 'samuel' + '.jpg')
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


// Add product details
router.post('/addProduct', async function (req, res, next) {
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

// Adding shop details
router.post('/updateshopdetails', async function (req, res, next) {
  await userHelper.getUserId(req.body.mail).then((userId) => {
    console.log(userId)
    if (!userId) {
      return res.status(404).json({
        message: "Product not found"
      });
    }
    const shop = new ShopModel({
      phone: req.body.phone,
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
});

//  Getting shop details
router.get('/shopdetails', async (req, res, next) => {
  ShopModel.find({})
    .select("location phone _id")
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




// uploading profile image 
router.post('/addprofileimage', upload.single('image'), async (req, res, next) => {
  console.log(req.file)
  if (req.fileValidationError) {
    return res.send(req.fileValidationError)
  } else {
    return res.status(200).send({ msg: "success" })
  }
});


module.exports = router;
