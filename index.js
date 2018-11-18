var express = require('express'); 
var faker = require('faker'); 
var app = express(); 

const PORT = process.env.PORT || 3000; 
const IP = process.env.IP; 

app.get('/', function(req, res) {
	res.send('Gabe Rodriguez'); 
})

app.listen(PORT, IP, function(){
	console.log('Server is up and running'); 
})

function generateAddress(){
  console.log(faker.address.streetAddress());
  console.log(faker.address.city());
  console.log(faker.address.state());
}

generateAddress(); 