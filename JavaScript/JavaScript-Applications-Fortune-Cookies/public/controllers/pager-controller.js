var pagerController = (function () {

    var todos,
        numberOfItemsPerPage = 5,
        pageNumberZeroBased = 0,
        pages = [];

    function getPageItems(items, currentPageNumberZeroBased, itemsPerPage) {
        var firstItemIndex = (itemsPerPage | 0) * (currentPageNumberZeroBased | 0),
            lastItemIndex = firstItemIndex + (itemsPerPage | 0),
            result = [];
        items = items || [];
        if (lastItemIndex > firstItemIndex && firstItemIndex >= 0) {
            result = items.slice(firstItemIndex, lastItemIndex);
        }

        return result;
    }

    function getPagination(items, itemsPerPage) {
        var i, pageItems = [], page = {};
        pages = [];
        for (i = 0, pageItems = getPageItems(items, i, itemsPerPage); pageItems.length > 0; ) {
            page = {
                page: i + 1,
                items: pageItems
            };

            pages.push(page);

            i += 1;
            pageItems = getPageItems(items, i, itemsPerPage);
        }
    }

    function redrawPage(context, template) {
        var page = pages[pageNumberZeroBased];
        context.$element().html(template(page));

        $('#btn-prev-page').on('click', function () {
            if (pageNumberZeroBased < 1) {
                toastr.warning('There is no previous page!');
            } else {
                pageNumberZeroBased -= 1;
                redrawPage(context, template);
            }
        });

        $('#btn-next-page').on('click', function () {
            var nextPage = pages[pageNumberZeroBased + 1];
            if (nextPage === undefined) {
                toastr.warning('No more pages!');
            } else {
                pageNumberZeroBased += 1;
                redrawPage(context, template);
            }
        });
    }

    function all(context) {
        var category = context.params.category || null;

        data.todos.get()
            .then(function (resTodos) {
                todos = _.chain(resTodos).groupBy(controllerHelpers.groupByCategory).map(controllerHelpers.parseGroups).value();

                if (category) {
                    todos = _.filter(todos, controllerHelpers.filterByCategory(category));
                }

                return templates.get('todos-paging');
            })
            .then(function (template) {
                getPagination(todos, numberOfItemsPerPage);
                redrawPage(context, template);
            })
            .catch(function (err) {
                errorProvider.raiseError(err);
            });
    }

    return {
        all: all
    };
}());
