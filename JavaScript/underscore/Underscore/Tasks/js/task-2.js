/*
Create a function that:
*   Takes an array of students
    *   Each student has a `firstName`, `lastName` and `age` properties
*   **finds** the students whose age is between 18 and 24
*   **prints**  the fullname of found students, sorted lexicographically ascending
    *   fullname is the concatenation of `firstName`, ' ' (empty space) and `lastName`
*   **Use underscore.js for all operations**
*/

function solve() {
    function getFullName(student) {
        return student.firstName + ' ' + student.lastName;
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
                var age = +student.age;
                return 18 <= age && age <= 24;
            })
            .sortBy(getFullName)
            .each(function(student) {
                console.log(getFullName(student));
            });
    };
}

module.exports = solve;
