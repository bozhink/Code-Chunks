var expect = require('chai').expect;

function sum(numbers) {
	if (!(Array.isArray(numbers))) {
		numbers = [].slice.call(arguments, 0);
	}

	return numbers.reduce(function(s, n) {
		return s + n;
	}, 0);
}

describe('#sum 1', function() {
	it('expects sum([]) to return 0', function() {
		var actual = sum([]);
		expect(actual).to.equal(0);
	});

	it('expects sum() to return 0', function() {
		var actual = sum();
		expect(actual).to.equal(0);
	});

	it('expects sum(1, 2, 3, 4) to return 10', function() {
		var actual = sum(1, 2, 3, 4);
		expect(actual).to.equal(10);
	});

	it('expects sum([1, 2, 3, 4]) to return 10', function() {
		var actual = sum([1, 2, 3, 4]);
		expect(actual).to.equal(10);
	});

	it('expects sum([1, -1]) to return 0', function() {
		var actual = sum([1, -1]);
		expect(actual).to.equal(0);
	});

	it('expects sum(null) to return 0', function() {
		var actual = sum(null);
		expect(actual).to.equal(0);
	});
});

describe('#sum 2', function() {
	it('expects sum([]) to return 0', function() {
		var actual = sum([]);
		expect(actual).to.equal(0);
	});

	it('expects sum() to return 0', function() {
		var actual = sum();
		expect(actual).to.equal(0);
	});

	it('expects sum(1, 2, 3, 4) to return 10', function() {
		var actual = sum(1, 2, 3, 4);
		expect(actual).to.equal(10);
	});

	it('expects sum([1, 2, 3, 4]) to return 10', function() {
		var actual = sum([1, 2, 3, 4]);
		expect(actual).to.equal(10);
	});

	it('expects sum(null) to return 0', function() {
		var actual = sum(null);
		expect(actual).to.equal(0);
	});

	before(function() {
		console.log('BEFORE');
	});

	after(function() {
		console.log('AFTER');
	});

	beforeEach(function() {
		console.log('BEFORE EACH');
	});

	afterEach(function() {
		console.log('AFTER EACH');
	});
});