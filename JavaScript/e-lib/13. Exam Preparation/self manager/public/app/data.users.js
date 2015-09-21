(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key';

    /* Users */
    function register(user) {
        var reqUser = {
                username: user.username,
                passHash: CryptoJS.SHA1(user.username + user.password).toString()
            },
            options = {
                data: reqUser
            };

        return jsonRequester.post('api/users', options)
            .then(function (response) {
                var user = response.result;
                localStorage.setItem(LOCAL_STORAGE_USERNAME_KEY, user.username);
                localStorage.setItem(LOCAL_STORAGE_AUTHKEY_KEY, user.authKey);
                return {
                    username: response.result.username
                };
            });
    }

    function signIn(user) {
        var reqUser = {
                username: user.username,
                passHash: CryptoJS.SHA1(user.username + user.password).toString()
            },
            options = {
                data: reqUser
            };

        return jsonRequester.put('api/users/auth', options)
            .then(function (response) {
                var user = response.result;
                localStorage.setItem(LOCAL_STORAGE_USERNAME_KEY, user.username);
                localStorage.setItem(LOCAL_STORAGE_AUTHKEY_KEY, user.authKey);
                return user;
            });
    }

    function signOut() {
        var promise = new Promise(function (resolve, reject) {
            localStorage.removeItem(LOCAL_STORAGE_USERNAME_KEY);
            localStorage.removeItem(LOCAL_STORAGE_AUTHKEY_KEY);
            resolve();
        });

        return promise;
    }

    function hasUser() {
        return !!localStorage.getItem(LOCAL_STORAGE_USERNAME_KEY) &&
            !!localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY);
    }

    function usersGet() {
        return jsonRequester.get('api/users')
            .then(function (response) {
                return response.result;
            });
    }

    if (window.data === undefined) {
        window.data = {};
    }

    window.data.users = {
        signIn: signIn,
        signOut: signOut,
        register: register,
        hasUser: hasUser,
        get: usersGet,
    };
}());
