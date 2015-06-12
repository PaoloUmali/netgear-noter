describe('myApp', function() {

	describe('Months list view', function() {

		beforeEach(function() {
			browser.get('index.html');
		});


		it('should filter the months as a user types into the search box', function() {

			var monthList = element.all(by.repeater('month in months'));
			var query = element(by.model('query'));

			expect(monthList.count()).toBe(12);

			query.sendKeys('january');
			expect(monthList.count()).toBe(1);

			query.clear();
			query.sendKeys('hea');
			expect(monthList.count()).toBe(2);
		});
	});
});