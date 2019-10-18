<ion-view cache-view="false" hide-back-button="true">
  <ion-header-bar class="bar bar-header bar-positive" xattr-theme="bar-positive" data-component="crn-ion-header-bar">
      <div side="left" class="buttons buttons-left header-item">
        <button aria-label="{{'Accessibility.Button.Aria.Label.NavIcon' | translate}}" class="button button-clear" ng-if="!${model.dataSourceName}.inserting && !${model.dataSourceName}.editing" menu-toggle="left" data-component="crn-button" xattr-type="button-clear"> <i class="icon ion-navicon"></i> </button>
        <button aria-label="{{'Accessibility.Button.Aria.Label.Back' | translate}}" class="button button-clear" ng-if="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" ng-click="${model.dataSourceName}.cancel()" data-component="crn-button" xattr-type="button-clear"> <i class="icon ion-ios-arrow-back"></i> </button>
      </div>
        <h1 class="title">${model.dataSourceName}</h1>
      <div side="right" class="buttons buttons-right header-item">
      </div>
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
            <input type="<#if field.isDate() >date<#elseif (field.isTimestamp() || field.isTime())>time<#elseif (field.isBoolean())>checkbox<#elseif (field.isNumber() || field.isDecimal() || field.isLong())>number<#else>text</#if>" ng-model="vars.search${field.name}" mask="${model.formMapMasks[field.name]}" cronapp-filter="${field.name}" crn-datasource="${model.dataSourceName}" cronapp-filter-caseinsensitive="true" cronapp-filter-autopost="false" cronapp-filter-operator="=" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
          </label>
		</div>
		</#if>
	  </#list>
	    <button aria-label="{{"template.crud.search" | translate}}" class="button button-dark component-holder" data-component="crn-filter-button" type="submit" cronapp-filter="" cronapp-filter-caseinsensitive="true"
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
        <cron-list ng-model="vars.cronlist${model.dataSourceName}" id="ion-list-main" options="${model.getMobileList(model.dataSourceName, model.dataSourceName, field)}"
                   class="" style="">
        </cron-list>
      </div>
    </div>
  </ion-content>
</ion-view>
