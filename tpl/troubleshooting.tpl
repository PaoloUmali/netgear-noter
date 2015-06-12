<div id="wrapTroubleshooting" ng-controller="MytsCtrl">
<!-- myts tab -->
				<!-- Single button -->
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						{{chosenTS.name || defaultTs}} <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li ng-repeat="tsEntry in tsCollection"><a href="#" ng-click="choseATs(tsEntry)">{{tsEntry.name}}</a></li>
					</ul>
				</div>
				<hr>

				<!-- table for steps -->
				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th>Click on steps done</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="step in chosenTS.steps" ng-controller="stepDoneCtrl" ng-class="{success: step.done}">
							<td>
								<label style="cursor:pointer"><input type="checkbox" ng-click="toggleDone(step)" ng-model="done" ng-init="done=step.done"> {{step.text | stripChoices}}</label>
								<div class="btn-group" role="group" ng-show="step.selected">
									<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										{{step.selected}}
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li ng-repeat="choice in step.choices"><a href="#" ng-click="step.selected=choice">{{choice}}</a></li>
									</ul>
								</div>

						</td>

						</tr>
					</tbody>
				</table>

				<!-- mini notes -->
				<h4>Subnotes</h4>
				<div class="well well-sm caseNote" contenteditable="true">
				<span ng-repeat="step in chosenTS.steps" style="display:block" ng-show="step.done">- {{step.text | stripChoices}}{{step.selected?', '+step.selected:''}}</span>
				</div>
				<div id="tsImporter">
					<hr>
					<h3>Import your own Troubleshooters</h3>
					<textarea style="margin-bottom:10px" class="form-control" rows="2" placeholder="Paste your own valid JSON, like the example below" ng-model="ownTroubleshooters"></textarea>
					<button class="btn btn-primary btn-sm" ng-class="{disabled: !ownTroubleshooters}" ng-click="importJsonToTss(ownTroubleshooters)">Import Now!</button>
					<hr>
					<div class="well well-sm">
						<pre contenteditable="true">{{ tss | json }}</pre>
					</div>
				</div>
</div>