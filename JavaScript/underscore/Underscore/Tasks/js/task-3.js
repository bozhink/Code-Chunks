/*
Create a function that:
*   Takes an array of students
    *   Each student has:
        *   `firstName`, `lastName`, `age` and `marks` properties
        *   `marks` is an array of decimal numbers representing the marks
*   **finds** the student with highest average mark (there will be only one)
*   **prints** to the console  'FOUND_STUDENT_FULLNAME has an average score of MARK_OF_THE_STUDENT'
    *   fullname is the concatenation of `firstName`, ' ' (empty space) and `lastName`
*   **Use underscore.js for all operations**
*/

function solve() {
    function getAverage(data) {
        var len;

        if (!Array.isArray(data)) {
            throw new Error('"data" schould be an array');
        }

        len = data.length;
        if (len < 1) {
            throw new Error('"data" schould be non-empty array');
        }

        return _.reduce(data, function(sum, item) {
            return sum + (+item);
        }, 0) / len;
    }

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

        var bestStudent = _.chain(students)
            .map(function(student) {
                student.score = getAverage(student.marks);
                student.fullName = getFullName(student);
                return student;
            })
            .sortBy('score')
            .last()
            .value();

        console.log(bestStudent.fullName + ' has an average score of ' + bestStudent.score);
    };
}

module.exports = solve;
