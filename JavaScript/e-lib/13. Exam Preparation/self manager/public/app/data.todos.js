/* Todos */
(function () {
    const LOCAL_STORAGE_USERNAME_KEY = 'signed-in-user-username',
        LOCAL_STORAGE_AUTHKEY_KEY = 'signed-in-user-auth-key';

    function todosGet() {
        var options = {
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };
        return jsonRequester.get('api/todos', options)
            .then(function (response) {
                return response.result;
            });
    }

    function todosAdd(todo) {
        var options = {
            data: todo,
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.post('api/todos', options)
            .then(function (response) {
                return response.result;
            });
    }

    function todosUpdate(id, todo) {
        var options = {
            data: todo,
            headers: {
                'x-auth-key': localStorage.getItem(LOCAL_STORAGE_AUTHKEY_KEY)
            }
        };

        return jsonRequester.put('api/todos/' + id, options)
            .then(function (response) {
                return response.result;
            });
    }

    if (window.data === undefined) {
        window.data = {};
    }

    window.data.todos = {
        get: todosGet,
        add: todosAdd,
        update: todosUpdate
    };
}());
