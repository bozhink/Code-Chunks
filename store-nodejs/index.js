var express = require('express'),
    app = express(),
    server,
    port = process.env.PORT || 3000,
    wagner = require('wagner-core'),
    morgan = require('morgan')(),
    bodyParser = require('body-parser');

require('./server/settings/register-config')(wagner);
require('./server/settings/register-services')(wagner);
require('./server/settings/register-db')(wagner);
require('./server/settings/register-models')(wagner);

app.set('views', __dirname + '/views');
app.set('view engine', 'pug');

app.use(express.static(__dirname + '/public', {
    maxAge: 4 * 60 * 60 * 1000 /* 2hrs */
}));
app.use('/lib', express.static(__dirname + '/public/lib'));
app.use('/css', express.static(__dirname + '/public/dist/css'));
app.use('/js', express.static(__dirname + '/public/dist/js'));

app.use(morgan);
app.use(bodyParser.json());

wagner.invoke(require('./server/auth'), {
    app: app
});

var homeRouter = require('./server/routers/homeRouter')();
var authRouter = require('./server/routers/authRouter')();

app.use('/', homeRouter);
app.use('/auth', authRouter);
app.use('/api/v1', require('./server/api')(wagner));

server = app.listen(port, function () {
    var port = server.address().port;
    console.log('Server is listening on port %s.', port);
});