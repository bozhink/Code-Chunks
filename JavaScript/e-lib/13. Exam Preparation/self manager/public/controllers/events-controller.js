var eventsController = (function () {

    function all(context) {
        var events,
            category = this.params.category || null;

        data.events.get()
            .then(function (resEvents) {
                events = _.chain(resEvents)
                    .map(controllerHelpers.fixDate)
                    .groupBy(controllerHelpers.groupByCategory)
                    .map(controllerHelpers.parseGroups)
                    .value();

                if (category) {
                    events = _.filter(events, controllerHelpers.filterByCategory(category));
                }

                return templates.get('events');
            })
            .then(function (template) {
                context.$element().html(template(events));
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    function add(context) {
        templates.get('event-add')
            .then(function (template) {
                context.$element().html(template());

                $('#tb-event-date').datepicker();
                $('#tb-event-time').timepicker();

                $('#btn-event-add')
                    .on('click', function () {
                        var user = $('#tb-event-users').val(),
                            users = (!!user.trim()) ? [user] : [], 
                            event = {
                                title: $('#tb-event-title').val(),
                                category: $('#tb-event-category').val(),
                                description: $('#tb-event-description').val(),
                                date: $('#tb-event-date').val() + ' ' + $('#tb-event-time').val(),
                                users: users
                            };
                    
                        if (event.title.replace(/\s+/g, '').length < 1) {
                            $('#div-event-title').addClass('has-error');
                            errorProvider.raiseError('Title schould not be empty.');
                        } else {
                            data.events.add(event)
                                .then(function (event) {
                                    toastr.success('Event "' + event.title + '" created!');
                                    context.redirect('#/events?=' + event.category);
                                })
                                .catch(function (err) {
                                    errorProvider.raiseError('Event "' + event.title + '" not created!<br/>' + err.responseText);
                                });
                        }
                    });

                return data.categories.get();
            })
            .then(function (categories) {
                $('#tb-event-category')
                    .autocomplete({
                        delay: 0,
                        source: categories
                    });

                return data.users.get();
            })
            .then(function (users) {
                users = _.map(users, function (user) {
                        return user.username;
                    });

                $('#tb-event-users')
                    .autocomplete({
                        delay: 0,
                        source: users
                    });
            });
    }

    return {
        all: all,
        add: add
    };
}());