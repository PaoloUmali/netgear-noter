<div ng-controller="MonthsCtrl">
	<div class="row">
		<div class="col-xs-3"><input ng-model="query" class="form-control" placeholder="Filter months"></div>
		<div class="col-xs-3">{{query}}</div>
		<div class="col-xs-3 col-xs-offset-3">
			<div>
				<select ng-model="orderProp" class="form-control" placeholder="Sort by">
				<option value="date">Sort by:</option>
				<option value="name">Alphabetical</option>
				<option value="-rating">Rating</option>
				</select>
			</div>
		</div>
	</div><!-- /.row -->
	<hr>
	<table class="table table-condensed table-bordered table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>Months</th>
				<th>Rating</th>
				<th>Snippet</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="month in months | filter:query | orderBy: orderProp">
				<td>{{month.date}}</td>
				<td>{{month.name}}</td>
				<td>{{month.rating}}</td>
				<td>{{month.snippet}}</td>
			</tr>
		</tbody>
	</table>
</div>