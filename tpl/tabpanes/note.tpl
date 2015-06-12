<div role="tabpanel" class="tab-pane fade in" id="note">
<div id="wrapNote">
<form id="form1">
	<div class="row">
		<!-- %name -->
		<div class="col-xs-8">
			<div class="input-group" ng-class="{'has-success':note.name, 'has-error':!note.name}">
				<span class="input-group-addon" title="{{ph.name.title}}" data-toggle="tooltip">{{ph.name.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.name.text}}" ng-model="note.name" ACCESSKEY="{{ph.name.letter}}">
			</div>
		</div><!--/.col-xs-8-->
		<!-- %callbackNo -->
		<div class="col-xs-4">
			<div class="input-group" ng-class="{'has-success':note.callbackNo, 'has-error':!note.callbackNo}">
				<span class="input-group-addon" title="{{ph.callbackNo.title}}" data-toggle="tooltip">{{ph.callbackNo.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.callbackNo.text}}" ng-model="note.callbackNo" ACCESSKEY="{{ph.callbackNo.letter}}">
			</div>
		</div><!--/.col-xs-4-->
	</div><!--/.row-->

	<div class="row">
		<!-- %caseNo -->
		<div class="col-xs-3">
			<div class="input-group" ng-class="{'has-success':note.caseNo, 'has-error':!note.caseNo}">
				<span class="input-group-addon" title="{{ph.caseNo.title}}" data-toggle="tooltip">{{ph.caseNo.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.caseNo.text}}" ng-model="note.caseNo" ACCESSKEY="{{ph.caseNo.letter}}">
			</div>
		</div><!--/.col-xs-3-->
		<!-- %email -->
		<div class="col-xs-5">
			<div class="input-group">
				<span class="input-group-addon" title="{{ph.email.title}}" data-toggle="tooltip">{{ph.email.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.email.text}}" ng-model="note.email" ACCESSKEY="{{ph.email.letter}}">
			</div>
		</div><!--/.col-xs-5-->
		<!-- %warranty -->
		<div class="col-xs-4">
			<div class="input-group" ng-class="{'has-success':note.warranty, 'has-error':!note.warranty}">
				<span class="input-group-addon" title="{{ph.warranty.title}}" data-toggle="tooltip">{{ph.warranty.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.warranty.text}}" ng-model="note.warranty" ACCESSKEY="{{ph.warranty.letter}}">
			</div>
		</div><!--/.col-xs-4-->
	</div><!--/.row-->

	<div class="row">
		<!-- %serial -->
		<div class="col-xs-4">
			<div class="input-group" ng-class="{'has-success':note.serial, 'has-error':!note.serial}">
				<span class="input-group-addon" title="{{ph.serial.title}}" data-toggle="tooltip">{{ph.serial.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.serial.text}}" ng-model="note.serial" ACCESSKEY="{{ph.serial.letter}}">
			</div>
		</div><!--/.col-xs-4-->
		<!-- %modelNo -->
		<div class="col-xs-4">
			<div class="input-group input-group-sm">
					<span class="input-group-addon" title="{{ph.modelNo.title}}" data-toggle="tooltip">{{ph.modelNo.letter}}</span>
					<input type="text" class="form-control input-sm" placeholder="{{ph.modelNo.text}}" ng-model="note.modelNo" ACCESSKEY="{{ph.modelNo.letter}}" ng-keypress="deviceModelKeypress($event)">
					<div class="input-group-btn">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
							<ul class="dropdown-menu dropdown-menu-right">
									<li ng-repeat="device in devices | filter:note.modelNo"><a href="javascript:void(0)" title="View Netgear product support page" ng-click="openSupportProductPageThroughDropdown(device.model)">{{device.model}}</a></li>
							</ul>
					</div><!-- /btn-group -->
			</div><!-- /input-group -->
		</div><!--/.col-xs-4-->
		<!-- %isp -->
		<div class="col-xs-4">
			<div class="input-group">
				<span class="input-group-addon" title="{{ph.isp.title}}" data-toggle="tooltip">{{ph.isp.letter}}</span>
				<input type="text" class="form-control input-sm" placeholder="{{ph.isp.text}}" ng-model="note.isp" ACCESSKEY="{{ph.isp.letter}}">
			</div>
		</div><!--/.col-xs-4-->
	</div><!--/.row-->

	<div class="row">
		<div class="col-xs-2">
			<table class="table tabled-condensed table-striped" id="visRems">
				<thead>
					<tr>
						<th>
							<div ng-include src="'tpl/modal.tpl'"></div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr><td><label class="label label-default" ng-class="{'label-success':note.newProduct}" title="{{ph.newProduct.title}}"><input type="checkbox" ng-model="note.newProduct">{{ph.newProduct.text}}</label></td></tr>
					<tr><td><label class="label label-default" ng-class="{'label-success':note.ispTech}" title="{{ph.ispTech.title}}"><input type="checkbox" ng-model="note.ispTech">{{ph.ispTech.text}}</label></td></tr>
					
					<tr><td><label class="label" ng-class="{'label-danger':!note.kb, 'label-success':note.kb}" title="{{ph.kb.title}}"><input type="checkbox" ng-model="note.kb"> {{ph.kb.text}}</label></td></tr>
					<tr><td><label class="label" ng-class="{'label-danger':!note.gearhead, 'label-success':note.gearhead}" title="{{ph.gearhead.title}}"><input type="checkbox" ng-model="note.gearhead">{{ph.gearhead.text}}</label></td></tr>
					<tr><td><label class="label" ng-class="{'label-danger':!note.survey, 'label-success':note.survey}" title="{{ph.survey.title}}"><input type="checkbox" ng-model="note.survey">{{ph.survey.text}}</label></td></tr>
					<tr><td><label class="label" ng-class="{'label-danger':!note.resolved, 'label-success':note.resolved}" title="{{ph.resolved.title}}"><input type="checkbox" ng-model="note.resolved">{{ph.resolved.text}}</label></td></tr>
				</tbody>
			</table>
		</div><!--/.col-xs-2-->
		<div class="col-xs-10">

			<div class="row" ng-show="note.newProduct" style="margin-bottom:10px">
				<!-- %purchaseDate -->
				<div class="col-xs-6">
					<div class="input-group" ng-class="{'has-success':note.purchaseDate, 'has-error':!note.purchaseDate}">
						<span class="input-group-addon" title="{{ph.purchaseDate.title}}" data-toggle="tooltip">{{ph.purchaseDate.letter}}</span>
						<input class="form-control input-sm" type="text" placeholder="{{ph.purchaseDate.text}}" title="{{ph.purchaseDate.title}}" ng-model="note.purchaseDate"/>
					</div>
				</div><!--/.col-xs-6-->
				<!-- %store -->
				<div class="col-xs-6">
					<div class="input-group" ng-class="{'has-success':note.store, 'has-error':!note.store}">
						<span class="input-group-addon" title="{{ph.store.title}}" data-toggle="tooltip">{{ph.store.letter}}</span>
						<input class="form-control input-sm" type="text" placeholder="{{ph.store.text}}" title="{{ph.store.title}}" ng-model="note.store"/>
					</div>
				</div><!--/.col-xs-6-->
			</div><!--/.row-->

			<div class="row" ng-show="note.ispTech" style="margin-bottom:10px">
				<!-- %techName -->
				<div class="col-xs-8">
					<div class="input-group" ng-class="{'has-success':note.techName, 'has-error':!note.techName}">
						<span class="input-group-addon" title="{{ph.techName.title}}" data-toggle="tooltip">{{ph.techName.letter}}</span>
						<input class="form-control input-sm" type="text" placeholder="{{ph.techName.text}}" title="{{ph.techName.title}}" ng-model="note.techName"/>
					</div>
				</div><!--/.col-xs-8-->
				<!-- %techID -->
				<div class="col-xs-4">
					<div class="input-group" ng-class="{'has-success':note.techID, 'has-error':!note.techID}">
						<span class="input-group-addon" title="{{ph.techID.title}}" data-toggle="tooltip">{{ph.techID.letter}}</span>
						<input class="form-control input-sm" type="text" placeholder="{{ph.techID.text}}" title="{{ph.techID.title}}" ng-model="note.techID"/>
					</div>
				</div><!--/.col-xs-4-->
			</div><!--/.row-->

			<!-- Customer's Inquiry -->
			<textarea spellcheck="true" class="form-control" rows="2" ng-model="note.inquiry" placeholder="{{ph.inquiry.text}}" title="{{ph.inquiry.title}}" ACCESSKEY="{{ph.inquiry.letter}}"></textarea>
			<!-- Technical History and Information -->
			<textarea spellcheck="true" class="form-control" rows="2" ng-model="note.history" placeholder="{{ph.history.text}}" title="{{ph.history.title}}" ACCESSKEY="{{ph.history.letter}}"></textarea>
			<!-- Troubleshooting Details -->
			<textarea spellcheck="true" class="form-control" rows="12" ng-model="note.ts" placeholder="{{ph.ts.text}}" title="{{ph.ts.title}}" ACCESSKEY="{{ph.ts.letter}}"></textarea>
			<!-- Resolution Summary -->
			<textarea spellcheck="true" class="form-control" rows="1" ng-model="note.resoSum" placeholder="{{ph.resoSum.text}}" title="{{ph.resoSum.title}}" ACCESSKEY="{{ph.resoSum.letter}}"></textarea>
		</div>
	</div><!-- /.row -->
	
	<div class="well well-sm">
		<button class="btn btn-sm btn-primary" ng-click="addNote(note)" ng-show="!note.timestamp" ng-class="{disabled: isNotePristine()}">Log</button>
		<button class="btn btn-sm btn-primary" ng-click="saveNote(note)" ng-show="note.timestamp">Save</button>
		<button class="btn btn-sm btn-default" clip-copy="caseNoteToClipboard(note)" ng-class="{disabled: isNotePristine()}">FullNote to Clipboard</button>
		<button class="btn btn-sm btn-default" clip-copy="summaryToClipboard(note)" ng-class="{disabled: isNotePristine()}">Summary to Clipboard</button>
		<button class="btn btn-sm btn-danger pull-right" ng-click="clearNote()" ng-show="!isNotePristine()">Reset</button>
	</div>
