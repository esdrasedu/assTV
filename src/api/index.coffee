http = require 'http'
sockjs = require 'sockjs'
node_static = require 'node-static'

dash = new node_static.Server './bin/dash'

api = sockjs.createServer()
api.on 'connection', (conn)->
  conn.on 'data', (message)->
    conn.write message

  conn.on 'close', ()->

server = http.createServer()

server.addListener 'request', (req, res)->
  dash.serve req, res

server.addListener 'upgrade', (req,res)->
  res.end()

api.installHandlers server, prefix:'/api'

server.listen 80, 'localhost'