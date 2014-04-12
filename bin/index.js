(function() {
  var api, dash, http, node_static, server, sockjs;

  http = require('http');

  sockjs = require('sockjs');

  node_static = require('node-static');

  dash = new node_static.Server('./bin/dash');

  api = sockjs.createServer();

  api.on('connection', function(conn) {
    conn.on('data', function(message) {
      return conn.write(message);
    });
    return conn.on('close', function() {});
  });

  server = http.createServer();

  server.addListener('request', function(req, res) {
    return dash.serve(req, res);
  });

  server.addListener('upgrade', function(req, res) {
    return res.end();
  });

  api.installHandlers(server, {
    prefix: '/api'
  });

  server.listen(80, 'localhost');

}).call(this);
