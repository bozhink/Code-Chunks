/* Categories */
(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key';
    
    function categoriesGet() {
        var options = {
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.get('api/categories', options)
            .then(function (response) {
                return response.result;
            });
    }

    if (window.data === undefined) {
        window.data = {};
    }

    window.data.categories = {
        get: categoriesGet
    };
}());