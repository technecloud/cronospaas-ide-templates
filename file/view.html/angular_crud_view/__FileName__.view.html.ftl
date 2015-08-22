<h3>${model.dataSourceName}</h3>

<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
<label for="textinput-filter" class="">Filter 
<#if model.gridHasColumnFilter = "true">
by ${model.gridFilterName}
</#if>
</label> 
<input type="text" ng-model="query" class="form-control" value="%" placeholder="Placeholder text"> 
</div>

<br/>

<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-763276"> 
  <datasource name="${model.dataSourceName}" entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" class=""></datasource> 
</div> 
<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-button" id="crn-button-564202"> 
  <button class="btn btn-primary" type="submit" onclick="" ng-click="${model.dataSourceName}.startInserting()" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">Add new user</span></button> 
</div> 
<div class="" data-container="true"></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-grid" id="crn-grid-852138"> 
  <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting"> 
    <table class="table  table-bordered table-hover"> 
      <thead> 
        <tr class="table-header"> 
        <#list model.gridFields as field>
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
        <tr class="table-content" ng-repeat="rowData in datasource.data | filter:${model.gridFilter}"> 
        <#list model.gridFields as field>
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
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-form" id="crn-form-form-${model.dataSourceName}"> 
  <div class="form" ng-show="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting"> 
    <form crn-datasource="${model.dataSourceName}" class=""> 
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
        <#list model.formFields as field>
        <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-textinput" id="crn-textinput-${field.name}"> 
          <div class="form-group"> 
            <label for="textinput-${field.name}" class="">${model.formMapLabels[field.name]}</label> 

  <#if field.isBoolean() >
        <input type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}"  id="textinput-${field.name}" placeholder="Placeholder text"> 
  <#elseif field.isDate() >
        <input type="date" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="Placeholder text"> 
  <#elseif field.isNumber() >
        <input type="number" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="Placeholder text"> 
  <#elseif field.getProperty("ngOptions")?? >

    <datasource name="${field.getProperty("ngOptions").dataSourceName}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" rows-per-page="${field.getProperty("ngOptions").rowPerPage}" class=""></datasource> 

    <select ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" ng-options="${field.getProperty("ngOptions").options}">
      <option value=''>None</option>
    </select>
  <#else>
        <input type="text" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="Placeholder text" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if>> 
  </#if>

          </div> 
        </div> 
        <div class="" data-container="true"></div> 
    </#list>
      </fieldset> 
    </form> 
  </div> 
</div> 
<div class="" data-container="true"></div>