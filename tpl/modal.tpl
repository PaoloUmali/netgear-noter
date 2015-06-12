<!-- Button trigger modal -->
<button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal">QuickTS</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">QuickTS</h4>
			</div>
			<div class="modal-body">
				<div ng-include src="'tpl/troubleshooting.tpl'"></div>
			</div>
			<div class="modal-footer">
				<small class="pull-left">Import your own QuickTS: Tabs > More > Troubleshooters</small>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>