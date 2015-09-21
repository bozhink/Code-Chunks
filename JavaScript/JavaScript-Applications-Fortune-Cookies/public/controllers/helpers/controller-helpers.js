var controllerHelpers = function () {
    function groupByCategory(item) {
        return item.category;
    }

    function parseGroups(items, category) {
        return {
            category: category,
            items: items
        };
    }

    function filterByCategory(category) {
        return function (group) {
            return group.category.toLowerCase() === category.toLowerCase();
        };
    }

    function fixDate_old(event) {
        return {
            title: event.title,
            date: moment(event.date).format('MMM Do YYYY, hh:mm'),
            //timeRemaining: moment(event.date).fromNow(),
            description: event.description,
            category: event.category
        };
    }

    function fixDate(item) {
        var newItem = Object.create(item);
        newItem.date = moment(item.shareDate).format('MMM Do YYYY, hh:mm');
        return newItem;
    }

    return {
        groupByCategory: groupByCategory,
        parseGroups: parseGroups,
        filterByCategory: filterByCategory,
        fixDate: fixDate
    };
}();