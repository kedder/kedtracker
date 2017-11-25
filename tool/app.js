const express = require('express')
const http = require('http');
const url = require('url');
const WebSocket = require('ws');

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

app.use('/static', express.static('frontend/public'))

app.get('/', (req, res) => res.sendFile('frontend/app/index.html',
                                        {root: '.'}));

server.listen(9080, () => {
  console.log('Listening on http://localhost:%d/', server.address().port);
});
