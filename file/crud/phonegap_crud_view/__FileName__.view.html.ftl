<ion-view cache-view="false" view-title="${model.dataSourceName}" hide-back-button="true">
  <ion-nav-buttons side="right"> 
    <button class="button button-stable" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.startInserting()"> <i class="icon ion-plus-round"></i> </button>
    <button class="button button-stable" ng-show="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.post()"> <i class="icon ion-checkmark"></i> </button>
  </ion-nav-buttons>
  <ion-nav-buttons side="left">
    <button class="button button-icon button-clear ion-navicon" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" menu-toggle="left"> </button>
    <button class="button button-stable" ng-show="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.cancel()"> <i class="icon ion-android-arrow-back"></i> </button>
  </ion-nav-buttons>
  <ion-content>
    <#if model.hasColumnFilter()>
    <div class="list list-inset" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
      <label class="item item-input">
      <i class="icon ion-search placeholder-icon"></i>
      <input type="text" placeholder="{{'template.crud.search' | translate}}" ng-model="query" value="%"> </label>
    </div>
    <#else>
    <div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" data-component="crn-datasource-filter" id="crn-datasource-filter-general" class="">
      <label class="item item-input" id="cloud-search1">
        <i class="icon ion-search placeholder-icon"></i>
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
        <input type="text"  ng-model="vars.search" cronapp-filter="${fieldsString}" cronapp-filter-operator="" cronapp-filter-autopost="true" crn-datasource="${model.dataSourceName}" value="" placeholder="{{'template.crud.search' | translate}}">
      </label>
    </div>   
    </#if>
    <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-906854">
      <datasource <#if model.hasColumnFilter()>filter=""</#if> name="${model.dataSourceName}" entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="10" delete-message="Deseja remover?" class=""></datasource>
    </div>
    <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
      <ion-list can-swipe="listCanSwipe">
        <ion-item ng-repeat="rowData in datasource.data" class="item" ng-click="datasource.startEditing(rowData)">
          <div class="row">
            <#list model.gridFields as field>
            <div class="col">
              <#if field.getProperty("firstStringField")??>
              {{rowData.${field.getProperty("firstStringField")}}}
              <#else>
              <#if field.isDate() >
              {{rowData.${field.name} | date:'dd/MM/yyyy'}}
              <#elseif field.isTime() >
              {{rowData.${field.name} | date:'HH:mm:ss'}}
              <#elseif field.isTimestamp() >
              {{rowData.${field.name} | date:'dd/MM/yyyy HH:mm:ss'}}
              <#elseif field.isImage()>
              <a ng-if="rowData.${field.name}" ng-click="datasource.openImage(rowData.${field.name})">
                  <img data-ng-src="{{rowData.${field.name}.startsWith('http') || (rowData.${field.name}.startsWith('/') && rowData.${field.name}.length < 1000)? rowData.${field.name} : 'data:image/png;base64,' + rowData.${field.name}}}" style="max-height: 30px;">
              </a>
              <#elseif field.isFile()>
              <button ng-if="rowData.${field.name}" class="button" ng-click="cronapi.internal.downloadFileEntityMobile(datasource, '${field.name}', $index)">
                  <span class="icon ion-android-download"></span>
              </button>
              <#else>
              {{rowData.${field.name}}}
              </#if>
              </#if>
            </div>
            </#list>
          </div>
          <ion-option-button class="button-positive" ng-click="datasource.startEditing(rowData)">
            <i class="icon ion-edit"></i>
          </ion-option-button>
          <ion-option-button class="button-assertive" ng-click="datasource.remove(rowData)">
            &nbsp;
            <i class="icon ion-trash-a"></i>
          </ion-option-button>
        </ion-item>
      </ion-list>
    </div>
    <div ng-show="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
      <form crn-datasource="${model.dataSourceName}">
        <fieldset ng-disabled="!${model.dataSourceName}.editing &amp;&amp; !${model.dataSourceName}.inserting">
          <div class="list">
            <#list model.formFields as field>
            <!-- ${field.name} begin -->
            <#if field.isBoolean() >
			<div class="component-holder ng-binding ng-scope" data-component="crn-toggle" id="crn-toggle-${field.name}">
				<label class="item item-toggle">
				  <span><#if field.label?has_content>${field.label}<#else>${field.name}</#if></span>
				  <div for="textinput-${field.name}" class="toggle toggle-assertive">
					<input type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if !field.isNullable()>required="required"</#if>>
					<div class="track">
					  <div class="handle"></div>
					</div>
				  </div>
				</label>
			</div>
            <#elseif (field.isDate()) >
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="date" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
            <#elseif (field.isTime() || field.isTimestamp())>
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="time" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
            <#elseif field.isNumber() >
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="number" ng-model="${model.dataSourceName}.active.${field.name}" class="" id="textinput-${field.name}" name="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
            </label>
            <#elseif field.getProperty("ngOptions")??>
            <datasource name="${field.getProperty("ngOptions").dataSourceName}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class=""></datasource>
            <label for="textinput-${field.name}" class="item item-input item-select component-holder" data-component="crn-dynamic-select" id="crn-dynamic-select-${field.name}">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <select crn-datasource="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}" ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="dynamic-${field.name}" name="dynamic-${field.name}" 
				ng-options="${field.getProperty("ngOptions").options}" <#if !field.isNullable()>required="required"</#if>>
                <option value=''>None</option>
              </select>
            </label>
            <#elseif field.isImage()>
            <div class="component-holder ng-binding ng-scope" data-component="crn-dynamic-image">
              <div class="item item-input item-stacked-label">
                <label class="input-label">${model.formMapLabels[field.name]!}</label>
                <div class="form-group">
                  <div dynamic-image="" ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB" class="dynamic-image-container" ng-required="false">
                    {{"template.crud.clickToAddImage" | translate}}
                  </div>
                </div>
              </div>
            </div>
            <#elseif field.isFile()>
            <div class="component-holder ng-binding ng-scope" data-component="crn-dynamic-file" >
              <div class="item item-input item-stacked-label">
                <label class="input-label">${model.formMapLabels[field.name]!}</label>
                <div class="form-group">
                  <div dynamic-file="" ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB" class="dynamic-image-container" ng-required="false">
                    {{"template.crud.clickToAddFile" | translate}}
                  </div>
                </div>
              </div>
            </div> 
            <#else>
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
            <span class="input-label">${model.formMapLabels[field.name]!}</span>
				<input
				type="text"
				placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
				ng-model="${model.dataSourceName}.active.${field.name}"
				id="textinput-${field.name}"
				name="textinput-${field.name}"
				<#if model.formMapMasks[field.name]?has_content>
				mask="${model.formMapMasks[field.name]}"
				<#if model.formMapMasks[field.name] == "999.999.999-99" >
				<#assign valid = "cpf" >
				<#elseif model.formMapMasks[field.name] == "99.999.999/9999-99">
				<#assign valid = "cnpj" >
				</#if>
				<#if valid??>
				valid="${valid}"
				data-error-message="{{'invalid.${valid}' | translate}}"
				</#if>
				</#if>
				<#if !field.isNullable()>required="required"</#if>>
            </label>
            </#if>
            </#list>
            
            <!-- NtoN  -->
            <#list model.formFieldsNToN as field>
            <datasource name="${field.getName()}" entity="${model.dataSourceFullName}/{{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}}}/${field.getRelationName()}" append="false" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" lazy="true" auto-post="true" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}" dependent-lazy-post="${model.dataSourceName}" dependent-lazy-post-field="${model.dataSourceName?uncap_first}"></datasource>
            <datasource name="All${field.getName()}" entity="${model.getDataSourceOfEntity(field.getName())}" keys="id" rows-per-page="100" enabled="{{${model.dataSourceName}.editing || ${model.dataSourceName}.inserting}}"></datasource>
            <#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
            <label class="item item-input item-select component-holder" data-component="crn-multiselect" > 
              <span>${field.getName()?cap_first}</span> 
              <select 
                ng-model="${field.getName()}.data" 
                multiple
                id="multiselect-${field.name}" 
                name="multiselect-${field.name}" 
                ng-options="opt as opt.${model.getFirstTextFieldOfManyToManyRelation(field.getName())} for opt in All${field.getName()}.data track by opt.${model.getFirstTextFieldOfManyToManyRelation(field.getName())}">
              </select> 
            </label> 
            </#if>
            </#list>
            <!-- NtoN  end-->

          </div>
        </fieldset>
      </form>
    </div>
  </ion-content>
</ion-view>
