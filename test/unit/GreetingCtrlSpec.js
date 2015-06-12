describe('MonthsCtrl', function(){

	beforeEach(module('myApp'));

	it('should greet with correct message', inject(function($controller) {
	 var scope = {},
	     ctrl = $controller('GreetingCtrl', {$scope:scope});

	 expect(scope.greeting).toBe('Never stop loving.');
	}));

});