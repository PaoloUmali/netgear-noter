angular.module('myApp')

.filter('stripChoices', function() {
	return function(input) {
		return s1 = input.replace(/\((.*)\)+$/, '');
	};
})

.filter('getChoices', function() {
	return function(input) {
		res = input.match(/\((.*)\)$/);
		return res ? res[1].split('|') : [];
	};
})


.controller('MyCtrl', function ($scope, user, $cookieStore, cookieUpdate, $interval, $timeout, localStorageService, $window) {
	$scope.user = user;
	$scope.notes = [];


	// pristine?
	$scope.isNotePristine = function(){
		return angular.equals($scope.note, $scope.noteMaster)
	}

	//watcher for timer
	$scope.startTimer = function() {
		if($scope.isNotePristine()) {
			$('#timer-row').html('');
			var now = new Date();
			$scope.note.timed = true;
			console.log('Timer start:', new Date(now.getTime()));
		}
		else {
			$('#timer-row').append('<div class="col-xs-2 crimson"></div>');
		}
	}
	$scope.startTimer();
	$interval( function(){ $scope.startTimer(); }, 10*60*1000);//10minutes 10*60*1000


	$scope.deviceModelKeypress = function(keyEvent) {
		if (keyEvent.which === 13) {
			$scope.openSupportProductPage();
			keyEvent.preventDefault();
		}
	}

	// resets current note
	$scope.reset = function(){
		$scope.note = angular.copy($scope.noteMaster);
		$scope.startTimer();
	}

	$scope.openSupportProductPage = function(){
		$window.open('http://support.netgear.com/product/'+$scope.note.modelNo, 'myDevicePage');
	};

	$scope.openSupportProductPageThroughDropdown = function(modelNo){
		$scope.note.modelNo = modelNo;
		$scope.openSupportProductPage();
	};


	// clear defaults only but keep object
	$scope.clearNote = function(){
		$scope.note = angular.extend($scope.note, $scope.noteMaster)
	}

	$scope.caseNoteToClipboard = function(note){
		return $scope.caseNote = 
				"==================== Caller\'s Information ====================\r\n" +
				(note.name?"Name: "+note.name+"\r\n":'')+
				(note.callbackNo?"Tel No: "+note.callbackNo+"\r\n":'')+
				(note.email?"Email Address: "+note.email+"\r\n":'')+
				(note.caseNo?"Case #: "+note.caseNo+"\r\n":'')+

				(note.isp && note.techName && note.ispTech?"Technician Name: "+note.techName+"\r\n":'')+
				(note.isp && note.techID && note.ispTech?"Tech ID: "+note.techID+"\r\n":'')+

				(note.serial?"Serial Number: "+note.serial+"\r\n":'')+
				(note.modelNo?"Device Name: "+note.modelNo+"\r\n":'')+
				(note.purchaseDate && note.newProduct?'Purchase Date: '+note.purchaseDate+"\r\n":'')+
				(note.store && note.newProduct?'Store: '+note.store+"\r\n":'')+
				"\r\n"+
				"===================== Customer's Inquiry =====================\r\n" +
				(note.inquiry).replace(/\n\r?/g, "\r\n")+"\r\n\r\n"+
				"============== Technical History and Information =============\r\n" +
				(note.isp?"ISP: "+note.isp+"\r\n":'')+
				(note.history).replace(/\n\r?/g, "\r\n")+"\r\n\r\n"+
				"================== Troubleshooting Details ===================\r\n" +
				(note.warranty?"Advised entitlements: "+note.warranty+"\r\n":'') +
				(note.ts).replace(/\n\r?/g, "\r\n")+"\r\n\r\n"+
				"===================== Resolution Summary =====================\r\n" +
				(note.resoSum)+"\r\n\r\n"+
				"Issue Resolved: "+(note.resolved?'Yes':'No')+"\r\n"+
				"Informed about the KB/NETGEAR online support: "+(note.kb?'Yes':'No')+"\r\n"+
				"Informed about GH/Soft Upsell: "+(note.gearhead?'Yes':'No')+"\r\n"+
				"Survey: "+(note.survey?'Yes':'No');

	}

	$scope.summaryToClipboard = function(note){
		return $scope.summary = 
				(note.caseNo?"Case #: "+note.caseNo+"\r\n":'')+
				(note.modelNo?"Device Name: "+note.modelNo+"\r\n":'')+
				(note.warranty?"Entitlements: "+note.warranty+"\r\n":'') +
				(note.inquiry?"Issue: "+note.inquiry.replace(/\n\r?/g, "\r\n")+"\r\n":'') +
				"\r\n"+
				"Probing:"+"\r\n"+
				(note.isp?"ISP: "+note.isp+"\r\n":'')+
				(note.history).replace(/\n\r?/g, "\r\n")+"\r\n\r\n"+
				"Troubleshooting:"+"\r\n"+(note.ts).replace(/\n\r?/g, "\r\n")+"\r\n"
	}

	$scope.addNote = function(note){
		note.timestamp = new Date().toLocaleString();
		$scope.notes.push($scope.note);
		// save always
		$cookieStore.put('note', $scope.note);
		localStorageService.set('notes', $scope.notes);
		$scope.reset();
	}

	$scope.editNote = function(note){
		$scope.note = (note);
		$('#myTab a:first').tab('show');
	}

	$scope.saveNote = function(note){
		$scope.note = (note);
		$cookieStore.put('note', $scope.note);
		localStorageService.set('notes', $scope.notes);
		$scope.reset();
		$('#myTab a:first').tab('show')
	}

	//imports
	$scope.importJsonToScripts = function(json){
		$scope.scripts = angular.fromJson(json);
		$scope.ownScripts = '';
	}


	$scope.clearNotes = function(){
		$scope.notes = [];
		localStorageService.set('notes', $scope.notes);
	}

	// store current note to cookie every cookieUpate milliseconds, useful if browser crashes
	$scope.callAtInterval = function() {
		//dont store if default
		if(!$scope.isNotePristine()) {
			$cookieStore.put('note', $scope.note);
			//console.log($scope.note);
		}
		localStorageService.set('notes', $scope.notes);
		//console.log($scope.notes);
	}
	$interval( function(){ $scope.callAtInterval(); }, cookieUpdate*1000);


	// reset or get from cookie
	if ($cookieStore.get('note')) {
		// if storage notes is not empty, then build notes
		if(localStorageService.get('notes')) $scope.notes = localStorageService.get('notes');
		if ($scope.notes.length != 0){
			$scope.reset();
		}
		else {
			$scope.note =  $cookieStore.get('note');
			$scope.addNote($scope.note);
			$scope.editNote($scope.notes[$scope.notes.length-1]);
		}
	}
	else {
		localStorageService.remove('notes');
		$scope.reset();
	}


})

