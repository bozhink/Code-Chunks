/* 
Create a function that:
*   **Takes** a collection of books
*   Each book has propeties `title` and `author`
**  `author` is an object that has properties `firstName` and `lastName`
*   **finds** the most popular author (the author with biggest number of books)
*   **prints** the author to the console
*	if there is more than one author print them all sorted in ascending order by fullname
*   fullname is the concatenation of `firstName`, ' ' (empty space) and `lastName`
*   **Use underscore.js for all operations**
*/

function solve(){
	function getFullName(person) {
		return person.firstName + ' ' + person.lastName;
	}

	return function (books) {
		var authors = [],
			maxNumberOfBooks = 1;

		if (!Array.isArray(books)) {
			throw new Error('"students" schould be an array');
		}

		if (books.length < 1) {
			return authors;
		}

		_.chain(books)
			.map(function (book) {
				book.author.fullName = getFullName(book.author);
				return book;
			})
			.groupBy(function (book) {
				return book.author.fullName;
			})
			.each(function (value, key) {
				var author = {
					name: key,
					numberOfBooks: value.length
				};

				authors.push(author);
			});

		authors = _.chain(authors)
			.sortBy(function (author) {
				return author.name;
			})
			.sortBy(function (author) {
				return -author.numberOfBooks;
			})
			.value();

		maxNumberOfBooks = _.first(authors).numberOfBooks;

		_.chain(authors)
			.filter(function (author) {
				return author.numberOfBooks === maxNumberOfBooks;
			})
			.each(function (author) {
				console.log(author.name);
			});
	};
}

module.exports = solve;
