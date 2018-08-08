<h3><#if model.realName ?has_content >${model.realName}<#else>${model.dataSourceName}</#if></h3>

<!-- div row para pesquisa -->
<!--<div class="row">-->

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
<datasource data-component="crn-datasource" filter="${filterSearch}" name="${model.dataSourceName}" entity="${model.namespace}.${model.dataSourceName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource>

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
            <input type="text" ng-model="vars.search" cronapp-filter="${fieldsString}" cronapp-filter-operator="" cronapp-filter-caseinsensitive="false" cronapp-filter-autopost="true" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="{{'template.crud.search' | translate}}">
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
                        <input type="${field.getHtmlType()}" ng-model="vars.search_${field.name}" mask="${model.formMapMasks[field.name]}" mask-placeholder="" cronapp-filter="${field.name}" cronapp-filter-caseinsensitive="false" cronapp-filter-autopost="false" cronapp-filter-operator="" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
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
                <input type="text" cronapp-filter="${model.getFirstFieldStringNotPk().name}" cronapp-filter-operator="" cronapp-filter-caseinsensitive="false" cronapp-filter-autopost="true" crn-datasource="${model.dataSourceName}" class="form-control" value="" placeholder="<#if model.getFirstFieldStringNotPk().label?has_content>${model.getFirstFieldStringNotPk().label}<#else>${model.getFirstFieldStringNotPk().name}</#if>">
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

<div data-component="crn-button" id="crn-button-564202" class="">
    <button class="btn btn-primary" type="submit" onclick="" data-component="crn-button" ng-click="${model.dataSourceName}.startInserting()" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"><i class="fa fa-user"></i> <span class="">{{"template.crud.new" | translate}}</span></button>
