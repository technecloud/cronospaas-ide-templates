<h3>${model.dataSourceName}</h3>

<!-- div row para pesquisa -->
<!--<div class="row">-->

<#if model.hasColumnFilter()>
<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="">
    <div class="form-group">
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
        <input type="text" ng-model="query" class="form-control" value="%" placeholder="{{'template.crud.search' | translate}}">
    </div>
</div>
<#elseif model.hasCronappFramework() || model.hasSearchableFilter()>
    <#if model.getGridFilterSearchable()=="generalSearch">
    <div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" data-component="crn-datasource-filter" id="crn-datasource-filter-general" class="">
        <div class="form-group">
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
            <#assign fieldsString = "">
            <#if model.hasSearchableFilter()>
                <#list model.formFields as field>
                    <#if (field.isSearchable() && field.isString()) >
                        <#assign fieldsString = fieldsString + "${field.name};">
                    </#if>
                </#list>
            <#else>
                <#assign fieldsString = "${model.getFirstFieldStringNotPk().getName()};">
            </#if>
            <input type="text" ng-model="vars.search" cronapp-filter="${fieldsString}" cronapp-filter-operator="" cronapp-filter-autopost="true" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}">
        </div>
    </div>
    <#elseif model.getGridFilterSearchable()=="specificSearch">
        <#if model.hasSearchableFilter()>
            <div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="component-holder ng-binding ng-scope" data-component="crn-datasource-filter-complex">
              <fieldset>
            <#list model.formFields as field>
                <#if field.isSearchable()>
                <div  data-component="crn-datasource-filter" id="crn-datasource-filter-${field.name}" class="">
                    <div class="form-group">
                        <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                        <input type="${field.getHtmlType()}" ng-model="vars.search_${field.name}" mask="${model.formMapMasks[field.name]}" mask-placeholder="" cronapp-filter="${field.name}" cronapp-filter-autopost="false" cronapp-filter-operator="" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                    </div>
                </div>
                </#if>
            </#list>
              <div data-component="crn-button-filter" class="" crn-datasource="${model.dataSourceName}">
                <button class="btn btn-default component-holder" cronapp-filter="" data-component="crn-button-filter" type="submit" ng-click="" xattr-size="" xattr-fullsize="" xattr-theme="btn-default"><i class="glyphicon glyphicon-search"></i> <span>{{"template.crud.search" | translate}}</span></button>
              </div>
              <br/>
              </fieldset>
            </div>
        <#else>
        <div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" data-component="crn-datasource-filter" id="crn-datasource-filter-${model.getFirstFieldStringNotPk().name}" class="">
            <div class="form-group">
                <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[model.getFirstFieldStringNotPk().name]!}</label>
                <input type="text" cronapp-filter="${model.getFirstFieldStringNotPk().name}" cronapp-filter-operator="" cronapp-filter-autopost="true" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="<#if model.getFirstFieldStringNotPk().label?has_content>${model.getFirstFieldStringNotPk().label}<#else>${model.getFirstFieldStringNotPk().name}</#if>">
            </div>
        </div>
        </#if>
    </#if>
<#elseif model.hasSearchableFilter()>
    <#if model.getGridFilterSearchable()=="generalSearch">
    <div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="">
        <div class="form-group">
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
            <input type="text" ng-model="vars.search" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}">
        </div>
    </div>
    <#else>
    <div class="row" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
        <#list model.formFields as field>
            <#if field.isSearchable()>
                <#if (field.isDate() || field.isTime() || field.isTimestamp()) >
                    <div class="">
                        <div class="component-holder ng-binding ng-scope" data-component="crn-datepicker" id="crn-datepicker-32329">
                            <div class="form-group">
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
                <#elseif (field.isNumber() || field.isDecimal()) >
                    <div class="">
                        <div class="form-group">
                            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                            <input type="number" <#if field.isDecimal()>step="0.01"</#if> ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                        </div>
                    </div>
                <#elseif field.isBoolean() >
                    <div class="">
                        <div class="form-group">
                            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                            <input type="checkbox" ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                        </div>
                    </div>
                <#else>
                    <div class="">
                        <div class="form-group">
                            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                            <input type="text" <#if field.getLength()??>maxlength="${field.getLength()}"</#if> ng-model="${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if>>
                        </div>
                    </div>
                </#if>
            </#if>
        </#list>
    </div>
    </#if>
</#if>

<#assign filterSearch = "">
<#if model.initialFilter??>
    <#assign filterSearch = "/${model.initialFilter}">
</#if>
<#assign entitySearch = "">
<#if model.hasColumnFilter()>
    <#assign filterSearch = "{{query == '' || query == null ? '${filterSearch}' : ('/${model.gridFilter}/' + query)}}">
