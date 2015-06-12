	<div role="tabpanel" class="tab-pane fade in" id="contacts">
<div id="wrapContacts">
		<table class="table table-bordered tabled-condensed table-striped">
			<thead><tr><th colspan="2">Contacts</th></tr></thead>
			<tbody><tr ng-repeat="contact in contacts"><td>{{contact.name}}</td><td>{{contact.number}}</td></tr></tbody>
		</table>
</div>
	</div>
