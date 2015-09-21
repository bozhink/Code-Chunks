var usersController = function () {

    function all(context) {
        var users;

        data.users.get()
            .then(function (resUsers) {
                users = resUsers;
                return templates.get('users');
            })
            .then(function (template) {
                context.$element().html(template(users));

                $('.btn-add-friend')
                    .on('click', function () {
                        var id = $(this).parents('.user-box').attr('data-id');

                        data.friends.sentRequest(id);
                    });
            });
    }

    function register(context) {
        templates.get('register')
            .then(function (template) {
                context.$element().html(template());

                $('#btn-register')
                    .on('click', function () {
                        var username = $('#tb-reg-username').val().replace(/\s+/g, ''),
                            password = $('#tb-reg-pass').val(),
                            user = {
                                username: username,
                                password: password
                            };

                        if (!(/^[A-Za-z_\.]{6,30}$/.test(username))) {
                            $('#div-reg-username').addClass('has-error');
                            $('#div-reg-pass').removeClass('has-error');
                            errorProvider.raiseError(
                                'Username schould be between 6 and 30 symbols or contains invalid symbol!');
                        } else if (password.length < 1) {
                            $('#div-reg-username').removeClass('has-error');
                            $('#div-reg-pass').addClass('has-error');
                            errorProvider.raiseError('Password schould not be empty!');
                        } else {
                            data.users.register(user)
                                .then(function () {
                                    toastr.success('User registered!');
                                    context.redirect('#/');
                                    document.location.reload(true);
                                });
                        }
                    });
            });
    }

    return {
        all: all,
        register: register
    };
}();