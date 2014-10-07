if(window?) module.exports = require('./src/client')
else if(global?) module.exports = require('./src/server')
