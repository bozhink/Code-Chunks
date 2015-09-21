(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key';

    function signOut(e) {
        data.users.signOut()
            .then(function () {
                document.location = '#/';
                document.location.reload(true);
            });
    }

    function signIn(e) {
        e.preventDefault();
        var user = {
            username: $('#tb-username').val(),
            password: $('#tb-password').val()
        };

        data.users.signIn(user)
            .then(function (user) {
                document.location = '#/';
                document.location.reload(true);
            }, function (err) {
                $('#container-sign-in').trigger("reset");
                errorProvider.raiseError(err);
            });
    }

    var sammyApp = Sammy('#content', function () {
        this.get('#/home', cookiesController.all);
        this.get('#/', function () {
            this.redirect('#/home');
        });
        
        this.get('#/new-cookie', cookiesController.add);
        
        this.get('#/my-cookie', cookiesController.show);

        this.get('#/users', usersController.all);
        this.get('#/users/register', usersController.register);
    });

    $(function () {
        sammyApp.run('#/home');

        if (data.users.hasUser()) {
            $('#container-sign-in').addClass('hidden');
            $('#li-my-cookie').removeClass('hidden');
            $('#li-new-cookie').removeClass('hidden');
            $('.likes').removeClass('hidden');
            $('.dislikes').removeClass('hidden');

            $('#geerint-user').text('Hello, ' + localStorage.getItem(
                LOCAL_STORAGE_USERNAME_KEY));

            $('#btn-sign-out').on('click', signOut);
        } else {
            $('#container-sign-out').addClass('hidden');
            $('#li-my-cookie').addClass('hidden');
            $('#li-new-cookie').addClass('hidden');
            $('.likes').addClass('hidden');
            $('.dislikes').addClass('hidden');

            $('#geerint-user').text('');

            $('#btn-sign-in').on('click', signIn);
        }
    });
}());