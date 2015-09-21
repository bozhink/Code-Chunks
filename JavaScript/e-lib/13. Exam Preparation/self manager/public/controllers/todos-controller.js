var todosController = (function () {

    function all(context) {
        var todos,
            category = context.params.category || null;

        data.todos.get()
            .then(function (resTodos) {
                todos = _.chain(resTodos)
                    .groupBy(controllerHelpers.groupByCategory)
                    .map(controllerHelpers.parseGroups)
                    .value();

                if (category) {
                    todos = _.filter(todos, controllerHelpers.filterByCategory(category));
                }

                return templates.get('todos');
            })
            .then(function (template) {
                context.$element().html(template(todos));

                $('.todo-box')
                    .on('change', function () {
                        var $checkbox = $(this).find('input'),
                            isChecked = $checkbox.prop('checked'),
                            id = $(this).attr('data-id');

                        data.todos.update(id, {
                                state: isChecked
                            })
                            .then(function (todo) {
                                toastr.clear();
                                toastr.info('TODO "' + todo.text + '" updated!');
                            });
                    });
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function add(context) {
        templates.get('todo-add')
            .then(function (template) {
                context.$element().html(template());

                return data.categories.get();
            })
            .then(function (categories) {
                $('#tb-todo-category')
                    .autocomplete({
                        delay: 0,
                        source: categories
                    });

                $('#btn-todo-add')
                    .on('click', function () {
                        var todo = {
                            text: $('#tb-todo-text').val(),
                            category: $('#tb-todo-category').val()
                        };

                        if (todo.text.replace(/\s+/g, '').length < 1) {
                            $('#div-todo-text').addClass('has-error');
                            errorProvider.raiseError('Todo text content schould not be empty!');
                        } else {
                            data.todos.add(todo)
                                .then(function (todo) {
                                    toastr.success('TODO "' + todo.text + '" added!');
                                    context.redirect('#/todos');
                                });
                        }
                    });
            });
    }

    return {
        all: all,
        add: add
    };
}());
