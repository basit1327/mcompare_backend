'use strict';
const _ = require('lodash'),
	clc = require('cli-color'),
	{failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccess/dbconnection').DbConnection;

async function getHomePageItems(req,res){
	let promisesArray = [];
	promisesArray.push(new Promise(resolve => {resolve(getNewProducts())}));
	promisesArray.push(new Promise(resolve => {resolve(getBestSellingProducts())}));
	promisesArray.push(new Promise(resolve => {resolve(getRandomProducts(3))}));
	promisesArray.push(new Promise(resolve => {resolve(getRandomProducts(6))}));
	let result = await Promise.all(promisesArray);
	let data = {
		"new":null,
		"best":null,
		"special":null,
		"featured":null
	};
	data.new = result[0] instanceof Error?result[0].message : result[0];
	data.best = result[1] instanceof Error?result[1].message : result[1];
	data.special = result[2] instanceof Error?result[2].message : result[2];
	data.featured = result[3] instanceof Error?result[3].message : result[3];

	res.send({status:200, detail:'Data for application homepage',data})
}

async function getNewProducts (){
	let connection;
	try {
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `SELECT * from products order by added_date desc limit 6`;
			return await connection.query(query);
		} else {
			return new Error(failedToGetDatabaseConnection.description)
		}
	}
	catch (e) {
		console.log('Exception: ', e);
		return new Error('something went wrong while getting new products');
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getBestSellingProducts (){
	let connection;
	try {
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `SELECT * from products order by sale_count desc limit 6`;
			return await connection.query(query);
		} else {
			return new Error(failedToGetDatabaseConnection.description)
		}
	}
	catch (e) {
		console.log('Exception: ', e);
		return new Error('something went wrong while getting best selling products');
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function getRandomProducts (limit=6){
	let connection;
	try {
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `SELECT * from products order by RAND() desc limit ${limit}`;
			return await connection.query(query);
		} else {
			return new Error(failedToGetDatabaseConnection.description)
		}
	}
	catch (e) {
		console.log('Exception: ', e);
		return new Error('something went wrong while getting best selling products');
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function searchProducts(req,res){
	let connection;
	let searchText = req.query.text;
	if ( !searchText ){
		res.send({status:400,detail:'Type some text to search for products'});
		return;
	}
	try {
		searchText = searchText.toLowerCase();
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `SELECT products.* , market.name as market_name from products 
			INNER JOIN market ON 
			products.market_id = market.id
			WHERE LOWER(products.name) LIKE ?`;
			let result = await connection.query(query,`%${searchText}%`);
			res.send({status:200,detail:'search result',data:result})
		} else {
			return new Error(failedToGetDatabaseConnection.description)
		}
	}
	catch (e) {
		console.log('Exception: ', e);
		return new Error('something went wrong while getting search products');
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function addProductToCart(req,res){
	let connection;
	let productId = req.query.id;
	if ( !productId ){
		res.send({status:400,detail:'invalid request'});
		return;
	}
	try {
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let markets = await connection.query(`SELECT id as market_id,name as market_name FROM market`);
			let productName = await connection.query(`SELECT name from products where id=?`,productId);
			if ( _.has(markets,'[0].market_id') && _.has(productName,'[0].name')){
				productName = productName[0].name;
				let productFoundInAllMarkets = true;
				for ( let i=0;i<markets.length;i++){
					let result = await connection.query(`SELECT * FROM products where name LIKE '%${productName}%' AND market_id = ?`, [markets[i].market_id]);
					if ( _.has(result,'[0].id') ){
						markets[i].product = result;
					} else {
						productFoundInAllMarkets = false;
					}
				}
				if ( productFoundInAllMarkets )
					res.send({status:200,detail:'result',data:markets});
				else
					res.send({status:400,detail:"Couldn't add this product, this product is not available in all markets"});
			} else {
				res.send({status:400,detail:'failed to get markets records'});
			}
		} else {
			return new Error(failedToGetDatabaseConnection.description)
		}
	}
	catch (e) {
		console.log('Exception: ', e);
		return new Error('something went wrong while getting product from different markets');
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}


module.exports = {
	getHomePageItems,
	searchProducts,
	addProductToCart
};
