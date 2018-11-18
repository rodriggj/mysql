var express = require('express'); 
var faker = require('faker'); 
var app = express(); 

const PORT = process.env.PORT || 3000; 
const IP = process.env.IP; 
 
var mysql = require('mysql');
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',  //your root username (leave as root)
  database : 'node_practice',   //the name of your db (create this if you haven't already)
  password : 'password',   //your root user's password
  insecureAuth : true
});

//inserting data take 1
// var i = 'INSERT INTO users (email) VALUES ("ava.rodriguez@hotmail.com")';
// connection.query(i, function(error, results, fields){
// 	if(error) throw error; 
// 	console.log(results); 
// });

//inserting data take 2
// var person = {email: 'rodriggj3@hotmail.com'}; 
// connection.query('INSERT INTO users SET ?', person, function(error, results) {
// 	if(error) throw error; 
// 	console.log(results); 
// })

//inserting data using faker 
var person = {email: faker.internet.email()};
connection.query('INSERT INTO users SET ?', person, function(error, results) {
	if(error) throw error; 
	console.log(results); 
});

//querying data
var q = 'SELECT COUNT(*) AS Total_Records FROM users'; 

connection.query(q, function(error, results, fields){
	if(error) throw error; 
	console.log(results); 
});

connection.end(); 

app.listen(PORT, IP, function(){
	console.log('Server is up and running'); 
});