</form>

<!-- #caseNote -->
<h3>Full Note</h3>
<div class="caseNote" id="caseNote" contenteditable="false">
==================== Caller's Information ====================<br>
{{note.name?'Name: '+note.name:''}}<br ng-show="note.name">
{{note.callbackNo?'Tel No: '+note.callbackNo:''}}<br ng-show="note.callbackNo">
{{note.email?'Email Address: '+note.email:''}}<br ng-show="note.email">
{{note.caseNo?'Case #: '+note.caseNo:''}}<br ng-show="note.caseNo">

{{(note.isp && note.techName && note.ispTech)?note.isp+' Technician Name: '+note.techName:''}}<br ng-show="note.techName && note.ispTech">
{{(note.isp && note.techID && note.ispTech)?'Tech ID: '+note.techID:''}}<br ng-show="note.techID && note.ispTech">

{{note.serial?'Serial Number: '+note.serial:''}}<br ng-show="note.serial">
{{note.modelNo?'Device Name: '+note.modelNo:''}}<br ng-show="note.modelNo">
{{(note.purchaseDate && note.newProduct)?'Purchase Date: '+note.purchaseDate:''}}<br ng-show="note.purchaseDate && note.newProduct">
{{(note.store && note.newProduct)?'Store: '+note.store:''}}<br ng-show="note.store && note.newProduct">
<br>
===================== Customer's Inquiry =====================<br>
<pre ng-show="note.inquiry">{{note.inquiry}}</pre>
<br>
============== Technical History and Information =============<br>
{{note.isp?'ISP: '+note.isp:''}}<br ng-show="note.isp">
<pre ng-show="note.history">{{note.history}}</pre>
<br>
================== Troubleshooting Details ===================<br>
{{note.warranty?'Advised entitlements: '+note.warranty:''}}<br ng-show="note.warranty">
<pre ng-show="note.ts">{{note.ts}}</pre>
<br>

