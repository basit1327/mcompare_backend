'use strict';

const
	express = require('express'),
	accountService = require('../../services/account'),
	marketService = require('../../services/market'),
	productService = require('../../services/products');

let router = express.Router();

router.get('/market', marketService.getMarket);
router.get('/home_page', productService.getHomePageItems);
router.get('/search_product', productService.searchProducts);
router.get('/add_to_cart', productService.addProductToCart);
router.post('/login', accountService.login);
router.post('/register_account', accountService.register);

module.exports = router;
