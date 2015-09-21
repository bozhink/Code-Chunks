/*
Create a function that:
*   Takes an array of students
*   Each student has a `firstName` and `lastName` properties
*   **Finds** all students whose `firstName` is before their `lastName` alphabetically
*   Then **sorts** them in descending order by fullname
*   fullname is the concatenation of `firstName`, ' ' (empty space) and `lastName`
*   Then **prints** the fullname of founded students to the console
*   **Use underscore.js for all operations**
*/

function solve() {
	function getFullName(person) {
		return person.firstName + ' ' + person.lastName;
	}

	return function(students) {
		if (!Array.isArray(students)) {
			throw new Error('"students" schould be an array');
		}

		if (students.length < 1) {
			return [];
		}

		_.chain(students)
			.filter(function(student) {
				return student.firstName < student.lastName;
			})
			.sortBy(getFullName)
			.reverse()
			.each(function(student) {
				console.log(getFullName(student));
			});
	};
}

module.exports = solve;
