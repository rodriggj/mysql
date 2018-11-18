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

var data = []; 

for(var i = 0; i<=499; i++) {
	var email = faker.internet.email(); 
	var created_at = faker.date.past(); 
	var person = [email, created_at];
	data.push(person); 
}; 

var d = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(d, [data], function(error, results) {
	console.log(error); 
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