===================== Resolution Summary =====================<br>
<pre ng-show="note.resoSum">{{note.resoSum}}</pre>
<br>
Issue Resolved: {{note.resolved?'Yes':'No'}}<br>
Informed about the KB/NETGEAR online support: {{note.kb?'Yes':'No'}}<br>
Informed about GH/Soft Upsell: {{note.gearhead?'Yes':'No'}}<br>
Survey: {{note.survey?'Yes':'No'}}<br>
</div>
<!-- /#caseNote -->
<hr>
<h3>Summary</h3>
	<div class="caseNote" contenteditable="false">
	{{note.caseNo?'Case #: '+note.caseNo:''}}<br ng-show="note.caseNo">
	{{note.modelNo?'Device Name: '+note.modelNo:''}}<br ng-show="note.modelNo">
	{{note.warranty?'Entitlements: '+note.warranty:''}}<br ng-show="note.warranty">
	<pre ng-show="note.inquiry">{{note.inquiry?'Issue: '+note.inquiry:''}}</pre>
	<br ng-show="note.caseNo||note.modelNo||note.warranty||note.inquiry">
	Probing:<br>
	{{note.isp?'ISP: '+note.isp:''}}<br ng-show="note.isp">
	<pre ng-show="note.history">{{note.history}}</pre>
	<br>
	Troubleshooting:<br>
	<pre ng-show="note.ts">{{note.ts}}</pre>
</div>

</div><!-- #wrapNote -->
</div>
