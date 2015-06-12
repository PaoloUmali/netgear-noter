<div role="tabpanel" id="togglable-tabs">
	<ul id="myTab" class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#note" id="note-tab" role="tab" data-toggle="tab">Note</a></li>
		<li role="presentation"><a href="#notes" role="tab" id="notes-tab" data-toggle="tab">Notes({{notes.length}})</a></li>
		<li role="presentation"><a href="#scripts" role="tab" id="scripts-tab" data-toggle="tab">Scripts</a></li>
		<li role="presentation" class="dropdown">
			<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
			<ul class="dropdown-menu" role="menu" id="myTabDrop1-contents">
				<li><a href="#contacts" tabindex="-1" role="tab" id="contacts-tab" data-toggle="tab">Contacts</a></li>
				<li><a href="#links" tabindex="-1" role="tab" id="links-tab" data-toggle="tab">Links</a></li>
				<li><a href="#troubleshooters" tabindex="-1" role="tab" id="troubleshooters-tab" data-toggle="tab">Troubleshooters</a></li>
			</ul>
		</li>
		<li role="presentation" class="dropdown pull-right">
			<a href="#" id="myTabDrop2" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> [ <i spellcheck="false" contenteditable="true" title="Click to edit">75030</i> ] <span class="caret hidden"></span></a>
			<ul class="dropdown-menu hidden" role="menu" id="myTabDrop2-contents">
				<li><a href="javascript:void" style="cursor:pointer" ng-init="remote=false" ng-click="remote=!remote"><span style="font-weight:bold" ng-class="{'text-danger':!remote,'text-success':remote}">{{remote?'Remote: Enabled':'Remote: Disabled'}}</span></a></li>
			</ul>
		</li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="note">
			<div ng-include src="'tpl/tabpanes/note.tpl'"></div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="notes">
			<div ng-include src="'tpl/tabpanes/notes.tpl'"></div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="links">
			<div ng-include src="'tpl/tabpanes/links.tpl'"></div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="contacts">
			<div ng-include src="'tpl/tabpanes/contacts.tpl'"></div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="scripts">
			<div ng-include src="'tpl/tabpanes/scripts.tpl'"></div>
		</div>
		<div role="tabpanel" class="tab-pane fade" id="troubleshooters">
			<div ng-include src="'tpl/tabpanes/troubleshooters.tpl'"></div>
		</div>
	</div>
</div>
<hr>