var express = require('express');
var app = express();
const PORT = process.env.PORT || 3000;
const IP = process.env.IP;

<<<<<<< HEAD
app.get("/", function(req, res){
	res.send("Hello World");
}); 

app.listen(PORT, IP, function(){
	console.log('Server is up and running on PORT: ' + PORT); 
});
=======
app.get('/', function(req, res) {
  res.send('Hello World');
});

app.listen(PORT, IP, function() {
  console.log("Server is up and listening on PORT: " + PORT);
});
>>>>>>> 4252ce5e14f7c1cce2f690464ff53cefbb10c096
