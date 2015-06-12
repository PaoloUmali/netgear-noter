angular.module('myApp', ['ngCookies', 'ngClipboard', 'LocalStorageModule'])

// cookie
.constant('cookieExpiration', 60*11)//expiration time of cookies, in minutes(60*11)
.constant('cookieUpdate', 20)//update time of cookies, in seconds(20)
.config(['$cookiesProvider', 'cookieExpiration', function($cookiesProvider, cookieExpiration){
	var now = new Date();
	console.log('Cookie Expiration:', $cookiesProvider.defaults.expires = new Date(now.getTime() + cookieExpiration*60000));//cookie expires after cookieExpiration minutes
}])

// specify flash file
.config(['ngClipProvider', function(ngClipProvider) {
	ngClipProvider.setPath("bower_components/zeroclipboard/dist/ZeroClipboard.swf");
}])

// local storage
.config(function (localStorageServiceProvider) {
	localStorageServiceProvider
		.setPrefix('noter')
		.setStorageCookie(1)
})

.run(['$rootScope', 
	'$http', 
	'user', 
	function($rootScope, $http, user){

	$rootScope.ph = {};

	// init data, placeholders: $rootScope.ph
	$http.get('data/fields.json').success(function(data) {
		$rootScope.fields = data;
		angular.forEach($rootScope.fields, function(val, key, obj) {
			this[val.id] = val;
		}, $rootScope.ph);
	})

	// init data, more vars
	$http.get('data/contacts.json').success(function(data) {$rootScope.contacts = data;})
	$http.get('data/scripts.json').success(function(data) {$rootScope.scripts = data;})
	$http.get('data/kbs.json').success(function(data) {$rootScope.kbs = data;})
	$http.get('data/links.json').success(function(data) {$rootScope.links = data;})
	$http.get('data/tss.json').success(function(data) {$rootScope.tss = data;})
	$http.get('data/devices.json').success(function(data) {$rootScope.devices = data;})

	$rootScope.tsCollection = [];

	// defaults
	$rootScope.noteMaster = {
		ispTech:false,
		newProduct:false,
		resolved:false,
		warranty:'',
		kb:false,
		gearhead:false,
		survey:false,
		name:'',
		caseNo:'',
		modelNo:'',
		serial:'',
		callbackNo:'',
		inquiry:'',
		history:'',
		ts:'',
		resoSum:'',
		noSaleReason:'',
		timed:true
	};
	
	// factories
	$rootScope.user = user;
	
}])

.run(function($window){
	// safe unload
	$window.onbeforeunload = function() {
		return "Are you sure you want to navigate away and maybe lose your notes?";
	}
})

// manually boostrap app
angular.element(document).ready(function() {
	angular.bootstrap(document, ['myApp']);
});