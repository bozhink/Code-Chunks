(function ($) {
    'use strict';

    $().ready(function () {
        // validate signup form on keyup and submit
        $('#login-form').validate({
            rules: {
                'username': {
                    required: true,
                    minlength: 2
                },
                'password': {
                    required: true,
                    minlength: 5
                }
            },
            messages: {
                'username': {
                    required: 'Please enter a username',
                    minlength: 'Your username must consist of at least 2 characters'
                },
                'password': {
                    required: 'Please provide a password',
                    minlength: 'Your password must be at least 5 characters long'
                },
            }
        });
    });
}(window.jQuery));