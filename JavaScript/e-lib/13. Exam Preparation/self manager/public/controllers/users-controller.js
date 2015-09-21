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
                        var user = {
                            username: $('#tb-reg-username').val(),
                            password: $('#tb-reg-pass').val()
                        };
                        
                        if (user.username.replace(/\s+/g, '').length < 1) {
                            $('#div-reg-username').addClass('has-error');
                            errorProvider.raiseError('Username schould not be empty!');
                        } else if (user.password.replace(/\s+/g, '').length < 1) {
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