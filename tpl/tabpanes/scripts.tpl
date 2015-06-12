	<div role="tabpanel" class="tab-pane fade in" id="scripts">
<div id="wrapScripts">
		<table class="table table-bordered tabled-condensed table-striped">
			<thead>
				<tr>
					<th>Scripts</th>
					<th>
						<div class="input-group input-group-sm">
							<span class="input-group-addon" id="filter-kbs">Search Scripts</span>
							<input type="text" class="form-control" ng-model="filterScripts">
							<span class="input-group-btn"><button class="btn btn-default" type="button" ng-click="filterScripts=''">Clear</button></span>
						</div>
					</th>
				</tr></thead>
			<tbody><tr ng-repeat="script in scripts | filter:filterScripts"><td style="width:20%">{{script.name}}</td><td>{{script.text}}</td></tr></tbody>
		</table>
		<hr>
		<h3>Import your own scripts</h3>
		<textarea style="margin-bottom:10px" class="form-control" rows="2" placeholder="Paste your own valid JSON, like the example below" ng-model="ownScripts"></textarea>
		<button class="btn btn-primary btn-sm" ng-class="{disabled: !ownScripts}" ng-click="importJsonToScripts(ownScripts)">Import Now!</button>
		<hr>
		<div class="well well-sm">
			<pre contenteditable="true">{{ scripts | json }}</pre>
		</div>
</div>
	</div>
