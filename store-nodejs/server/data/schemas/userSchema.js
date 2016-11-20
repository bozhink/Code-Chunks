var mongoose = require('mongoose');

var UserSchema = function () {
    return {
        profile: {
            firstname: {
                type: String,
                required: true
            },
            lastname: {
                type: String,
                required: true
            },
            username: {
                type: String,
                required: true,
                unique: true,
                lowercase: true
            },
            email: {
                type: String,
                required: true,
                lowercase: true,
                match: [/^\w+([_\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,5})+$/, 'Please fill a valid email address']
            },
            password: {
                type: String,
                required: false,
                maxlength: 512
            },
            picture: {
                type: String,
                required: true,
                match: /^http:\/\//i
            }
        },
        data: {
            oauth: {
                type: String,
                required: true
            },
            cart: [{
                product: {
                    type: mongoose.Schema.Types.ObjectId
                },
                quantity: {
                    type: Number,
                    default: 1,
                    min: 1
                }
            }]
        }
    };
};

module.exports = UserSchema;