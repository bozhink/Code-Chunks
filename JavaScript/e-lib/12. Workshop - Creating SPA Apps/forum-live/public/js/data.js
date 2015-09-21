var data = (function () {

    const USERNAME_STORAGE_KEY = 'username-key',
        AUTH_KEY_STORAGE_KEY = 'auth-key-key';

    function userLogin(user) {
        var promise = new Promise(function (resolve, reject) {
            var reqUser = {
                username: user.username,
                passHash: CryptoJS.SHA1(user.password).toString()
            }

            $.ajax({
                url: 'api/auth',
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(reqUser),
                success: function (user) {
                    localStorage.setItem(USERNAME_STORAGE_KEY, user.username);
                    localStorage.setItem(AUTH_KEY_STORAGE_KEY, user.authKey);
                    resolve(user);
                }
            });
        });

        return promise;
    }

    function userRegister(user) {
        var promise = new Promise(function (resolve, reject) {
            var reqUser = {
                username: user.username,
                passHash: CryptoJS.SHA1(user.password).toString()
            };

            $.ajax({
                url: 'api/users',
                method: 'POST',
                data: JSON.stringify(reqUser),
                contentType: 'application/json',
                success: function (user) {
                    localStorage.setItem(USERNAME_STORAGE_KEY, user.username);
                    localStorage.setItem(AUTH_KEY_STORAGE_KEY, user.authKey);
                    resolve(user);
                }
            });
        });
        
        return promise;
    }

    function userLogout() {
        var promise = new Promise(function (resolve, reject) {
            localStorage.removeItem(AUTH_KEY_STORAGE_KEY);
            localStorage.removeItem(USERNAME_STORAGE_KEY);
            resolve();
        });

        return promise;
    }

    function usersFind() {

    }

    function getCurrentUser() {
        var username = localStorage.getItem(USERNAME_STORAGE_KEY);
        if (!username) {
            return null;
        }
        
        return {
            username: username
        };
    }

    function threadsGet() {
        var promise = new Promise(function (resolve, reject) {
            $.getJSON('api/threads', function (response) {
                response.result = response.result.map(function (thread) {
                    thread.postDate = moment(new Date(thread.postDate)).fromNow();
                    return thread;
                });
                
                resolve(response);
            });
        });
        
        return promise;
    }

    function threadsAdd(title) {
        var promise = new Promise(function (resolve, reject) {
            var body = {
                title: title
            };

            $.ajax({
                url: 'api/threads',
                method: 'POST',
                data: JSON.stringify(body),
                headers: {
                    'x-authkey': localStorage.getItem(AUTH_KEY_STORAGE_KEY)
                },
                contentType: 'application/json',
                success: function (response) {
                    resolve(response);
                }
            })
        });
        
        return promise;
    }

    function threadById(id) {
        var promise = new Promise(function (resolve, reject) {
            $.getJSON('api/threads/' + id, function (response) {
                resolve(response);
            });
        });
        
        return promise;
    }

    function threadsAddMessage(threadId, message) {
        var promise = new Promise(function (resolve, reject) {
            
            $.ajax({
                url: 'api/threads/' + threadId + '/messages`,
                method: 'POST',
                data: JSON.stringify(message),
                contentType: 'application/json',
                headers: {
                    'x-authkey': localStorage.getItem(AUTH_KEY_STORAGE_KEY)
                },
                success: function (response) {
                    resolve(response);
                }
            });
        });

        return promise;
    }

    return {
        users: {
            login: userLogin,
            register: userRegister,
            logout: userLogout,
            find: usersFind,
            current: getCurrentUser
        },

        threads: {
            get: threadsGet,
            add: threadsAdd,
            getById: threadById,
            addMessage: threadsAddMessage
        }
    };
}());