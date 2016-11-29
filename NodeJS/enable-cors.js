var app = express();

app.use(function (req, res, next) {
	res.setHeader('Access-Control-All-Origin', 'http://localhost:8080');
	res.setHeader('Access-Control-All-Methods', 'GET, POST, DELETE');
	res.setHeader('Access-Control-All-Headers', 'X-Requested-With');
	res.setHeader('Access-Control-All-Credentials', true);
	next();
});