// Links > FilterKB
.controller('FilterKbCtrl', function($scope){
	$scope.clearFilterKb = function(){
		$scope.filterKb = "";
	}
})

// MytsCtrl
.controller('MytsCtrl', function($scope, $rootScope){
	$scope.defaultTs = 'Choose TS';
	$scope.chosenTs = {};




	/* transform tss objects to useful objects 
	[
	{name:'SomeTS1',
	 steps:[
	  {text:'someStep1(choice1|choice2)', done:false, choices:[], selected:''},
	  {text:'someStep2(choice1|choice2)', done:false, choices:[], selected:''},
	 ]},
	{name:'SomeTS2',
	 steps:[
	  {text:'someStep1(choice1|choice2)', done:false, choices:[], selected:''},
	  {text:'someStep2(choice1|choice2)', done:false, choices:[], selected:''},
	 ]},
	]
	*/
	$scope.buildTsCollection = function(tss) {
		$rootScope.tsCollection = [];
		angular.forEach(tss, function(ts) {
		//console.log('ts', ts);
		for(var tsName in ts){
			tsRawSteps = ts[tsName];
			tsStepsObjArr = [];
			tsStepsObj = {};
			for(var i in tsRawSteps){
				tsStepsObj = {text: tsRawSteps[i], done: false};
				tsStepsObjArr.push(tsStepsObj);
				//console.log('tsStepsObj', tsStepsObj);
			}
		}
			$rootScope.tsCollection[$rootScope.tsCollection.length] = {'name': tsName, 'steps': tsStepsObjArr};
		});
	//console.log('tsCollection', $scope.tsCollection);
	}
	$scope.buildTsCollection($scope.tss);

	$scope.importJsonToTss = function(json){
		$rootScope.tss = angular.fromJson(json);
		$scope.buildTsCollection($rootScope.tss);
		$scope.ownTroubleshooters = '';
	}

	

	$scope.choseATs = function(tsObject){
		$scope.defaultTs = tsObject.name;
		$scope.chosenTS = tsObject;
		//console.log($scope.chosenTS.steps);
		angular.forEach($scope.chosenTS.steps, function(step) {
			step.done = false;
		})
	}
	$scope.toggleDone = function(step){
		step.done = !step.done;
	}
})

.controller('stepDoneCtrl', function($scope, $filter){
 $scope.done = false;
 if ($filter('getChoices')($scope.step.text)) $scope.step.choices = $filter('getChoices')($scope.step.text);
 if ($scope.step.choices) $scope.step.selected = $scope.step.choices[0];
})


