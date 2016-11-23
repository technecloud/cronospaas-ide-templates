<h3>${model.dataSourceName}</h3> 

<#if model.hasColumnFilter()>
<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
  <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label> 
  <input type="text" ng-model="query" class="form-control" value="%" placeholder="{{'template.crud.search' | translate}}"> 
</div>
<br/>
<#elseif model.hasSearchableFilter()>
  <#if model.getGridFilterSearchable()=="generalSearch">
<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
  <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label> 
  <input type="text" ng-model="search" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}"> 
</div>
<br/>
  <#else>
<div class="row" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
    <#list model.formFields as field>
      <#if field.isSearchable()>
        <#if (field.isDate() || field.isTime() || field.isTimestamp()) >
    <div class="col-md-2">
      <div class="component-holder ng-binding ng-scope" data-component="crn-datepicker" id="crn-datepicker-32329">
        <div class="form-group">
          <label for="exampleInputDate">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
          <div style="position:relative">
            <input type="text" as-date="" class="form-control" 
              <#if field.isDate() >
              format="DD/MM/YYYY"
              <#elseif field.isTime()>
              format="HH:mm:ss"
              <#elseif field.isTimestamp()>
              format="DD/MM/YYYY HH:mm:ss"
              </#if>
            ng-model="${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
          </div>
        </div>
      </div>
    </div>
        <#elseif field.isNumber() >
    <div class="col-md-2">
      <div>
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label> 
        <input type="number" ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"> 
      </div>
    </div>
        <#elseif field.isBoolean() >
    <div class="col-md-2">
      <div>
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label> 
        <input type="checkbox" ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"> 
      </div>
    </div>
        <#else>
    <div class="col-md-2">
      <div>
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label> 
        <input type="text" ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if>> 
      </div>
    </div>
        </#if>
      </#if>
    </#list>
</div>
<br/>
  </#if>
</#if>
<#assign filterSearch = "">
<#assign entitySearch = "">
<#if model.hasColumnFilter()>
  <#assign filterSearch = "{{query == '' || query == null ? null : ('/${model.gridFilter}/' + query)}}">
<#elseif model.hasSearchableFilter()>
  <#if model.getGridFilterSearchable()=="generalSearch">
    <#assign filterSearch = "?search={{search}}">
    <#assign entitySearch = "/generalSearch">
  <#else>
    <#assign filter_index = 0>
    <#assign entitySearch = "/specificSearch">
    <#list model.formFields as field>
      <#if field.isSearchable()>
        <#assign parameter_angular_date = "">
        <#if field.isDate() >
          <#assign parameter_angular_date = "| date:'dd/MM/yyyy'">
        <#elseif field.isTime()>
          <#assign parameter_angular_date = "| date:'HH:mm:ss'">
        <#elseif field.isTimestamp() >
          <#assign parameter_angular_date = "| date:'dd/MM/yyyy HH:mm:ss'">
        </#if>
        
        <#if filter_index == 0>
          <#assign filterSearch += "?${field.name}={{${field.name}${parameter_angular_date}}}">
          <#assign filter_index++>
        <#else>
          <#assign filterSearch += "&${field.name}={{${field.name}${parameter_angular_date}}}">
        </#if>
      </#if>
    </#list>
  </#if>
</#if>
<div data-component="crn-datasource" id="crn-datasource-763276" class="component-holder"> 
   <datasource filter="${filterSearch}" name="${model.dataSourceName}" entity="${model.dataSourceFullName}${entitySearch}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource> 
</div> 
<div data-component="crn-button" id="crn-button-564202"> 
  <button class="btn btn-primary" type="submit" onclick="" ng-click="${model.dataSourceName}.startInserting()" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">{{"template.crud.new" | translate}}</span></button> 
