<h3>${dataSourceName}</h3>
<!-- 
gridFields?size= ${gridFields?size} 
gridHasColumnFilter = ${gridHasColumnFilter}
--> 

<label for="textinput-filter" class="">Filter 
<#if gridHasColumnFilter = "true">
by ${gridFilterName}
</#if>
</label> 
<input type="text" ng-model="query"  class="form-control" value="%" placeholder="Placeholder text" ng-mask=""> 

<br/>

<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-763276"> 
  <datasource name="${dataSourceName}" entity="${dataSourceFullName}" keys="${dataSourcePrimaryKeys}" rows-per-page="100" class=""></datasource> 
</div> 
<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-button" id="crn-button-564202"> 
  <button class="btn btn-primary" type="submit" onclick="" ng-click="${dataSourceName}.startInserting()" ng-hide="${dataSourceName}.inserting || ${dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">Add new user</span></button> 
</div> 
<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-grid" id="crn-grid-852138"> 
  <div crn-datasource="${dataSourceName}" class="" ng-hide="${dataSourceName}.editing || ${dataSourceName}.inserting"> 
    <table class="table  table-bordered table-hover"> 
      <thead> 
        <tr class="table-header"> 
        <#list gridFields as field>
          <th class=""> 
            <div data-container="true" class="">${field.name}</div>
          </th> 
		</#list>
          <th class=""> 
	        <div data-container="true" class="">Actions</div>
          </th> 
        </tr> 
      </thead> 
      <tbody> 
        <tr class="table-content" ng-repeat="rowData in datasource.data | filter:${gridFilter}"> 
        <#list gridFields as field>
          <td class=""> 
            <div data-container="true" class="">{{rowData.${field.name}}}</div>
          </td> 
		</#list>
          <td class=""> 
            <div data-container="true" class=""> 
              <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.startEditing(rowData)"><i class="fa fa-edit"></i><span class="">Edit</span></button> 
              <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-times"></i> <span class="" ng-click="datasource.remove(rowData)">Remove</span></button> 
            </div></td> 
        </tr> 
      </tbody> 
    </table> 
    <div class="table-footer-controls"> 
      <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()">Load more...</button> 
    </div> 
  </div> 
</div> 
<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-form" id="crn-form-319115"> 
  <div class="form" ng-show="${dataSourceName}.editing || ${dataSourceName}.inserting"> 
    <form crn-datasource="${dataSourceName}" class=""> 
      <div class="tool-bar" ng-hide="datasource.editing || datasource.inserting"> 
        <button class="btn btn-primary" ng-click="datasource.startInserting()"><i class="glyphicon glyphicon-plus-sign"></i></button> 
        <button class="btn btn-success" ng-click="datasource.startEditing()"><i class="glyphicon glyphicon-edit"></i></button> 
        <button class="btn btn-primary" ng-disabled="!datasource.hasPrevious()" ng-click="datasource.previous()"><i class="glyphicon glyphicon-chevron-left"></i></button> 
        <button class="btn btn-primary" ng-disabled="!datasource.hasNext()" ng-click="datasource.next()"><i class="glyphicon glyphicon-chevron-right"></i></button> 
        <button class="btn btn-primary" ng-click="datasource.remove()"><i class="glyphicon glyphicon-trash"></i></button> 
      </div> 
      <div class="active-bar" ng-hide="!datasource.editing &amp;&amp; !datasource.inserting"> 
        <button class="btn btn-success" ng-click="datasource.post()"><i class="glyphicon glyphicon-ok"></i></button> 
        <button class="btn btn-danger" ng-click="datasource.cancel()"><i class="glyphicon glyphicon-remove"></i></button> 
      </div> 
      <fieldset ng-disabled="!datasource.editing &amp;&amp; !datasource.inserting"> 
        <div class="" data-container="true"></div> 
        <#list formFields as field>
        <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-textinput" id="crn-textinput-${field.name}"> 
          <div class="form-group"> 
            <label for="textinput-${field.name}" class="">${formMapLabels[field.name]}</label> 
            <input type="text" ng-model="${dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="Placeholder text" ng-mask="${formMapMasks[field.name]}"> 
          </div> 
        </div> 
        <div class="" data-container="true"></div> 
		</#list>
      </fieldset> 
    </form> 
  </div> 
</div> 
<div class="" data-container="true"></div>
