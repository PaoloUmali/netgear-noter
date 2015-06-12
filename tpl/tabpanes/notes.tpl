<div role="tabpanel" class="tab-pane fade in" id="notes">
<div id="wrapNotes">
	<button class="btn btn-xs btn-danger pull-right" ng-click="clearNotes()">Clear All notes</button>
	<h3>Full Notes</h3>
	<small>Tips: Copy paste header texts below for reporting. Click index # to edit note. Click issue to add meta notes.</small>
	<hr>
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default" ng-repeat="note in notes | orderBy:'-timestamp'">
					<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<span class="fn-inquiry"><small style="color:crimson;cursor:pointer" ng-click="editNote(note)" title="Click to Edit Note #{{notes.length - $index}}, Case#: {{note.caseNo}}, {{note.timestamp}}">[{{notes.length - $index}}]{{note.caseNo?' / Case#: '+note.caseNo:''}}</small> <a data-toggle="collapse" data-parent="#accordion" href="#collapse{{notes.length - $index}}" title="Click to view full note/add notes"><u><i>{{note.inquiry}}</i></u></a></span>
								<div class="btn-group btn-group-xs" role="group" aria-label="...">
									<button type="button" class="btn btn-default"><span title="Warranty: {{note.warranty?note.warranty:'No Info'}}">? </span></button>
									<button type="button" class="btn btn-{{note.resolved?'success':'danger'}}" title="Resolved: {{note.resolved?'Yes':'No'}}">R:{{note.resolved?'Y':'N'}} </button>
									<button type="button" class="btn btn-{{note.gearhead?'success':'danger'}}" title="Gearhead Pitched: {{note.gearhead?'Yes':'No'}}">GH:{{note.gearhead?'Y':'N'}} </button>
								</div>
								<small style="display:block">***{{note.noSaleReason}}***</small>
							</h4>
					</div>
					<div id="collapse{{notes.length - $index}}" class="panel-collapse collapse" role="tabpanel">
							<div class="panel-body">
								<input class="form-control input-sm" ng-model="note.noSaleReason" placeholder="Additional Notes / Report Summary / No Sale Reason?">
								<hr>
								<!--start note-->
								<div class="caseNote" contenteditable="false">
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
								<!--end note-->
							</div><!-- /panel-body -->
					</div>
			</div>
	</div>







</div><!-- #wrapNotes -->
</div>