'use strict';
const _ = require('lodash'),
	clc = require('cli-color'),
	md5 = require('md5'),
	{failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccess/dbconnection').DbConnection;

async function login (req,res){
	let connection;
	try {
		let {email,password} = req.body;
		if(!email || !password) {
			res.send({status:400,detail:'invalid request'});
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `select name from account where email = ? and password = ?`;
			let result = await connection.query(query,[email,md5(password)]);
			if ( _.has(result,'[0].name') ){
				res.send({status:200,detail:'login successfully',name:result[0].name});
			} else {
				res.send({status:400,detail:'email or password is not correct'});
			}
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while trying to login'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

async function register (req,res){
	let connection;
	try {
		let {name,email,password} = req.body;
		if(!name || !email || !password) {
			res.send({status:400,detail:'invalid request'});
			return;
		}
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `INSERT INTO account (name,email,password) VALUES (?,?,?)`;
			await connection.query(query,[name,email,md5(password)]);
			res.send({status:200,detail:'Account created successfully'});
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		let e2 = e.toString();
		if ( e2.includes('Duplicate') ){
			res.send({status: 400, detail: 'This email is already registered'});
		} else {
			res.send({status: 400, detail: 'something went wrong while creating account'});
			console.log('Exception: ', e);
		}
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}


module.exports = {
	login,
	register
};
