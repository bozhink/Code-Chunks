function setupAuth(User, Config, app) {
    var passport = require('passport'),
        bodyParser = require('body-parser'),
        urlencodedParser = bodyParser.urlencoded({
            extended: false
        }),
        CryptoJS = require('crypto-js'),
        uuid = require('uuid'),
        BasicStrategy = require('passport-http').BasicStrategy,
        BearerStrategy = require('passport-http-bearer').Strategy,
        FacebookStrategy = require('passport-facebook').Strategy,
        LocalStrategy = require('passport-local').Strategy;

    // High level serialize/de-serialize configuration for passport
    passport.serializeUser(function (user, done) {
        done(null, user._id);
    });

    passport.deserializeUser(function (id, done) {
        User.findOne({
            _id: id
        }).exec(done);
    });

    // passport.use(new BearerStrategy(
    //     function (accessToken, done) {
    //         User.findOne({
    //             token: accessToken
    //         }, function (error, user) {
    //             if (error) {
    //                 return done(error);
    //             }

    //             if (!user) {
    //                 return done(null, false);
    //             }

    //             return done(null, user, {
    //                 scope: 'all'
    //             });
    //         });
    //     }));

    // passport.use(new BasicStrategy(localBasicCallback));

    passport.use(new LocalStrategy(function (username, password, done) {
        console.log(username);
        console.log(password);
        return done({});
    }));

    // Facebook-specific
    // passport.use(new FacebookStrategy({
    //         clientID: Config.facebookClientId,
    //         clientSecret: Config.facebookClientSecret,
    //         callbackURL: 'http://localhost:3000/auth/facebook/callback'
    //     },
    //     function (accessToken, refreshToken, profile, done) {
    //         if (!profile.emails || !profile.emails.length) {
    //             return done('No emails associated with this account!');
    //         }

    //         User.findOneAndUpdate({
    //                 'data.oauth': profile.id
    //             }, {
    //                 $set: {
    //                     'profile.username': profile.emails[0].value,
    //                     'profile.picture': 'http://graph.facebook.com/' + profile.id.toString() + '/picture?type=large'
    //                 }
    //             }, {
    //                 'new': true,
    //                 'upsert': true,
    //                 'runValidators': true
    //             },
    //             function (error, user) {
    //                 done(error, user);
    //             });
    //     }));

    // Express middlewares
    app.use(require('express-session')({
        secret: 'this is a secret'
    }));
    app.use(passport.initialize());
    app.use(passport.session());

    // Express routes for auth
    // app.get('/auth/facebook',
    //     function (req, res, next) {
    //         var redirect = encodeURIComponent(req.query.redirect || '/');

    //         passport.authenticate('facebook', {
    //             scope: ['email'],
    //             callbackURL: 'http://localhost:3000/auth/facebook/callback?redirect=' + redirect
    //         })(req, res, next);
    //     });

    // app.get('/auth/facebook/callback',
    //     function (req, res, next) {
    //         var url = 'http://localhost:3000/auth/facebook/callback?redirect=' + encodeURIComponent(req.query.redirect);
    //         passport.authenticate('facebook', {
    //             callbackURL: url
    //         })(req, res, next);
    //     },
    //     function (req, res) {
    //         res.redirect(req.query.redirect);
    //     });

    // See https://github.com/passport/express-4.x-http-bearer-example/blob/master/server.js
    // curl -v -H "Authorization: Bearer 123456789" http://127.0.0.1:3000/
    // curl -v http://127.0.0.1:3000/?access_token=123456789
    // app.get('/auth/bearer',
    //     passport.authenticate('bearer', {
    //         session: false
    //     }),
    //     function (req, res) {
    //         res.json({
    //             username: req.user.username,
    //             email: req.user.emails[0].value
    //         });
    //     });

    // See https://github.com/passport/express-3.x-http-basic-example/blob/master/server.js
    // app.get('/auth/basic',
    //     passport.authenticate('basic', {
    //         session: false
    //     }),
    //     function (req, res) {
    //         res.json({
    //             username: req.user.username,
    //             email: req.user.emails[0].value
    //         });
    //     });

    app.post('/auth/login', passport.authenticate('local', {
        successRedirect: '/',
        failureRedirect: '/auth/login'
    }));

    app.post('/auth/register', /*urlencodedParser,*/ function(req, res) {

        console.log(req.body);

        var firstname = req.body.firstname,
            lastname = req.body.lastname,
            username = req.body.username,
            email = req.body.email,
            password = req.body.password,
            picture = req.body.picture,
            token = CryptoJS.SHA256(uuid()).toString();

        if (!username || !password) {
            return res.json({
                error: 'Invalid register credentials'
            });
        }

        username = username.toLowerCase();

        User.findOne({
            'profile.username': username
        }, function (error, user) {
            if (error) {
                return res.json(error);
            }

            if (user) {
                return res.json({
                    'error': 'User already exists'
                });
            }

            var user = new User({
                'profile.firstname': firstname,
                'profile.lastname': lastname,
                'profile.username': username,
                'profile.password': encryptPassword(password),
                'profile.email': email,
                'profile.picture': picture,
                'data.oauth': token
            });
            user.save(function (error) {
                if (error) {
                    return res.json(error);
                }

                return res.redirect('/auth/login');
            });
        });
    });

    function encryptPassword(password, salt) {
        if (!password) {
            return;
        }

        if (!salt) {
            salt = CryptoJS.SHA256(uuid()).toString().substring(1, 6);
        }

        var passwordHash = CryptoJS.SHA256(password).toString();
        var encryptedHash = CryptoJS.AES.encrypt(passwordHash, salt).toString();

        return `${salt}+${encryptedHash}`;
    }

    function comparePasswords(password, encryptedPassword) {
        if (!password || !encryptedPassword) {
            return false;
        }

        var salt = encryptedPassword.split('+')[0];
        var ciphertext = encryptedPassword.substring(salt.length + 1);
        var bytes = CryptoJS.AES.decrypt(ciphertext, salt);
        var plaintext = bytes.toString(CryptoJS.enc.Utf8);

        return CryptoJS.SHA256(password).toString() === plaintext;
    }

    function localBasicCallback(username, password, done) {

        console.log(username);
        console.log(password);

        User.findOne({
            'profile.username': username
        }, function (error, user) {
            if (error) {
                return done(error);
            }

            if (!user) {
                return done(null, false, {
                    message: 'Incorrect username.'
                });
            }

            if (!comparePasswords(password, user.profile.password)) {
                return done(null, false, {
                    message: 'Incorrect password.'
                });
            }

            return done(null, user, {
                scope: 'all'
            });
        });
    }
}

module.exports = setupAuth;