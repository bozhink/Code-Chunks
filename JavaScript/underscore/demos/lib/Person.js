(function () {
	// Person object
	var Person = Object.create({
		init: function (fname, lname, age) {
			this.fname = fname;
			this.lname = lname;
			this.age = age;
			return this;
		},

		fullname: function () {
			return this.fname + ' ' + this.lname;
		}
	});

	if (typeof exports !== 'undefined') {
		if (typeof module !== 'undefined' && module.exports) {
			exports = module.exports = Person;
		}
		// exports.Person = Person;
	}
});