</div>
<!-- fim div row para pesquisa -->
<!--</div>-->

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
                    <#assign currentType = "enterprise-dynamic-combobox">
                    <datasource data-component="crn-datasource" name="${field.type}Combo" entity="${model.namespace}.${field.type}" keys="${field.getProperty("ngOptions").keys}" class="" dependent-by="{{${model.dataSourceName}}}"></datasource>
                </#if>
                <#assign dataComponentType = "crn-${currentType}">
				
                <#if field.isImage() && model.hasCronappFramework()>
                    <#assign dataComponentType = "crn-dynamic-image">
                <#elseif field.isFile() && model.hasCronappFramework()>
                    <#assign dataComponentType = "crn-dynamic-file">
				<#elseif (field.isDate() || field.isTime() || field.isTimestamp()) >
					<#assign dataComponentType = "crn-enterprise-date">
				<#elseif (field.isBoolean()) >
					<#assign dataComponentType = "crn-enterprise-checkbox">
                </#if>

                <div data-component="${dataComponentType}" id="crn-${currentType}-${field.name}" class="">
                    <div class="form-group">
						<#if !field.isBoolean()>
                        <label for="${currentType}-${field.name}" class="">${model.formMapLabels[field.name]!?cap_first}</label>
						</#if>
                        <#if !model.hasCronappFramework()>

                            <#if field.isBoolean() >
                                <input type="checkbox" class="k-checkbox" ng-model="${model.dataSourceName}.active.${field.name}" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
								<label for="${currentType}-${field.name}" class="k-checkbox-label">${model.formMapLabels[field.name]!?cap_first}</label>
                            <#elseif (field.isDate() || field.isTime() || field.isTimestamp()) >
                                <div style="position:relative">
									<cron-date 
										options="${model.getOptionsDate(field)}" 
										ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
									</cron-date> 								   
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
								<#assign dataSourceName = "${field.type}Combo">
								<cron-dynamic-select 
									<#if !field.isNullable()>required="required"</#if>
									id="${currentType}-${field.name}"
									options="${model.getComboOptions(field.type, field.getProperty("ngOptionsFkName"), field.getProperty("ngOptions").keys, dataSourceName)}" 
									ng-model="${model.dataSourceName}.active.${field.name}" 
									class="crn-select form-control">
								</cron-dynamic-select>    
                            <#elseif field.isBoolean() >
                                <input type="checkbox" class="k-checkbox" ng-model="${model.dataSourceName}.active.${field.name}" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
								<label for="${currentType}-${field.name}" class="k-checkbox-label">${model.formMapLabels[field.name]!?cap_first}</label>
							<#elseif (field.isDate() || field.isTime() || field.isTimestamp()) >
								<cron-date 
									options="${model.getOptionsDate(field)}" 
									ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="${currentType}-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
								</cron-date> 								   
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
                                            maxlength="${field.getLength()?string["0"]}"
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
				<#assign relationClassName = "">
				<#assign dataSourceName = "">
				<#assign keysDs = "">
				<#if model.getManyToManyRelationship(field.getName())?? && model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz()??>
					<#assign relationClassName = "${model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz()}">
					<#if model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz().getAjustedFullPrimaryKeys()??>
						<#assign keysDs = "${model.getJoinKeys(model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz().getAjustedFullPrimaryKeys())}">
					</#if>
				</#if>
				
				<datasource 
					data-component="crn-datasource" 
					name="${relationClassName}" 
					entity="${model.namespace}.${relationClassName}" 
					keys="${keysDs}" 
					dependent-lazy-post="${model.dataSourceName}" 
					rows-per-page="100" lazy="true" 
					parameters="${model.dataSourceName?uncap_first}={{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}|raw}}"
					delete-message="Deseja remover?" class=""></datasource>
                <datasource data-component="crn-datasource" name="${field.getName()}NCombo" entity="${model.namespace}.${field.getName()}" keys="${model.getJoinKeys(field.getClazz().getAjustedFullPrimaryKeys())}"></datasource>
				
				<#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
                    <div class="component-holder ng-binding ng-scope " data-component="crn-enterprise-combobox-multiple" ng-show="datasource.editing || datasource.inserting" >
                        <div class="form-group">
                            <label for="select-ui">${field.getName()?cap_first}</label>
							<cron-multi-select options="${model.getMultiSelectOptions(field)}" 
								ng-required="false" id="combobox${field.getName()}" ng-model="${relationClassName}.data" class="crn-select form-control" style="">
							</cron-multi-select> 
                        </div>
                    </div>
                <#else>
					<h3 class="lead component-holder" data-component="crn-subtitle">${field.getName()?cap_first}</h3>
					<div class="component-holder ng-binding ng-scope" data-component="crn-cron-grid" id="crn-grid-${field.getName()}">
						<#assign dataSourceName = "${relationClassName}">
						<cron-grid options="${model.getGridOptions(relationClassName, dataSourceName, field)}" ng-model="${relationClassName}.data" class="" style=""></cron-grid>
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
				<datasource 
					data-component="crn-datasource" 
					filter="${filterSearch}" 
					name="${field.getName()}Grid" 
					entity="${model.namespace}.${field.getName()}" 
					keys="${model.dataSourcePrimaryKeys}" 
					dependent-lazy-post="${model.dataSourceName}" 
					dependent-lazy-post-field="${model.dataSourceName?uncap_first}"
					rows-per-page="100" lazy="true" 
					parameters="${model.getParametersDataSource(field)}"
					delete-message="Deseja remover?" class=""></datasource>
				<!-- teste -->
				<#list field.getClazz().getFields() as gField>
					<#if model.hasCronappFramework()>
						<#if gField.isReverseRelation() || gField.isRelation() >
							<#if (field.getDbFieldName() != gField.getDbFieldName())>
								<#assign dataSourceCombo = "${gField.getRelationClazz().getName()}GridCombo">
				<datasource data-component="crn-datasource" name="${dataSourceCombo}" entity="${model.namespace}.${gField.getRelationClazz().getName()}" keys="${model.getJoinKeys(gField.getRelationClazz().getAjustedFullPrimaryKeys())}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource>
							</#if>
						</#if>
					</#if>
				</#list>
				<h3 class="lead component-holder" data-component="crn-subtitle"><#if field.getClazz()?? && field.getClazz().getRealName()?? && field.getClazz().getRealName()?has_content>${field.getClazz().getRealName()}<#else>${field.getName()}</#if> </h3>				
				<div class="component-holder ng-binding ng-scope" data-component="crn-cron-grid" id="crn-grid-${field.getName()}Grid">
					<#assign classname = "${field.clazz.name}">
					<#assign dataSourceName = "${classname}Grid">
					<cron-grid options="${model.getGridOptions(classname, dataSourceName, field)}" ng-model="${field.name}Grid.data" class="" style=""></cron-grid>
				</div> 
            </#list>
                <!-- OneToOne  end -->
            </fieldset>
        </form>
    </div>
</div>