<#elseif model.hasCronappFramework()>
    <#assign filterSearch = "">
    <#assign entitySearch = "">
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
<div data-component="crn-button" id="crn-button-564202" class="">
    <button class="btn btn-primary" type="submit" onclick="" data-component="crn-button" ng-click="${model.dataSourceName}.startInserting()" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">{{"template.crud.new" | translate}}</span></button>
</div>
<!-- fim div row para pesquisa -->
<!--</div>-->

<datasource filter="${filterSearch}" name="${model.dataSourceName}" entity="${model.dataSourceFullName}${entitySearch}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource>
<div class="component-holder" data-component="crn-grid" id="crn-grid-${model.dataSourceName}">
    <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
        <table class="table  table-bordered table-hover table-striped">
            <thead>
            <tr class="table-header">
            <#list model.gridFields as field>
                <th class="">
                    <div class="">${model.formMapLabels[field.name]!?cap_first}</div>
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
                        <#if field.getProperty("firstStringField")??>
                            {{rowData.${field.getProperty("firstStringField")}}}
                        <#else>
                            <#if field.isDate() && !model.hasCronappFramework()>
                                {{rowData.${field.name} | date:'dd/MM/yyyy'}}
                            <#elseif field.isTime() && !model.hasCronappFramework()>
                                {{rowData.${field.name} | date:'HH:mm:ss'}}
                            <#elseif field.isTimestamp() && !model.hasCronappFramework()>
                                {{rowData.${field.name} | date:'dd/MM/yyyy HH:mm:ss'}}
                            <#elseif (field.isTimestamp() || field.isDate() || field.isTime()) && model.hasCronappFramework()>
                                {{rowData.${field.name} | mask:'${field.getHtmlType()}'}}
                            <#elseif field.isImage()>
                                <a ng-if="rowData.${field.name}" ng-click="datasource.openImage(rowData.${field.name})">
                                    <img data-ng-src="{{rowData.${field.name}.startsWith('http') || (rowData.${field.name}.startsWith('/') && rowData.${field.name}.length < 1000)? rowData.${field.name} : 'data:image/png;base64,' + rowData.${field.name}}}" style="max-height: 30px;">
                                </a>
                            <#elseif field.isFile()>
                                <#if model.hasCronappFramework()>
                                    <button ng-if="rowData.${field.name}" class="btn btn-sm" ng-click="cronapi.internal.downloadFileEntity(datasource, '${field.name}', $index)">
                                        <span class="glyphicon glyphicon-download-alt"></span>
                                    </button>
                                <#else>
                                    <button class="btn btn-sm" ng-click="datasource.downloadFile('${field.name}', [<#list field.getClazz().primaryKeys as pk>rowData.${pk.name}<#if pk_has_next>, </#if></#list>])">
                                        <span class="glyphicon glyphicon-download-alt"></span>
                                    </button>
                                </#if>
                            <#else>
                                {{rowData.${field.name} <#if model.formMapMasks[field.name]?has_content && model.hasCronappFramework()>| mask:'${model.formMapMasks[field.name]}'</#if> }}
                            </#if>
                        </#if>
                    </div>
                </td>
            </#list>
                <td class="">
                    <div class="">
                        <button class="btn btn-default btn-sm" data-component="crn-button" type="submit" ng-click="datasource.startEditing(rowData)"><i class="fa fa-edit"></i></button>
                        <button class="btn btn-default btn-sm" data-component="crn-button" type="submit" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="table-footer-controls">
            <button class="btn btn-default btn-block btn-clicked" data-component="crn-button" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()">{{"template.crud.load_more" | translate}}...</button>
        </div>
    </div>
</div>
<div data-component="crn-form" id="crn-form-form-${model.dataSourceName}">
    <div class="form" ng-show="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
        <form crn-datasource="${model.dataSourceName}" class="">
            <div class="tool-bar" ng-hide="datasource.editing || datasource.inserting">
                <button class="btn btn-primary" data-component="crn-button" ng-click="datasource.startInserting()"><i class="glyphicon glyphicon-plus-sign"></i></button>
                <button class="btn btn-success" data-component="crn-button" ng-click="datasource.startEditing()"><i class="glyphicon glyphicon-edit"></i></button>
                <button class="btn btn-primary" data-component="crn-button" ng-disabled="!datasource.hasPrevious()" ng-click="datasource.previous()"><i class="glyphicon glyphicon-chevron-left"></i></button>
                <button class="btn btn-primary" data-component="crn-button" ng-disabled="!datasource.hasNext()" ng-click="datasource.next()"><i class="glyphicon glyphicon-chevron-right"></i></button>
                <button class="btn btn-primary" data-component="crn-button" ng-click="datasource.remove()"><i class="glyphicon glyphicon-trash"></i></button>
            </div>
            <div class="active-bar" ng-hide="!datasource.editing &amp;&amp; !datasource.inserting">
                <button class="btn btn-success" data-component="crn-button" ng-click="datasource.post()"><i class="glyphicon glyphicon-ok"></i></button>
                <button class="btn btn-danger" data-component="crn-button" ng-click="datasource.cancel()"><i class="glyphicon glyphicon-remove"></i></button>
            </div>
            <br/>
            <fieldset ng-disabled="!datasource.editing &amp;&amp; !datasource.inserting">
            <#list model.formFields as field>
                <#assign currentType = "textinput">
                <#if field.getProperty("ngOptions")??>
                    <#assign currentType = "combobox-dynamic">
                    <datasource name="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class="" dependent-by="{{${model.dataSourceName}}}"></datasource>
                </#if>
                <#assign dataComponentType = "crn-${currentType}">
                <#if field.isImage() && model.hasCronappFramework()>
                    <#assign dataComponentType = "crn-dynamic-image">
                <#elseif field.isFile() && model.hasCronappFramework()>
                    <#assign dataComponentType = "crn-dynamic-file">
                </#if>

                <div data-component="${dataComponentType}" id="crn-${currentType}-${field.name}" class="">
                    <div class="form-group">
                        <label for="${currentType}-${field.name}" class="">${model.formMapLabels[field.name]!?cap_first}</label>
                        <#if !model.hasCronappFramework()>

                            <#if field.isBoolean() >
                                <input type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}"  id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
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
                                           ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
                                </div>
                            <#elseif (field.isNumber() || field.isDecimal())  >
                                <input type="number" <#if field.isDecimal()>step="0.01"</#if> ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
                            <#elseif field.getProperty("ngOptions")?? >
                                <ui-select ng-model="${model.dataSourceName}.active.${field.name}" crn-datasource="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}" class="crn-select" id="${currentType}-${field.name}" <#if !field.isNullable()>required="required"</#if> theme="bootstrap">
                                    <ui-select-match class="" placeholder="Select...">
                                        {{$select.selected.${field.getProperty("ngOptionsFkName")}}}
                                    </ui-select-match>
                                    <ui-select-choices  repeat="rowData in datasource.data | filter : $select.search" class="" refresh="" refresh-deplay="">
                                        <div class="" data-container="true">
                                            {{rowData.${field.getProperty("ngOptionsFkName")}}}
                                        </div>
                                    </ui-select-choices>
                                </ui-select>
                            <#elseif field.isImage()>
                                <div class="form-group upload-image-component" ngf-drop ngf-drag-over-class="dragover">
                                    <img style="max-height: 128px; max-width: 128px;"
                                         ng-if="datasource.active.${field.name}"
                                         data-ng-src="{{'data:image/png;base64,' + datasource.active.${field.name}}}">
                                    <img data-ng-src="{{datasource.noImageUpload}}"
                                         style="max-height: 128px; max-width: 128px;"
                                         class="btn"
                                         ng-if="!datasource.active.${field.name}"
                                         ngf-drop ngf-select ngf-change="datasource.setFile($file, datasource.active, '${field.name}')" accept="image/*">
                                    <div class="remove btn btn-danger btn-xs" ng-if="datasource.active.${field.name}" ng-click="datasource.active.${field.name}=null">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </div>
                                </div>
                            <#elseif field.isFile()>
                                <div class="form-group">
                                    <img ng-if="!datasource.active.${field.name}" data-ng-src="{{datasource.noFileUpload}}" class="drop-box" style="width:100px;height:50px" ngf-drop ngf-select ngf-change="datasource.setFile($file, datasource.active, '${field.name}')" ngf-drag-over-class="dragover">
                                    <em ng-if="datasource.active.${field.name}">{{datasource.byteSize(datasource.active.${field.name})}}</em>
                                    <div class="btn btn-danger btn-xs" ng-if="datasource.active.${field.name}" ng-click="datasource.active.${field.name}=null">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </div>
                                </div>
                            <#else>
                                <input
                                    <#if field.getLength()??>
                                            maxlength="${field.getLength()}"
                                    </#if>
                                            type="<#if field.isEncryption()>password<#else>text</#if>"
                                            ng-model="${model.dataSourceName}.active.${field.name}"
                                            class="form-control"
                                            id="${currentType}-${field.name}"
                                            placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                                    <#if model.formMapMasks[field.name]?has_content>
                                            mask="${model.formMapMasks[field.name]}"
                                        <#assign valid = "" >
                                        <#if model.formMapMasks[field.name] == "999.999.999-99" >
                                            <#assign valid = "cpf" >
                                        <#elseif model.formMapMasks[field.name] == "99.999.999/9999-99">
                                            <#assign valid = "cnpj" >
                                        <#elseif model.formMapMasks[field.name] == "(99)9999-9999">
                                            <#assign valid = "" >
                                        </#if>
                                        <#if valid?has_content>
                                            valid="${valid}"
                                            data-error-message="{{'invalid.${valid}' | translate}}"
                                        </#if>
                                    </#if>
                                            <#if !field.isNullable()>required="required"</#if>>
                            </#if>
                        <#else> <!-- else for if !model.hasCronappFramework() -->
                            <#if field.getProperty("ngOptions")?? >
                                <ui-select ng-model="${model.dataSourceName}.active.${field.name}" crn-datasource="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}" class="crn-select" id="${currentType}-${field.name}" <#if !field.isNullable()>ng-required="true"<#else>ng-required="false"</#if> theme="bootstrap">
                                    <ui-select-match class="" placeholder="Select...">
                                        {{$select.selected.${field.getProperty("ngOptionsFkName")}}}
                                    </ui-select-match>
                                    <ui-select-choices  repeat="rowData in datasource.data | filter : $select.search" class="" refresh="" refresh-deplay="">
                                        <div class="" data-container="true">
                                            {{rowData.${field.getProperty("ngOptionsFkName")}}}
                                        </div>
                                    </ui-select-choices>
                                </ui-select>
                            <#elseif field.isImage()>
                                <div dynamic-image ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB" class="dynamic-image-container" <#if !field.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                                  {{"template.crud.clickOrDragAnImage" | translate}} 
                                </div>
                            <#elseif field.isFile()>
                                <div dynamic-file ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB" class="dynamic-image-container" <#if !field.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                                  {{"template.crud.clickOrDragAnFile" | translate}}
                                </div>
                            <#else>
                                <input
                                    <#if field.getLength()??>
                                            maxlength="${field.getLength()}"
                                    </#if>
                                            type="<#if field.isEncryption()>password<#else>${field.getHtmlType()}</#if>"
                                            ng-model="${model.dataSourceName}.active.${field.name}"
                                            class="form-control"
                                            id="${currentType}-${field.name}"
                                            placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                                            mask="${model.formMapMasks[field.name]}"
                                            mask-placeholder=""
                                    <#assign valid = "" >
                                      <#if model.formMapMasks[field.name] == "999.999.999-99;0" >
                                          <#assign valid = "cpf" >
                                      <#elseif model.formMapMasks[field.name] == "99.999.999/9999-99;0">
                                          <#assign valid = "cnpj" >
                                      </#if>
                                      <#if valid?has_content>
                                            valid="${valid}"
                                            data-error-message="{{'invalid.${valid}' | translate}}"
                                      </#if>
                                            <#if !field.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                            </#if>
                        </#if> <!-- end if !model.hasCronappFramework() -->
                    </div>
                </div>
            </#list>
                <!-- NtoN  -->
            <#list model.formFieldsNToN as field>
                <datasource append="false" name="${field.getName()}" entity="${model.dataSourceFullName}/{{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}}}/${field.getRelationName()}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" lazy="true" auto-post="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}"dependent-lazy-post="${model.dataSourceName}" dependent-lazy-post-field="${model.dataSourceName?uncap_first}"></datasource>
                <datasource name="All${field.getName()}" entity="${model.getDataSourceOfEntity(field.getName())}" keys="id" rows-per-page="100" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}"></datasource>
                <#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
                    <div class="component-holder ng-binding ng-scope " data-component="crn-combobox" ng-show="datasource.editing || datasource.inserting" >
                        <div class="form-group">
                            <label for="select-ui">${field.getName()?cap_first}</label>
                            <div id="select-ui" data-component="crn-tags">
                                <ui-select multiple crn-datasource="All${field.getName()}" ng-model="${field.getName()}.data" class="crn-select" style="min-width: 200px" theme="bootstrap" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting }}" <#if !field.isNullable()>required="required"</#if>>
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
                    </div>
                <#else>
                    <div class="component-holder ng-binding ng-scope col-md-6 col-xs-6 col-sm-6 col-lg-6" data-component="crn-combobox" ng-show="datasource.editing || datasource.inserting" >
                        <div class="form-group" >
                            <label for="select-ui">${field.getName()?cap_first}</label>
                            <div id="select-ui" data-component="crn-tags">
                                <ui-select crn-datasource="All${field.getName()}" ng-model="All${field.getName()}.active" class="crn-select" style="min-width: 200px" theme="bootstrap" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting }}" <#if !field.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
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
                    </div>
                    <div data-component="crn-button"  class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
                        <button class="btn btn-default btn-sm" data-component="crn-button" type="submit" ng-click="${field.getName()}.insert(All${field.getName()}.active); ${field.getName()}.data.push(All${field.getName()}.active)"><i class="fa fa-plus"></i></button>
                    </div>
                    <div class="component-holder " data-component="crn-grid" id="crn-grid-All${field.getName()}" ng-show="datasource.editing || datasource.inserting">
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
                                        <div data-component="crn-button"  class="">
                                            <button class="btn btn-default btn-sm" type="submit" data-component="crn-button" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="table-footer-controls">
                                <div data-component="crn-button"  class="">
                                    <button class="btn btn-default btn-block btn-clicked" ng-show="datasource.hasNextPage()" data-component="crn-button" ng-click="datasource.nextPage()">{{"template.crud.load_more" | translate}}...</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </#list>
                <!-- NtoN  end-->
            </fieldset>
        </form>
        <form>
            <fieldset>
                <!-- OneToN -->
            <#list model.formFieldsOneToN as field>
                <!--query filter 1toN -->
                <#assign filterSearch = "">
                <#assign entitySearch = "">
                <#if model.hasSearchableFilter() && !model.hasCronappFramework()>
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
                <datasource filter="${filterSearch}" name="${field.getName()}Grid" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" entity="${model.dataSourceFullName}/{{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}}}/${field.getRelationName()}${entitySearch}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" lazy="true" auto-post="true" dependent-lazy-post="${model.dataSourceName}" dependent-lazy-post-field="${model.dataSourceName?uncap_first}"></datasource>
                <div data-component="crn-button" class="">
                    <button class="btn btn-primary" onclick="$('#modal${field.getName()}Grid').modal('show');" data-component="crn-button" ng-click="${field.getName()}Grid.startInserting();"><i class="fa fa-plus"></i> <span class="">{{"Add" | translate}} ${field.getName()}</span> </button>
                </div>
                <!--search 1toN-->
                <#if model.hasSearchableFilter() && !model.hasCronappFramework()>
                    <#if model.getGridFilterSearchable()=="generalSearch">
                        <br/><br/><br/>
                        <div ng-show="${model.dataSourceName}.editing && !${field.getName()}Grid.hasDataBuffered()" class="">
                            <div class="form-group">
                                <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
                                <input type="text" <#if field.getLength()??>maxlength="${field.getLength()}"</#if> ng-model="search${field.getName()}" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}">
                            </div>
                        </div>
                    <#else>
                        <br/><br/><br/>
                        <div class="row" ng-show="${model.dataSourceName}.editing && !${field.getName()}Grid.hasDataBuffered()">
                            <#list field.getClazz().getFields() as scfield>
                                <#if scfield.isSearchable()>
                                    <#if (scfield.isDate() || scfield.isTime() || scfield.isTimestamp()) >
                                        <div class="">
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
                                    <#elseif (scfield.isNumber() || scfield.isDecimal()) >
                                        <div class="">
                                            <div>
                                                <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label>
                                                <input type="number" <#if scfield.isDecimal()>step="0.01"</#if> ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>">
                                            </div>
                                        </div>
                                    <#elseif scfield.isBoolean() >
                                        <div class="">
                                            <div>
                                                <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label>
                                                <input type="checkbox" ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>">
                                            </div>
                                        </div>
                                    <#else>
                                        <div class="">
                                            <div>
                                                <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapRelationFieldLabels[scfield.name]!}</label>
                                                <input type="text" <#if scfield.getLength()??>maxlength="${scfield.getLength()}" </#if>ng-model="${scfield.name}${field.getName()}" class="form-control" value="" placeholder="<#if scfield.label?has_content>${scfield.label}<#else>${scfield.name}</#if>" <#if model.formMapRelationFieldMasks[scfield.name]?has_content>mask="${model.formMapRelationFieldMasks[scfield.name]}"</#if>>
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
                                            <#if (!gField.isPrimaryKey() || field.getClazz().hasCompositeKey()) && ((gField.getName()?lower_case) != (model.dataSourceName?lower_case)) >
                                                <th class="">
                                                    <div class="">
                                                        <#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>
                                                    </div>
                                                </th>
                                            </#if>
                                        </#list>
                                        <th class="">
                                            <div class="">
                                                {{"template.crud.actions" | translate}}
                                            </div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-content" ng-repeat="rowData in datasource.data">
                                        <#list field.getClazz().getFields() as gField>
                                            <#if (!gField.isPrimaryKey() || field.getClazz().hasCompositeKey()) && ((gField.getName()?lower_case) != (model.dataSourceName?lower_case))>
                                                <td>
                                                    <div>
                                                        <#if gField.isReverseRelation() >
                                                            {{rowData.${gField.getName()}.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()} }}
                                                        <#elseif gField.isDate() && !model.hasCronappFramework()>
                                                            {{rowData.${gField.getName()} | date:'dd/MM/yyyy'}}
                                                        <#elseif gField.isTime() && !model.hasCronappFramework()>
                                                            {{rowData.${gField.getName()} | date:'HH:mm:ss'}}
                                                        <#elseif gField.isTimestamp() && !model.hasCronappFramework()>
                                                            {{rowData.${gField.getName()} | date:'dd/MM/yyyy HH:mm:ss'}}
                                                        <#elseif gField.isImage()>
                                                            <a ng-if="rowData.${gField.name}" ng-click="datasource.openImage(rowData.${gField.name})">
                                                                <img data-ng-src="{{rowData.${gField.name}.startsWith('http') || (rowData.${gField.name}.startsWith('/') && rowData.${gField.name}.length < 1000)? rowData.${gField.name} : 'data:image/png;base64,' + rowData.${gField.name}}}" style="max-height: 30px;">
                                                            </a>
                                                        <#elseif gField.isFile()>
                                                            <#if model.hasCronappFramework()>
                                                                <button ng-if="rowData.${gField.name}" data-component="crn-button" class="btn btn-sm" ng-click="cronapi.internal.downloadFileEntity(datasource, '${gField.name}', $index)">
                                                                    <span class="glyphicon glyphicon-download-alt"></span>
                                                                </button>
                                                            <#else>
                                                                <button class="btn btn-sm" data-component="crn-button" ng-click="datasource.downloadFile('${gField.name}', [<#list gField.getClazz().primaryKeys as pk>rowData.${pk.name}<#if pk_has_next>, </#if></#list>])">
                                                                    <span class="glyphicon glyphicon-download-alt"></span>
                                                                </button>
                                                            </#if>
                                                        <#else>
                                                            {{rowData.${gField.getName()} <#if model.formMapRelationFieldMasks[gField.name]?has_content && model.hasCronappFramework()>| mask:'${model.formMapRelationFieldMasks[gField.name]}'</#if>}}
                                                        </#if>
                                                    </div>
                                                </td>
                                            </#if>
                                        </#list>
                                        <td>
                                            <div>
                                                <button class="btn btn-default btn-sm" data-component="crn-button" ng-click="datasource.startEditing(rowData)" onclick="$('#modal${field.getName()}Grid').modal('show');" ><i class="fa fa-edit"></i></button>
                                                <button class="btn btn-default btn-sm" data-component="crn-button" ng-click="datasource.remove(rowData)"><i class="fa fa-times"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-footer-controls">
                                    <button class="btn btn-default btn-block btn-clicked" data-component="crn-button" ng-show="datasource.hasNextPage()" ng-click="datasource.nextPage()" content="{{&quot;template.crud.load_more&quot; | translate}}...">{{"template.crud.load_more" | translate}}...</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
                <!-- OneToOne  end -->
            </fieldset>
        </form>
    </div>
</div>


<!-- OneToOne modal -->
<#list model.formFieldsOneToN as field>
<div class="modal fade" id="modal${field.getName()}Grid">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{'Home.view.Close' | translate}}"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">${field.getName()}</h4>
                </div>
                <div class="modal-body">
                    <div class="list-group list-group-sm row">
                        <#list field.getClazz().getFields() as gField>
                            <#if !model.hasCronappFramework()>
                                <#if gField.isReverseRelation() >
                                    <#if (field.getDbFieldName() != gField.getDbFieldName())>
                                        <datasource name="${gField.getName()?capitalize}GridForUiSelect" entity="${model.getDataSourceOfEntity(gField.getRelationClazz().getName())}" keys="id" rows-per-page="100" lazy="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" ></datasource>
                                        <div data-component="crn-combobox-dynamic" id="crn-combobox-${field.getName()}Grid.active.${gField.getName()}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label for="combobox-${gField.getName()}" class=""><#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if></label>
                                                <ui-select ng-model="${field.getName()}Grid.active.${gField.getName()}" crn-datasource="${gField.getName()?capitalize}GridForUiSelect" class="crn-select" id="combobox-${gField.getName()}" required="required" ng-disabled="disabled" theme="bootstrap" >
                                                    <ui-select-match placeholder="Select..." class="">
                                                        {{$select.selected.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}}
                                                    </ui-select-match>
                                                    <ui-select-choices repeat="rowData in datasource.data | filter : $select.search" class="" refresh="" refresh-deplay="">
                                                        <div class="">
                                                            {{rowData.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}}
                                                        </div>
                                                    </ui-select-choices>
                                                </ui-select>
                                            </div>
                                        </div>
                                    </#if>
                                <#elseif (!gField.isPrimaryKey() || field.getClazz().hasCompositeKey())>

                                    <#assign dataComponentType = "crn-textinput">
                                    <#if gField.isImage() && model.hasCronappFramework()>
                                        <#assign dataComponentType = "crn-dynamic-image">
                                    <#elseif gField.isFile() && model.hasCronappFramework()>
                                        <#assign dataComponentType = "crn-dynamic-file">
                                    </#if>
                                    <div data-component="${dataComponentType}"  id="crn-textinput-${gField.getDbFieldName()}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label for="textinput-${gField.getDbFieldName()}"><#if gField.label?has_content>${gField.label?cap_first}<#else>${gField.name?capitalize}</#if></label>
                                            <#if gField.isBoolean() >
                                                <input type="checkbox" ng-model="${field.getName()}Grid.active.${gField.getName()}"  id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>>
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
                                                           ng-model="${field.getName()}Grid.active.${gField.getName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>>
                                                </div>
                                            <#elseif (gField.isNumber() || gField.isDecimal()) >
                                                <input type="number" <#if gField.isDecimal()>step="0.01"</#if> ng-model="${field.getName()}Grid.active.${gField.getName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if !gField.isNullable()>required="required"</#if>>
                                            <#elseif gField.isImage()>
                                                <div class="form-group upload-image-component" ngf-drop ngf-drag-over-class="dragover">
                                                    <img style="max-height: 128px; max-width: 128px;"
                                                         ng-if="${field.getName()}Grid.active.${gField.getName()}"
                                                         data-ng-src="{{'data:image/png;base64,' + ${field.getName()}Grid.active.${gField.getName()}}}">
                                                    <img data-ng-src="{{${field.getName()}Grid.noImageUpload}}"
                                                         style="max-height: 128px; max-width: 128px;"
                                                         class="btn"
                                                         ng-if="!${field.getName()}Grid.active.${gField.getName()}"
                                                         ngf-drop ngf-select ngf-change="${field.getName()}Grid.setFile($file, ${field.getName()}Grid.active, '${gField.getName()}')" accept="image/*">
                                                    <div class="remove btn btn-danger btn-xs" ng-if="${field.getName()}Grid.active.${gField.getName()}" ng-click="${field.getName()}Grid.active.${gField.getName()}=null">
                                                        <span class="glyphicon glyphicon-remove"></span>
                                                    </div>
                                                </div>
                                            <#elseif gField.isFile()>
                                                <div class="form-group">
                                                    <img ng-if="!${field.getName()}Grid.active.${gField.getName()}" data-ng-src="{{${field.getName()}Grid.noFileUpload}}" class="drop-box" style="width:100px;height:50px" ngf-drop ngf-select ngf-change="${field.getName()}Grid.setFile($file, ${field.getName()}Grid.active, '${gField.getName()}')" ngf-drag-over-class="dragover">
                                                    <em ng-if="${field.getName()}Grid.active.${gField.getName()}">{{${field.getName()}Grid.byteSize(${field.getName()}Grid.active.${gField.getName()})}}</em>
                                                    <div class="btn btn-danger btn-xs" ng-if="${field.getName()}Grid.active.${gField.getName()}" ng-click="${field.getName()}Grid.active.${gField.getName()}=null">
                                                        <span class="glyphicon glyphicon-remove"></span>
                                                    </div>
                                                </div>
                                            <#else>
                                                <input type="<#if gField.isEncryption()>password<#else>text</#if>"
                                                    <#if gField.getLength()??>
                                                       maxlength="${gField.getLength()}"
                                                    </#if>
                                                       ng-model="${field.getName()}Grid.active.${gField.getName()}" class="form-control" id="textinput-${gField.getDbFieldName()}" placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>" <#if model.formMapRelationFieldMasks[gField.name]?has_content>mask="${model.formMapRelationFieldMasks[gField.name]}"</#if> <#if !gField.isNullable()>required="required"</#if>>
                                            </#if>
                                        </div>
                                    </div>
                                </#if>
                                <#else><!-- else of !model.hasCronappFramework() -->
                                <#if gField.isReverseRelation() >
                                    <#if (field.getDbFieldName() != gField.getDbFieldName())>
                                        <datasource name="${gField.getName()?capitalize}GridForUiSelect" entity="${model.getDataSourceOfEntity(gField.getRelationClazz().getName())}" keys="id" rows-per-page="100" lazy="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" ></datasource>
                                        <div data-component="crn-combobox-dynamic" id="crn-combobox-${field.getName()}Grid.active.${gField.getName()}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label for="combobox-${gField.getName()}" class=""><#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if></label>
                                                <ui-select ng-model="${field.getName()}Grid.active.${gField.getName()}" crn-datasource="${gField.getName()?capitalize}GridForUiSelect" class="crn-select" id="combobox-${gField.getName()}" <#if !gField.isNullable()>ng-required="true"<#else>ng-required="false"</#if> ng-disabled="disabled" theme="bootstrap" >
                                                    <ui-select-match placeholder="Select..." class="">
                                                        {{$select.selected.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}}
                                                    </ui-select-match>
                                                    <ui-select-choices repeat="rowData in datasource.data | filter : $select.search" class="" refresh="" refresh-deplay="">
                                                        <div class="">
                                                            {{rowData.${gField.getRelationClazz().getFirstStringFieldNonPrimaryKey().getName()}}}
                                                        </div>
                                                    </ui-select-choices>
                                                </ui-select>
                                            </div>
                                        </div>
                                    </#if>
                                <#elseif (!gField.isPrimaryKey() || field.getClazz().hasCompositeKey())>

                                    <#assign dataComponentType = "crn-textinput">
                                    <#if gField.isImage() && model.hasCronappFramework()>
                                        <#assign dataComponentType = "crn-dynamic-image">
                                    <#elseif gField.isFile() && model.hasCronappFramework()>
                                        <#assign dataComponentType = "crn-dynamic-file">
                                    </#if>
                                    <div data-component="${dataComponentType}"  id="crn-textinput-${gField.getDbFieldName()}" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label for="textinput-${gField.getDbFieldName()}"><#if gField.label?has_content>${gField.label?cap_first}<#else>${gField.name?capitalize}</#if></label>
                                            <#if gField.isImage()>
                                                <div dynamic-image ng-model="${field.getName()}Grid.active.${gField.getName()}" max-file-size="5MB" class="dynamic-image-container" <#if !gField.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                                                  {{"template.crud.clickOrDragAnImage" | translate}} 
                                                </div>
                                            <#elseif gField.isFile()>
                                                <div dynamic-file ng-model="${field.getName()}Grid.active.${gField.getName()}" max-file-size="5MB" class="dynamic-image-container" <#if !gField.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                                                  {{"template.crud.clickOrDragAnFile" | translate}}
                                                </div>
                                            <#else>
                                                <input type="<#if gField.isEncryption()>password<#else>${gField.getHtmlType()}</#if>"
                                                    <#if gField.getLength()??>
                                                       maxlength="${gField.getLength()}"
                                                    </#if>
                                                       ng-model="${field.getName()}Grid.active.${gField.getName()}" class="form-control"
                                                       id="textinput-${gField.getDbFieldName()}"
                                                       placeholder="<#if gField.label?has_content>${gField.label}<#else>${gField.name?capitalize}</#if>"
                                                       mask="${model.formMapRelationFieldMasks[gField.name]}"
                                                       mask-placeholder=""
                                                    <#if model.formMapRelationFieldMasks[gField.name] == "999.999.999-99;0" >
                                                        <#assign valid = "cpf" >
                                                    <#elseif model.formMapRelationFieldMasks[gField.name] == "99.999.999/9999-99;0">
                                                        <#assign valid = "cnpj" >
                                                    </#if>
                                                    <#if valid?has_content>
                                                        valid="${valid}"
                                                        data-error-message="{{'invalid.${valid}' | translate}}"
                                                    </#if>
                                                    <#if !gField.isNullable()>ng-required="true"<#else>ng-required="false"</#if>>
                                            </#if>
                                        </div>
                                    </div>
                                </#if>
                            </#if> <!-- end if !model.hasCronappFramework() -->

                        </#list>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-component="crn-button" ng-click="${field.getName()}Grid.post();" onclick="(!${field.getName()}Grid.missingRequiredField()?$('#modal${field.getName()}Grid').modal('hide'):void(0))">{{'Save' | translate}}</button>
                    <button type="button" class="btn btn-default" data-component="crn-button" data-dismiss="modal">{{'Home.view.Close' | translate}}</button>
                </div>
            </form>
        </div>
    </div>
</div>
</#list>
<!-- OneToOne modal end-->