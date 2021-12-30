var express = require('express');
var router = express.Router();
var UserModel = require('../models/user-model')
var ProductModel = require('../models/product-model')
const multer = require('multer')
const path = require('path')
const uploadHelper = require('../Helpers/upload-helper')


const upload = multer({
  storage: uploadHelper.storage,
  limits: {
    fileSize: 1024 * 1024 * 6,
  },
  fileFilter: uploadHelper.imageFilter
})

/* GET home page. */
router.get('/', function (req, res, next) {
  res.send('Hello Express');
});

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

router.post('addProduct/', async function (req, res, next) {
  console.log(req.body);
  await ProductModel.create(req.body).then(() => {
    console.log('product added Successfully')
    res.status(200).json({ "msg": "Success" })
  }).catch((err) => {
    console.log('Error occured' + err)
    res.status(403).json({ "msg": "error" })
  })
});

router.post('/addprofileimage', upload.single('image'), async (req, res, next) => {
  console.log(req.file)
  if (req.fileValidationError) {
    return res.send(req.fileValidationError)
  } else {
    return res.status(200).send({ msg: "success" })
  }
});




module.exports = router;
