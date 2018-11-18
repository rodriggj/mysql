var express = require('express'); 
var mysql = require('mysql'); 
var faker = require('faker'); 
var app = express(); 

const PORT = process.env.PORT || 8080; 
const IP = process.env.IP; 

//##############################################
// MySQL Connection
//##############################################
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',  //your root username (leave as root)
  database : 'webapp',   //the name of your db (create this if you haven't already)
  password : 'password',   //your root user's password
  insecureAuth : true
});

//##############################################
// Seed DB
//##############################################
var data = []; 

for (var i = 0; i<=499; i++) {
	var fn = faker.name.firstName(); 
	var ln = faker.name.lastName(); 
	var email = faker.internet.email(); 

	var user = [fn, ln, email]

	data.push(user); 
}

var seed = 'INSERT INTO users (fn, ln, email) VALUES ?'; 

connection.query(seed, [data], function(error, results) {
	console.log(error); 
	console.log(results); 
});


//##############################################
// Routes
//##############################################
app.get('/', function(req, res){
	var q = 'SELECT COUNT(*) FROM users';
	connection.query(q, function(error, results, fields) {

	})
});

//##############################################
// Server
//##############################################
app.listen(PORT, IP, function(){
	console.log('Server is up and running on PORT: ' + PORT); 
})