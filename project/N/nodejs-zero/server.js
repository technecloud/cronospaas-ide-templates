var serverPort = process.env.VCAP_APP_PORT || 8888;


var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Node.JS!');
}).listen(serverPort);

console.log('Server running at http://localhost:/'+serverPort);