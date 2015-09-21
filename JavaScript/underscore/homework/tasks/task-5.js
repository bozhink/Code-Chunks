/* 
Create a function that:
*   **Takes** an array of animals
*   Each animal has propeties `name`, `species` and `legsCount`
*   **finds** and **prints** the total number of legs to the console in the format:
*   "Total number of legs: TOTAL_NUMBER_OF_LEGS"
*   **Use underscore.js for all operations**
*/

function solve(){
	return function (animals) {
		var result = [];

		if (!Array.isArray(animals)) {
			throw new Error('"students" schould be an array');
		}

		if (animals.length < 1) {
			return result;
		}

		result = _.chain(animals).pluck('legsCount')
		.reduce(function (item, sum) {
			return sum + (+item);
		}, 0);

		console.log('Total number of legs: ' + result);
	};
}

module.exports = solve;
