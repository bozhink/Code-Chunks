(function ($) {
    'use strict';

    $.validator.addMethod(
        'regex',
        function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        'Your input does not match required format.'
    );

    $.validator.setDefaults({
        // submitHandler: function() {
        //     $('#register-form').submit(function(event) {
        //         event.preventDefault();
        //         window.location = '/auth/login';
        //     });
        // }
    });

    $().ready(function () {
        // validate signup form on keyup and submit
        $('#register-form').validate({
            rules: {
                'firstname': 'required',
                'lastname': 'required',
                'username': {
                    required: true,
                    minlength: 2
                },
                'password': {
                    required: true,
                    minlength: 5
                },
                'confirm-password': {
                    required: true,
                    minlength: 5,
                    equalTo: '#password'
                },
                'email': {
                    required: true,
                    email: true
                },
                'picture': {
                    required: true,
                    regex: '^http://.+'
                },
                'agree': 'required'
            },
            messages: {
                'firstname': 'Please enter your firstname',
                'lastname': 'Please enter your lastname',
                'username': {
                    required: 'Please enter a username',
                    minlength: 'Your username must consist of at least 2 characters'
                },
                'password': {
                    required: 'Please provide a password',
                    minlength: 'Your password must be at least 5 characters long'
                },
                'confirm-password': {
                    required: 'Please provide a password',
                    minlength: 'Your password must be at least 5 characters long',
                    equalTo: 'Please enter the same password as above'
                },
                'email': 'Please enter a valid email address',
                'pucture': 'Please enter a valid picture link',
                'agree': 'Please accept our policy'
            }
        });

        // propose username by combining first- and lastname
        $('#username').focus(function () {
            var firstname = $('#firstname').val();
            var lastname = $('#lastname').val();
            if (firstname && lastname && !this.value) {
                this.value = firstname + '.' + lastname;
            }
        });
    });
}(window.jQuery));