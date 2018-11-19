var express = require('express');
var app = express();
const PORT = process.env.PORT || 3000;
const IP = process.env.IP;

app.get('/', function(req, res) {
  res.send('Hello World');
});

app.listen(PORT, IP, function() {
  console.log("Server is up and listening on PORT: " + PORT);
});
