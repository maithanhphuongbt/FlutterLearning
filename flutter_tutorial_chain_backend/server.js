var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json())

const cors = require('cors')
const corsOptions = {
  origin: 'http://localhost:5000',
  optionsSuccessStatus: 200
}
app.use(cors(corsOptions))

const db = require('./app/config/db.config.js');

// force: true will drop the table if it already exists
db.sequelize.sync().then(() => {
  console.log('Drop and Resync with { force: true }');
});

require('./app/route/book.route.js')(app);
require('./app/route/user.route.js')(app);

// Create a Server
var server = app.listen(5000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log("App listening at http://%s:%s", host, port)
})