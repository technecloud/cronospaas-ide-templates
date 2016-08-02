<h3>${model.dataSourceName}</h3>

<#if model.hasColumnFilter()>
<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
  <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label> 
  <input type="text" ng-model="query" class="form-control" value="%" placeholder="{{'template.crud.search' | translate}}"> 
</div>
<br/>
</#if>
<div class=""></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-763276"> 
   <datasource <#if model.hasColumnFilter()>filter="{{query == '' || query == null ? null : ('/${model.gridFilter}/' + query)}}"</#if> name="${model.dataSourceName}" entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource> 
</div> 
<div class=""></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-button" id="crn-button-564202"> 
  <button class="btn btn-primary" type="submit" onclick="" ng-click="${model.dataSourceName}.startInserting()" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">{{"template.crud.new" | translate}}</span></button> 
</div> 
<div class=""></div> 
<div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-grid" id="crn-grid-${model.dataSourceName}"> 
  <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting"> 
    <table class="table  table-bordered table-hover table-striped"> 
      <thead> 
        <tr class="table-header"> 
        <#list model.gridFields as field>
          <th class=""> 
            <div class="">${model.formMapLabels[field.name]!}</div>
          </th> 
    </#list>
          <th class=""> 
          <div class="">{{"template.crud.actions" | translate}}</div>
          </th> 
        </tr> 
      </thead> 
      <tbody> 
        <tr class="table-content" ng-repeat="rowData in datasource.data"> 
        <#list model.gridFields as field>
          <td class=""> 
            <div class="">

              <#if field.getProperty("firstStringField")?? >
                {{rowData.${field.getProperty("firstStringField")}}}
              <#else>
                <#if field.isDate() >
                  {{rowData.${field.name} | date:'dd/MM/yyyy'}}
                <#elseif field.isTime() >
                  {{rowData.${field.name} | date:'HH:mm:ss'}}
                <#elseif field.isTimestamp() >
                  {{rowData.${field.name} | date:'dd/MM/yyyy HH:mm:ss'}}
                <#else>
                  {{rowData.${field.name}}}
                </#if>
              </#if>
        
            </div>
          </td> 
        </#list>
          <td class=""> 
            <div class=""> 
              <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.startEditing(rowData)"><i class="fa fa-edit"></i></button> 
              <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button> 
            </div></td> 
        </tr> 
      </tbody> 
    </table> 
    <div class="table-footer-controls"> 
      <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()">{{"template.crud.load_more" | translate}}...</button> 
    </div> 
  </div> 
</div> 
<div class=""></div> 
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
        <div class=""></div> 
        <#list model.formFields as field>
        <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-textinput" id="crn-textinput-${field.name}"> 
          <div class="form-group"> 
            <label for="textinput-${field.name}" class="">${model.formMapLabels[field.name]!}</label> 

  <#if field.isBoolean() >
        <input type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}"  id="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>> 
  <#elseif (field.isDate() || field.isTime() || field.isTimestamp()) >
        <div style="position:relative">
          <input type="text" as-date 
            <#if field.isDate() >
            format="DD/MM/YYYY"
            <#elseif field.isTime()>
            format="HH:mm:ss"
            <#elseif field.isTimestamp()>
            format="DD/MM/YYYY HH:mm:ss"
            </#if>
          ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
        </div>
  <#elseif field.isNumber() >
        <input type="number" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>> 
  <#elseif field.getProperty("ngOptions")?? >

	<datasource name="${model.formMapLabels[field.name]!}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class="" dependent-by="{{${model.dataSourceName}}}"></datasource> 
	<select ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" ng-options="opt as opt.${field.getProperty("ngOptionsFkName")} for opt in ${model.formMapLabels[field.name]!}.data track by opt.${field.getProperty("ngOptions").keys}" <#if !field.isNullable()>required="required"</#if>>
	  <option value=''>None</option>
	</select>

  <#else>
        <input type="text" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>> 
  </#if>

          </div> 
        </div> 
        <div class=""></div> 
    </#list>
      </fieldset> 
    </form> 
  </div> 
</div> 
<div class=""></div>