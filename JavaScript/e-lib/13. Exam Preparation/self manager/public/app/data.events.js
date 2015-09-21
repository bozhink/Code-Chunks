/* Events */
(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key';

    function eventsGet() {
        var options = {
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.get('api/events', options)
            .then(function (response) {
                return response.result;
            });
    }

    function eventsAdd(event) {
        var options = {
            data: event,
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.post('api/events', options)
            .then(function (response) {
                return response.result;
            });
    }

    if (window.data === undefined) {
        window.data = {};
    }

    window.data.events = {
        get: eventsGet,
        add: eventsAdd
    };
}());