</div> 
<div class="component-holder" data-component="crn-grid" id="crn-grid-${model.dataSourceName}"> 
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
<div data-component="crn-form" id="crn-form-form-${model.dataSourceName}"> 
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
        <#list model.formFields as field>
        
        <div data-component="crn-textinput" id="crn-textinput-${field.name}"> 
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
        
        <div data-component="crn-datasource" class="component-holder"> 
          <datasource name="${model.formMapLabels[field.name]!}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class="" dependent-by="{{${model.dataSourceName}}}"></datasource> 
        </div>
        <ui-select ng-model="${model.dataSourceName}.active.${field.name}" crn-datasource="${model.formMapLabels[field.name]!}" class="crn-select" id="textinput-${field.name}"> 
          <ui-select-match class="">
            {{$select.selected.${field.getProperty("ngOptionsFkName")}}} 
          </ui-select-match> 
          <ui-select-choices  repeat="rowData in datasource.data | filter : $select.search"  class=""> 
            <div class="" data-container="true">
              {{rowData.${field.getProperty("ngOptionsFkName")}}}
            </div> 
          </ui-select-choices> 
        </ui-select> 
  <#else>
        <input type="<#if field.isEncryption()>password<#else>text</#if>" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>> 
  </#if>
          </div> 
        </div> 
    </#list>
    
    <!-- OneToN -->
  <#list model.formFieldsOneToN as field>
  
    <!--query filter 1toN -->
    <#assign filterSearch = "">
    <#assign entitySearch = "">
    <#if model.hasSearchableFilter()>
      <#if model.getGridFilterSearchable()=="generalSearch">
        <#assign filterSearch = "?search={{search${field.getName()}}}">
        <#assign entitySearch = "/generalSearch">
      <#else>
        <#assign filter_index = 0>
        <#assign entitySearch = "/specificSearch">
        <#list field.getClazz().getFields() as scfield>
          <#if scfield.isSearchable()>
            <#assign parameter_angular_date = "">
            <#if scfield.isDate() >
              <#assign parameter_angular_date = "| date:'dd/MM/yyyy'">
            <#elseif scfield.isTime()>
              <#assign parameter_angular_date = "| date:'HH:mm:ss'">
            <#elseif scfield.isTimestamp() >
              <#assign parameter_angular_date = "| date:'dd/MM/yyyy HH:mm:ss'">
            </#if>
            
            <#if filter_index == 0>
              <#assign filterSearch += "?${scfield.name}={{${scfield.name}${field.getName()}${parameter_angular_date}}}">
              <#assign filter_index++>
            <#else>
              <#assign filterSearch += "&${scfield.name}={{${scfield.name}${field.getName()}${parameter_angular_date}}}">
            </#if>
          </#if>
        </#list>
      </#if>
    </#if>
    <!-- query filter 1toN end-->
    
        <div data-component="crn-datasource" class="component-holder"> 
          <datasource filter="${filterSearch}" name="${field.getName()}Grid" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" entity="${model.dataSourceFullName}/{{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}}}/${field.getName()?cap_first}${entitySearch}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" lazy="true" auto-post="true" dependent-lazy-post="${model.dataSourceName}" dependent-lazy-post-field="${model.dataSourceName?uncap_first}"></datasource> 
        </div>
        <button class="btn btn-primary" onclick="$('#modal${field.getName()}Grid').modal('show');" ng-click="${field.getName()}Grid.startInserting();"><i class="fa fa-plus"></i> <span class="">{{"Add" | translate}} ${field.getName()}</span> </button> 
        
    <!--search 1toN-->
    <#if model.hasSearchableFilter()>
      <#if model.getGridFilterSearchable()=="generalSearch">
    <br/><br/><br/>
    <div ng-show="${model.dataSourceName}.editing && !${field.getName()}Grid.hasDataBuffered()">
      <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label> 
      <input type="text" ng-model="search${field.getName()}" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}"> 
    </div>
      <#else>
    <br/><br/><br/>
    <div class="row" ng-show="${model.dataSourceName}.editing && !${field.getName()}Grid.hasDataBuffered()">
        <#list field.getClazz().getFields() as scfield>
          <#if scfield.isSearchable()>
            <#if (scfield.isDate() || scfield.isTime() || scfield.isTimestamp()) >
        <div class="col-md-2">
          <div class="component-holder ng-binding ng-scope" data-component="crn-datepicker" id="crn-datepicker-21329">
            <div class="form-group">
              <label for="exampleInputDate">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label>
              <div style="position:relative">
                <input type="text" as-date="" class="form-control" 
                  <#if scfield.isDate() >
                  format="DD/MM/YYYY"
                  <#elseif scfield.isTime()>
                  format="HH:mm:ss"
                  <#elseif scfield.isTimestamp()>
                  format="DD/MM/YYYY HH:mm:ss"
                  </#if>
                ng-model="${scfield.name}${field.getName()}" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>">
              </div>
            </div>
          </div>
        </div>
            <#elseif scfield.isNumber() >
        <div class="col-md-2">
          <div>
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label> 
            <input type="number" ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>"> 
          </div>
        </div>
            <#elseif scfield.isBoolean() >
        <div class="col-md-2">
          <div>
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label> 
            <input type="checkbox" ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>"> 
          </div>
        </div>
            <#else>
        <div class="col-md-2">
          <div>
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label> 
            <input type="text" ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>" <#if model.formMapRelationFieldMasks[scfield.name]?has_content>mask="${model.formMapRelationFieldMasks[scfield.name]}"</#if>> 
          </div>
        </div>
            </#if>
          </#if>
        </#list>
    </div>
      </#if>
    </#if>
    <!-- seach 1toN end-->
        <div data-component="crn-textinput" id="crn-textinput-descricao"> 
          <div class="form-group"> 
            <label for="textinput-descricao" class="">${field.getName()}</label> 
            <div class="component-holder" data-component="crn-grid" id="crn-grid-${field.getName()}Grid"> 
              <div crn-datasource="${field.getName()}Grid">
                <table class="table table-bordered table-hover table-striped"> 
                  <thead> 
                    <tr class="table-header"> 
                      
                      <#list field.getClazz().getFields() as gField>
                      <#if !gField.isPrimaryKey() && ((gField.getName()?lower_case) != (model.dataSourceName?lower_case)) >
                      <th class=""> 
                        <div class="">
                           <#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>
                        </div> </th> 
                      </#if>
                      </#list>
                      <th class=""> 
                        <div class="">
                           {{"template.crud.actions" | translate}} 
                        </div> </th> 
                        
                    </tr> 
                  </thead> 
                  <tbody> 
                    <tr class="table-content" ng-repeat="rowData in datasource.data"> 
                      <#list field.getClazz().getFields() as gField>
                      <#if !gField.isPrimaryKey() && ((gField.getName()?lower_case) != (model.dataSourceName?lower_case))>
                      <td> 
                        <div>
                           <#if gField.isReverseRelation() >
                            {{rowData.${gField.getName()}.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()} }}
                           <#elseif gField.isDate() >
                            {{rowData.${gField.getDbFieldName()} | date:'dd/MM/yyyy'}}
                          <#elseif gField.isTime() >
                            {{rowData.${gField.getDbFieldName()} | date:'HH:mm:ss'}}
                          <#elseif gField.isTimestamp() >
                            {{rowData.${gField.getDbFieldName()} | date:'dd/MM/yyyy HH:mm:ss'}}
                          <#else>
                            {{rowData.${gField.getDbFieldName()}}}
                          </#if>
                        </div> </td> 
                      </#if>
                      </#list>
                      <td> 
                        <div> 
                          <button class="btn btn-default btn-sm" ng-click="datasource.startEditing(rowData)" onclick="$('#modal${field.getName()}Grid').modal('show');" ><i class="fa fa-edit"></i></button>
                          <button class="btn btn-default btn-sm" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button> 
                        </div> </td> 
                    </tr> 
                  </tbody> 
                </table>
                <div class="table-footer-controls"> 
                  <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()" content="{{&quot;template.crud.load_more&quot; | translate}}...">{{"template.crud.load_more" | translate}}...</button> 
                </div>
              </div>
            </div>
          </div>
        </div> 
        <div class="modal fade" id="modal${field.getName()}Grid"> 
          <div class="modal-dialog"> 
            <div class="modal-content"> 
              <div class="modal-header"> 
                <button type="button" class="close" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"><span aria-hidden="true">×</span></button> 
                <h4 class="modal-title">${field.getName()}</h4> 
              </div> 
              <div class="modal-body"> 
                <div class="text-danger wrapper text-center" ng-show="authError"> 
                </div> 
                <div class="list-group list-group-sm">
                  <#list field.getClazz().getFields() as gField>
                    <#if gField.isReverseRelation() >
                      <#if (gField.getRelationClazz().getName() != model.dataSourceName) >
                        <div data-component="crn-textinput" id="crn-textinput-teste3"> 
                          <div class="form-group"> 
                            <label for="textinput-${gField.getName()}" class=""><#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if></label> 
                            <div data-component="crn-datasource" class="component-holder"> 
                              <datasource name="${gField.getName()}GridForUiSelect" entity="${model.getDataSourceOfEntity(gField.getRelationClazz().getName())}" keys="id" rows-per-page="100" lazy="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" ></datasource> 
                            </div>
                            <input type="text" style="border: 0px; width: 1px;" required="required" ng-model="${field.getName()}Grid.active.${gField.getName()}" id="${field.getName()}Grid.active.${gField.getName()}" crn-datasource="${gField.getName()}GridForUiSelect" onkeypress="this.value='';this.disabled=1;setTimeout(function() { document.getElementById('${field.getName()}Grid.active.${gField.getName()}').disabled=0;  },100);" onfocus="setTimeout(function() {$(document.getElementById('${field.getName()}Grid.active.${gField.getName()}')).blur();  },1000);" />
                            <ui-select ng-model="${field.getName()}Grid.active.${gField.getName()}" crn-datasource="${gField.getName()}GridForUiSelect" class="crn-select" id="textinput-${gField.getName()}" required="required" > 
                              <ui-select-match class="">
                                 {{$select.selected.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}} 
                              </ui-select-match> 
                              <ui-select-choices repeat="rowData in datasource.data | filter : $select.search" class=""> 
                                <div class="" data-container="true">
                                   {{rowData.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}} 
                                </div> 
                              </ui-select-choices> 
                            </ui-select> 
                          </div> 
                        </div>
                      </#if>
                    <#elseif (!gField.isPrimaryKey())>
                    
                      
                      <div data-component="crn-textinput" id="crn-textinput-${gField.getDbFieldName()}"> 
                        <div class="form-group"> 
                          <label for="textinput-${gField.getDbFieldName()}"><#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if></label> 
                          
                          <#if gField.isBoolean() >
                              <input type="checkbox" ng-model="${field.getName()}Grid.active.${gField.getDbFieldName()}"  id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>> 
                          <#elseif (gField.isDate() || gField.isTime() || gField.isTimestamp()) >
                              <div style="position:relative">
                                <input type="text" as-date 
                                  <#if gField.isDate() >
                                  format="DD/MM/YYYY"
                                  <#elseif gField.isTime()>
                                  format="HH:mm:ss"
                                  <#elseif gField.isTimestamp()>
                                  format="DD/MM/YYYY HH:mm:ss"
                                  </#if>
                                ng-model="${field.getName()}Grid.active.${gField.getDbFieldName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>>
                              </div>
                          <#elseif gField.isNumber() >
                              <input type="number" ng-model="${field.getName()}Grid.active.${gField.getDbFieldName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>> 
                          <#else>
                              <input type="<#if gField.isEncryption()>password<#else>text</#if>" ng-model="${field.getName()}Grid.active.${gField.getDbFieldName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if model.formMapRelationFieldMasks[gField.name]?has_content>mask="${model.formMapRelationFieldMasks[gField.name]}"</#if> <#if !gField.isNullable()>required="required"</#if>>
                          </#if>
                        </div> 
                      </div> 
                    </#if>
                  </#list>
                   
                </div> 
              </div> 
              <div class="modal-footer"> 
                <button class="btn btn-primary" ng-click="${field.getName()}Grid.post();" onclick="(!${field.getName()}Grid.missingRequiredField()?$('#modal${field.getName()}Grid').modal('hide'):void(0))">{{'Save' | translate}}</button> 
                <button type="button" class="btn btn-default" data-dismiss="modal">{{'Home.view.Close' | translate}}</button> 
              </div> 
            </div> 
          </div> 
        </div> 
  </#list>
  <!-- OneToOne  end -->
  
  <!-- NtoN  -->
  <#list model.formFieldsNToN as field>
      <div data-component="crn-datasource" class="component-holder"> 
        <datasource append="false" name="${field.getName()}" entity="${model.dataSourceFullName}/{{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}}}/${field.getName()}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" lazy="true" auto-post="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}"dependent-lazy-post="${model.dataSourceName}" dependent-lazy-post-field="${model.dataSourceName?uncap_first}" ></datasource> 
      </div>
      <div data-component="crn-datasource" class="component-holder"> 
        <datasource name="All${field.getName()}" entity="${model.getDataSourceOfEntity(field.getName())}" keys="id" rows-per-page="100" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}"></datasource> 
      </div>  
      <#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
        <div class="form-group" ng-show="datasource.editing || datasource.inserting">
          <label for="select-ui">${field.getName()}</label> 
          <div id="select-ui" data-component="crn-tags"> 
            <ui-select multiple crn-datasource="All${field.getName()}" ng-model="${field.getName()}.data" class="crn-select" style="min-width: 200px" theme="bootstrap" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting }}"> 
              <ui-select-match placeholder="${field.getName()}...">
                 {{$item.${model.getFirstTextFieldOfManyToManyRelation(field.getName())} }} 
              </ui-select-match> 
              <ui-select-choices repeat="rowData in datasource.data | filter : $select.search" class=""> 
                <div class="" data-container="true" draggable="true">
                   {{rowData.${model.getFirstTextFieldOfManyToManyRelation(field.getName())}}} 
                </div> 
              </ui-select-choices> 
            </ui-select> 
          </div>
        </div>
      <#else>
        <div class="form-group" ng-show="datasource.editing || datasource.inserting"> 
          <label for="select-ui">${field.getName()}</label> 
          <div class="row" > 
            <div class="col-md-6"> 
              <div id="select-ui" data-component="crn-tags"> 
                <ui-select crn-datasource="All${field.getName()}" ng-model="All${field.getName()}.active" class="crn-select" style="min-width: 200px" theme="bootstrap" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting }}"> 
                  <ui-select-match placeholder="${field.getName()}...">
                     {{$select.selected.${model.getFirstTextFieldOfManyToManyRelation(field.getName())} }} 
                  </ui-select-match> 
                  <ui-select-choices repeat="rowData in datasource.data | filter : $select.search" class=""> 
                    <div class="" data-container="true" draggable="true">
                       {{rowData.${model.getFirstTextFieldOfManyToManyRelation(field.getName())}}} 
                    </div> 
                  </ui-select-choices> 
                </ui-select> 
              </div> 
            </div> 
            <div class="col-md-6"> 
              <button class="btn btn-default btn-sm" type="submit" ng-click="${field.getName()}.insert(All${field.getName()}.active); ${field.getName()}.data.push(All${field.getName()}.active);"><i class="fa fa-plus"></i></button> 
            </div> 
          </div> 
        </div> 
        <div class="form-group" ng-show="datasource.editing || datasource.inserting"> 
          <div class="component-holder" data-component="crn-grid" id="crn-grid-All${field.getName()}"> 
            <div crn-datasource="${field.getName()}">
              <table class="table table-bordered table-hover table-striped"> 
                <tbody> 
                  <tr class="table-content" ng-repeat="rowData in datasource.data track by $index"> 
                    <td class=""> 
                      <div class="">
                         {{rowData.${model.getFirstTextFieldOfManyToManyRelation(field.getName())}}} 
                      </div> 
                    </td> 
                    <td class=""> 
                      <div class=""> 
                        <button class="btn btn-default btn-sm" type="submit" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button> 
                      </div>
                    </td> 
                  </tr> 
                </tbody> 
              </table>
              <div class="table-footer-controls"> 
                <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()" content="{{&quot;template.crud.load_more&quot; | translate}}...">{{"template.crud.load_more" | translate}}...</button> 
              </div>
            </div>
          </div>
        </div>
      </#if>
  </#list>
  <!-- NtoN  end-->
    
      </fieldset> 
      
    
      
    </form> 
  </div> 
</div> 