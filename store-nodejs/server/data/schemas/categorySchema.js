var CategorySchema = function () {
    return {
        _id: {
            type: String
        },
        parent: {
            type: String,
            ref: 'Category'
        },
        ancestors: [{
            type: String,
            ref: 'Category'
        }]
    };
};

module.exports = CategorySchema;