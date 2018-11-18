var express = require('express'); 
var faker = require('faker'); 
var app = express(); 
const PORT = process.env.PORT || 3000; 
const IP = process.env.IP; 

//https://github.com/marak/Faker.js/
//console.log(faker.internet.email()); 

app.get('/', function(req, res){
	res.send(faker.internet.email()); 
})

app.listen(PORT, IP, function(){
	console.log("Server is listening on PORT:" + PORT); 
})

console.log(generateAddress());
function generateAddress(){
  console.log(faker.address.streetAddress());
  console.log(faker.address.city());
  console.log(faker.address.state());
}