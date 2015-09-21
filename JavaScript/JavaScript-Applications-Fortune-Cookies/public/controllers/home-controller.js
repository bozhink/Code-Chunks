/*
Shows all fortune cookies

   Available to all users, logged-in or not
   Provides a way to sort the cookies by likes or shareDate
   Provides a way to filter fortune cookies by category

*/
var homeController = function() {

  function all(context) {
    templates.get('home')
      .then(function(template) {
        context.$element().html(template());
      });
  }

  return {
    all: all
  };
}();
