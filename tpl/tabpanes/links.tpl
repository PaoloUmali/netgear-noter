	<div role="tabpanel" class="tab-pane fade in" id="links">
<div id="wrapLinks" ng-controller="FilterKbCtrl">
		<ul class="list-unstyled">
			<li ng-repeat="link in links"><a href="{{link.link}}" target="{{link.target}}" style="text-decoration:underline">{{link.title}}</a></li>
		</ul>
		<hr>
		<table class="table table-bordered tabled-condensed">
			<thead>
				<th>
					<div class="input-group input-group-sm">
						<span class="input-group-addon" id="filter-kbs">Search Common KBs</span>
						<input type="text" class="form-control" ng-model="filterKb">
						<span class="input-group-btn"><button class="btn btn-default" type="button" ng-click="clearFilterKb()">Clear</button></span>
					</div>
				</th>
			</thead>
			<tbody>
				<tr ng-repeat="kb in kbs | filter:filterKb">
					<td><a href="http://netgear-us1.custhelp.com/app/answers/detail/a_id/{{kb.number}}/kw/qa" target="myLinksWindows">{{kb.title}} / {{kb.number}}</a></td>
				</tr>
			</tbody>
		</table>
</div>
	</div>
