var express = require('express');
var router = express.Router();
var UserModel=require('../models/user-model')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send('Hello Express');
});

router.post('signup/', async function(req, res, next) {
  console.log(req.body);
  await UserModel.create(req.body)
});

router.post('addProduct/', async function(req, res, next) {
  console.log(req.body);
  await UserModel.create(req.body)
});




module.exports = router;
