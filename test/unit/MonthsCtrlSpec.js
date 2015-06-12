describe('MonthsCtrl', function(){

	beforeEach(module('myApp'));

	it('should create "months" model with 12 months', inject(function($controller) {
	 var scope = {},
	     ctrl = $controller('MonthsCtrl', {$scope:scope});

	 expect(scope.months.length).toBe(12);
	}));

});