<ion-view cache-view="false" hide-back-button="true">
  <ion-header-bar>
    <ion-nav-bar class="nav-bar-container bar bar-header" data-component="crn-navbar" xattr-theme="">
      <ion-nav-buttons side="left" class="buttons buttons-left header-item">
        <button class="button button-clear" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" menu-toggle="left" data-component="crn-button" xattr-type="button-clear"> <i class="icon ion-navicon"></i> </button>
        <button class="button button-clear" ng-show="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.cancel()" data-component="crn-button" xattr-type="button-clear"> <i class="icon ion-android-arrow-back"></i> </button>
      </ion-nav-buttons>
      <ion-nav-title class="title title-center header-item">
        <h1 class="title">${model.dataSourceName}</h1>
      </ion-nav-title>
      <ion-nav-buttons side="right" class="buttons buttons-right header-item">
        <button class="button button-clear" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.startInserting()" data-component="crn-button" xattr-type="button-clear" > <i class="icon ion-plus-round"></i> </button>
        <button class="button button-clear" ng-show="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.post()" data-component="crn-button" xattr-type="button-clear" > <i class="icon ion-checkmark"></i> </button>
      </ion-nav-buttons>
    </ion-nav-bar>
  </ion-header-bar>
  <ion-content>
    <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-906854">
      <datasource <#if model.hasColumnFilter()>filter=""</#if> name="${model.dataSourceName}" entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="10" delete-message="Deseja remover?" class="" schema="${model.getDSSchema(model.dataSourceName)}"></datasource>
    </div>
  <#-- Para o filtro model.getGridFilterSearchable()="generalSearch" a regra está no componente "cron-list" -->
  <#if model.hasCronappFramework() || model.hasSearchableFilter()>
  <#if model.getGridFilterSearchable()=="specificSearch">
	<#if model.hasSearchableFilter()>
	<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="component-holder ng-binding ng-scope" data-component="crn-complex-search" >
	  <fieldset class="list">
	  <#list model.formFields as field>
		<#if field.isSearchable()>
		<div  data-component="crn-search" id="crn-search-${field.name}-${model.random}">
          <label class="item item-input" id="search-${field.name}-${model.random}"><i class="icon ion-search placeholder-icon"></i>
            <input type="<#if field.isDate() >date<#elseif field.isTimestamp()>time<#elseif field.isNumber() >number<#elseif field.isDouble() >number<#else>text</#if>" ng-model="vars.search${field.name}" mask="${model.formMapMasks[field.name]}" cronapp-filter="${field.name}" crn-datasource="${model.dataSourceName}" cronapp-filter-caseinsensitive="true" cronapp-filter-autopost="false" cronapp-filter-operator="=" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
          </label>
		</div>
		</#if>
	  </#list>
	    <button class="button button-dark component-holder" data-component="crn-filter-button" type="submit" cronapp-filter="" cronapp-filter-caseinsensitive="true" 
	       xattr-size="" xattr-fullsize="" xattr-theme="btn-default" crn-datasource="${model.dataSourceName}" ng-click="" id="crn-button-search">
		   <i class="ion ion-home"></i><span>{{"template.crud.search" | translate}}</span>
	    </button> 
	  </fieldset>
	</div>
	</#if>
   </#if>
   </#if>
	
    <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
      <div class="component-holder ng-binding ng-scope" data-component="crn-ion-list" id="crn-ion-list-main">
        <cron-list id="ion-list-main" options="${model.getMobileAdvancedList(model.dataSourceName, model.dataSourceName, field)}"
                   class="" style="">
        </cron-list>
      </div>
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
            <label id="input-floating-${field.name}" class="item item-input item-floating-label component-holder" data-component="crn-input-floating">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="date" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
              <#elseif (field.isTimestamp())>
            <label id="crn-input-${field.name}-${model.random}" class="item item-input item-floating-label component-holder" data-component="crn-input-floating">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="time" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
              <#elseif (field.isTimestamp())>
            <label id="crn-input-${field.name}-${model.random}" class="item item-input item-floating-label component-holder" data-component="crn-input-floating">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="datetime-local" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
              <#elseif field.isNumber() >
            <label id="crn-input-inline-${field.name}-${model.random}" class="item item-input component-holder" data-component="crn-input-inline">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <input type="number" ng-model="${model.dataSourceName}.active.${field.name}" class="" id="textinput-${field.name}" name="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>>
            </label>
              <#elseif field.getProperty("ngOptions")??>
            <datasource name="${field.getProperty("ngOptions").dataSourceName}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class="" schema="${model.getDSSchema(field.getProperty("ngOptions").dataSourceName)}"></datasource>
            <label for="textinput-${field.name}" class="item item-input item-select component-holder" data-component="crn-dynamic-select" id="crn-dynamic-select-${field.name}">
              <span class="input-label">${model.formMapLabels[field.name]!}</span>
              <select crn-datasource="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}"
                      ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="dynamic-${field.name}"
                      name="dynamic-${field.name}"
                      xkey-field="${field.getProperty("ngOptions").keys}"
                      xdisplay-field="${field.getProperty("ngOptionsFkName")}" <#if !field.isNullable()>required="required"</#if>>
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
          rows-per-page="100"
          parameters="${model.dataSourceName?uncap_first}={{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}|raw}}"
		  schema="${model.getDSSchema(relationClassName)}">
      </datasource>
	  <datasource
          data-component="crn-datasource"
          name="All${field.getName()}"
          entity="${model.namespace}.${field.getName()}"
          keys="${model.getJoinKeys(field.getClazz().getAjustedFullPrimaryKeys())}"
		  schema="${model.getDSSchema(field.getName())}">
      </datasource>
              <#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
            <label class="item item-input item-select component-holder" data-component="crn-multiselect" >
              <span>${field.getName()?cap_first}</span>
              <select
                  ng-model="${relationClassName}.data"
                  crn-datasource="All${field.getName()}"
                  multiple
                  id="multiselect-${field.name}"
                  name="multiselect-${field.name}"
                  xkey-field="${model.getFirstTextFieldOfManyToManyRelation(field.getName())}"
                  xdisplay-field="${model.getFirstTextFieldOfManyToManyRelation(field.getName())}">
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
