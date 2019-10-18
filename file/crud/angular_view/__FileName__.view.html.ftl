<h2 class="component-holder text-left h3 title" xattr-position="text-left" xattr-type="h3" data-component="crn-text-component" id="crn-text-component-${model.random}"><#if model.realName ?has_content >${model.realName}<#else>${model.dataSourceName}</#if> - {{"template.view.search" | translate}}</h2>

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
<datasource data-component="crn-datasource" filter="${filterSearch}" name="${model.dataSourceName}" entity="${model.namespace}.${model.dataSourceName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" class="" schema="${model.getDSSchema(model.dataSourceName)}" condition="${model.getDSCondition(model.dataSourceName)}" lazy="true"></datasource>

<#if model.hasColumnFilter()>
<div role="search" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="">
  <div class="form-group">
    <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
    <input type="text" id="textinput-filter" class="form-control k-textbox" ng-model="query" value="%" placeholder="{{'template.crud.search' | translate}}">
  </div>
</div>
<#elseif model.hasCronappFramework() || model.hasSearchableFilter()>
  <#if model.getGridFilterSearchable()=="generalSearch">
    <div role="search" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" data-component="crn-textinput" id="crn-datasource-filter-general${model.random}" class="">
      <div class="form-group">
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
        <input type="text" ng-model="vars.search" id="textinput-filter" class="form-control k-textbox" value="" placeholder="{{'template.crud.search' | translate}}">
      </div>
    </div>
  <#elseif model.getGridFilterSearchable()=="specificSearch">
    <#if model.hasSearchableFilter()>
            <div role="search" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
              <fieldset>
            <#list model.formFields as field>
              <#if field.isSearchable()>
                <div  data-component="crn-textinput" id="crn-datasource-filter-${field.name}-${model.random}" class="">
                  <div class="form-group">
					  <#if field.isBoolean() >
              <input type="checkbox" id="checkbox-filter-${field.name}" ng-model="vars.search${field.name}" class="k-checkbox" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
              <label for="checkbox-filter-${field.name}" class="k-checkbox-label">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
            <#else>
                        <label for="textinput-filter-${field.name}" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                        <input type="${field.getHtmlType()}" id="textinput-filter-${field.name}" class="form-control k-textbox" ng-model="vars.search${field.name}" mask="${model.formMapMasks[field.name]}" mask-placeholder="" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
            </#if>
                  </div>
                </div>
              </#if>
            </#list>
              </fieldset>
            </div>
    <#else>
        <div role="search" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" data-component="crn-textinput" id="crn-datasource-filter-${model.getFirstFieldStringNotPk().name}-${model.random}" class="">
          <div class="form-group">
            <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[model.getClazz().getSearchField().name]!}</label>
            <input id="textinput-filter" type="text" class="form-control k-textbox" ng-model="vars.search" value="" placeholder="<#if model.getFirstFieldStringNotPk().label?has_content>${model.getFirstFieldStringNotPk().label}<#else>${model.getFirstFieldStringNotPk().name}</#if>">
          </div>
        </div>
    </#if>
  </#if>
<#elseif model.hasSearchableFilter()>
  <#if model.getGridFilterSearchable()=="generalSearch">
    <div role="search" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing" class="">
      <div class="form-group">
        <label for="textinput-filter" class="">{{"template.crud.search" | translate}}</label>
        <input type="text" ng-model="vars.search" id="textinput-filter" class="form-control k-textbox" value="" placeholder="{{'template.crud.search' | translate}}">
      </div>
    </div>
  <#else>
    <div role="search" class="row" ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing">
        <#list model.formFields as field>
            <#if field.isSearchable()>
              <#if (field.isDate() || field.isTime() || field.isTimestamp()) >
                    <div class="">
                      <div class="component-holder ng-binding ng-scope" data-component="crn-datepicker" id="crn-datepicker-${model.random}">
                        <div class="form-group">
                          <div style="position:relative">
                            <input type="text" as-date="" class="form-control k-textbox" id="datepicker-filter-${field.name}"
                                        <#if field.isDate() >
                                           format="DD/MM/YYYY"
                                        <#elseif field.isTime()>
                                           format="HH:mm:ss"
                                        <#elseif field.isTimestamp()>
                                           format="DD/MM/YYYY HH:mm:ss"
                                        </#if>
                                   ng-model="vars.search${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                          </div>
                        </div>
                      </div>
                    </div>
              <#elseif (field.isNumber() || field.isDecimal()) >
                    <div class="">
                      <div class="form-group">
                        <label for="textinput-filter-${field.name}" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                        <input type="number" id="textinput-filter-${field.name}" class="form-control k-textbox" <#if field.isDecimal()>step="0.01"</#if> ng-model="vars.search${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                      </div>
                    </div>
              <#elseif field.isBoolean() >
                    <div class="">
                      <div class="form-group">
                        <input type="checkbox" id="checkbox-filter-${field.name}" ng-model="vars.search${field.name}" class="k-checkbox" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
                        <label for="checkbox-filter-${field.name}" class="k-checkbox-label">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                      </div>
                    </div>
              <#else>
                    <div class="">
                      <div class="form-group">
                        <label for="textinput-filter" class="">{{"template.crud.search" | translate}} ${model.formMapLabels[field.name]!}</label>
                        <input type="text" id="textinput-filter-${field.name}" class="form-control k-textbox" <#if field.getLength()??>maxlength="${field.getLength()}"</#if> ng-model="vars.search${field.name}" class="form-control" value="" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if>>
                      </div>
                    </div>
              </#if>
            </#if>
        </#list>
    </div>
  </#if>
</#if>

<section ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting" class="component-holder ng-binding ng-scope" data-component="crn-cron-grid" id="cron-crn-grid-search">
  <cron-grid
      options="${model.getGridOptionsView(model.dataSourceName, model.dataSourceName, field)}"
      ng-model="vars.grid${model.random}"
      class=""
      style="">
  </cron-grid>
</section>

