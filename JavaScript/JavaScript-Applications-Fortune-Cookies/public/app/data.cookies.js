/* Cookies */
(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key',
        apiUrl = 'api/cookies';

    function cookiesGet(url) {
        var options = {
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };
        
        url = url || apiUrl;

        return jsonRequester.get(url, options)
            .then(function (response) {
                return response.result;
            });
    }

    function cookiesAdd(cookie) {
        var options = {
            data: cookie,
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.post(apiUrl, options)
            .then(function (response) {
                return response.result;
            });
    }
    
    function cookieUpdate(id, cookie) {
        var options = {
            data: cookie,
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.put('api/cookies/' + id, options)
            .then(function (response) {
                return response.result;
            });
    }

    if (window.data === undefined) {
        window.data = {};
    }

    window.data.cookies = {
        get: cookiesGet,
        add: cookiesAdd,
        update: cookieUpdate
    };
}());