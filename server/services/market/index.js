'use strict';
const _ = require('lodash'),
	clc = require('cli-color'),
	{failedToGetDatabaseConnection} = require('../../../configs/res_codes'),
	DbConnection = require('../../dataaccess/dbconnection').DbConnection;

async function getMarket (req,res){
	let connection;
	try {
		let id = req.query.id;
		connection = await new DbConnection().getConnection();
		if ( connection ) {
			let query = `SELECT * from market`;
			if ( id ) query+=` WHERE id=?`;
			let data = await connection.query(query,id);
			res.send({status:200,detail:'Market/s record',data});
		} else {
			res.send({status: 400, detail: failedToGetDatabaseConnection.description});
		}
	}
	catch (e) {
		res.send({status: 400, detail: 'something went wrong while getting market/s record'});
		console.log('Exception: ', e);
	}
	finally {
		if ( connection ) {
			connection.release();
		}
	}
}

module.exports = {
	getMarket
};
