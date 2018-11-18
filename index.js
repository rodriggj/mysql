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
  //port : 3308
});

//export MYSQL_PW='mysql1234'
//ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'


// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//    if (error) throw error;
//    console.log('The solution is: ', results[0].solution);
// });

//var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';   initial query
//modified querey
//var q = 'SELECT * FROM users';

// connection.query(q, function (error, results, fields) {   //initial querey
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });

//modified query
// connection.query(q, function(error, results, fields) {
// 	if(error) throw error; 
// 	console.log(results); 
// });

//if you wanted to return just 1 record 
// connection.query(q, function(error, results, fields) {
// 	if(error) throw error; 
// 	console.log(results[1]); 
// });

//if you wanted to just get email of result 1 
// connection.query(q, function(error, results, fields) {
// 	if(error) throw error; 
// 	console.log(results[1].email); 
// });

//if you wanted to simply return a data like count from the sql query we would exectue the query like this. 

var q = 'SELECT COUNT(*) AS Total_Records FROM users'; 

connection.query(q, function(error, results, fields){
	if(error) throw error; 
	console.log(results[0].Total_Records); 
});


connection.end(); 

app.get('/', function(req, res) {
	res.send('Gabe Rodriguez'); 
})

app.listen(PORT, IP, function(){
	console.log('Server is up and running'); 
});
