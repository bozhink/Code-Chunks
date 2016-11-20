var express = require('express'),
    app = express(),
    wagner = require('wagner-core');

require('./server/settings/register-config')(wagner);
require('./server/settings/register-services')(wagner);
require('./server/settings/register-db')(wagner);
require('./server/settings/register-models')(wagner);

app.use(require('morgan')());

wagner.invoke(require('./server/auth'), {
    app: app
});

app.use('/api/v1', require('./server/api')(wagner));

app.use(express.static('./public', {
    maxAge: 4 * 60 * 60 * 1000 /* 2hrs */
}));

var server = app.listen(3000, function () {
    var port = server.address().port;
    console.log('Express server is listening on port %s.', port);
});