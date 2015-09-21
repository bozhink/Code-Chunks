var cookiesController = (function () {

    var hourlyFortuneCookie = {
        cookie: null,
        hour: 0
    };

    function likeDislike() {
        $('input[type=radio]').on('change', function (e) {
            var likeIt = (+this.value) === 1 ? 'like' : 'dislike',
                id = this.name;

            data.cookies.update(id, {
                    type: likeIt
                })
                .then(function (cookie) {
                    toastr.info('Now you ' + likeIt + ' the cookie "' + cookie.text + '"!');
                })
                .catch(function (err) {
                    errorProvider.raiseError(err);
                });
        });
    }

    function reShare() {
        $('#btn-cookie-reshare').on('click', function () {
            var selector = 'div#' + this.name,
                cookieText = $(selector + ' h3').text(),
                cookieCategory = $(selector + ' legend').text(),
                cookieImg = $(selector + ' img').attr('src'),
                cookie = {
                    text: cookieText,
                    category: cookieCategory,
                    likes: 0,
                    dislikes: 0,
                    img: cookieImg,
                    shareDate: (new Date()).toISOString()
                };

            data.cookies.add(cookie).then(function (cookie) {
                toastr.success('Cookie "' + cookie.text + '" created!');
            });
        });
    }

    function showHourlyFortuneCookie(context) {
        var cookies;

        data.cookies.get()
            .then(function (responseCookies) {
                var hour;
                cookies = _.chain(responseCookies).map(controllerHelpers.fixDate).value();

                hour = (new Date()).getHours();
                if (hourlyFortuneCookie.cookie === null || hourlyFortuneCookie.hour !== hour) {
                    hourlyFortuneCookie.hour = hour;
                    hourlyFortuneCookie.cookie = cookies[(cookies.length * Math.random()) | 0];
                }

                return templates.get('my-cookie');
            })
            .then(function (template) {
                context.$element().html(template(hourlyFortuneCookie.cookie));
                likeDislike();
                reShare();
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function applyCookieTemplate(context, cookies, template) {
        context.$element().html(template(cookies));

        likeDislike();
        reShare();

        $('#btn-sort-by-likes').on('click', function () {
            sortByLikes(context, cookies);
        });

        $('#btn-sort-by-sharedate').on('click', function () {
            sortByShareDate(context, cookies);
        });
    }

    function sortByLikes(context, responseCookies, templateName) {
        var cookies = _.chain(responseCookies).sortBy(function (item) {
            return item.likes;
        }).value();

        templates.get('cookies')
            .then(function (template) {
                applyCookieTemplate(context, cookies, template);
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function sortByShareDate(context, responseCookies) {
        var cookies = _.chain(responseCookies).sortBy(function (item) {
            return item.shareDate;
        }).value();

        templates.get('cookies')
            .then(function (template) {
                applyCookieTemplate(context, cookies, template);
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function all(context) {
        var cookies,
            category = context.params.category || null;

        data.cookies.get()
            .then(function (responseCookies) {
                if (category) {
                    cookies = _.chain(responseCookies)
                        .map(controllerHelpers.fixDate)
                        .groupBy(controllerHelpers.groupByCategory)
                        .map(controllerHelpers.parseGroups)
                        .value();
                    cookies = _.filter(cookies, controllerHelpers.filterByCategory(category));

                    return templates.get('cookies-by-category');
                } else {
                    cookies = _.chain(responseCookies)
                        .map(controllerHelpers.fixDate)
                        .value();

                    return templates.get('cookies');
                }
            })
            .then(function (template) {
                applyCookieTemplate(context, cookies, template);
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function add(context) {
        templates.get('cookie-add')
            .then(function (template) {
                context.$element().html(template());

                $('#btn-cookie-add').on('click', function () {
                    var cookieText = $('#tb-cookie-title').val().replace(/\s+/g, ''),
                        cookieCategory = $('#tb-cookie-category').val().replace(/\s+/g, ''),
                        cookieImg = $('#tb-cookie-img').val().replace(/\s+/g, ''),
                        cookie = {
                            text: cookieText,
                            category: cookieCategory,
                            likes: 0,
                            dislikes: 0,
                            img: cookieImg,
                            shareDate: (new Date()).toISOString()
                        };

                    if (!(/^.{6,30}$/.test(cookieText))) {

                        $('#div-cookie-title').addClass('has-error');
                        $('#div-cookie-category').removeClass('has-error');
                        $('#div-cookie-img').removeClass('has-error');
                        errorProvider.raiseError('Cookie text should contain between 6 and 30 characters.');

                    } else if (!(/^.{6,30}$/.test(cookieCategory))) {

                        $('#div-cookie-title').removeClass('has-error');
                        $('#div-cookie-category').addClass('has-error');
                        $('#div-cookie-img').removeClass('has-error');
                        errorProvider.raiseError('Cookie category should contain between 6 and 30 characters.');

                    } else if (!(/^https?:\/\/[A-Za-z0-9_\.\~\!\*\'\(\)\;\:\@\&\=\+\$\,\/\?\%\#\[\]\?\@\-]+$/.test(cookieImg))) {

                        $('#div-cookie-title').removeClass('has-error');
                        $('#div-cookie-category').removeClass('has-error');
                        $('#div-cookie-img').addClass('has-error');
                        errorProvider.raiseError('Invalid cookie image URL.');

                    } else {
                        data.cookies.add(cookie)
                            .then(function (cookie) {
                                toastr.success('Cookie "' + cookie.text + '" created!');
                                context.redirect('#/home?category=' + cookie.category);
                            })
                            .catch(function (err) {
                                errorProvider.raiseError('Cookie "' + cookie.text +
                                    '" not created!<br/>' + err.responseText);
                            });
                    }
                });

                return data.categories.get();
            })
            .then(function (categories) {
                $('#tb-cookie-category')
                    .autocomplete({
                        delay: 0,
                        source: categories
                    });
            });
    }



    return {
        all: all,
        add: add,
        show: showHourlyFortuneCookie
    };
}());