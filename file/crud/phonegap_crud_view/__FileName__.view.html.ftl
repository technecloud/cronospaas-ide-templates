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
    </#if>
    <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle" data-component="crn-datasource" id="crn-datasource-906854"> 
      <datasource <#if model.hasColumnFilter()>filter="{{query == '' || query == null ? null : ('/${model.gridFilter}/' + query)}}"</#if> name="${model.dataSourceName}" entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="100" delete-message="Deseja remover?" class=""></datasource> 
    </div>
    <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
      <ion-list can-swipe="listCanSwipe">
        <ion-item ng-repeat="rowData in datasource.data" class="item" ng-click="datasource.startEditing(rowData)">
          <div class="row">
            <#list model.gridFields as field>
            <div class="col">
              <#if field.getProperty("firstStringField")?? >
              {{rowData.${field.getProperty("firstStringField")}}}
              <#else>
              <#if field.isDate() >
              {{rowData.${field.name} | date:'dd/MM/yyyy'}}
              <#elseif field.isTime() >
              {{rowData.${field.name} | date:'HH:mm:ss'}}
              <#elseif field.isTimestamp() >
              {{rowData.${field.name} | date:'dd/MM/yyyy HH:mm:ss'}}
              <#elseif field.isByteImage()>
              <img ng-if="rowData.${field.name}" data-ng-src="{{'data:image/png;base64,' + rowData.${field.name}}}" style="max-height: 30px;">
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
        <fieldset ng-disabled="!datasource.editing &amp;&amp; !datasource.inserting">
          <div class="list">
            <#list model.formFields as field>
            <!-- ${field.name} begin -->
            <#if field.isBoolean() >
            <div class="item item-toggle">
              <#if field.label?has_content>${field.label}<#else>${field.name}</#if>
              <label for="textinput-${field.name}" class="toggle toggle-assertive">
                <input type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if !field.isNullable()>required="required"</#if>>
                <div class="track">
                  <div class="handle"></div>
                </div>
              </label>
            </div>
            <#elseif (field.isDate()) >
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
            <span class="input-label">${model.formMapLabels[field.name]!}</span> 
            <input type="date" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>> 
            </label> 
            <#elseif (field.isTime() || field.isTimestamp()) >
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
            <span class="input-label">${model.formMapLabels[field.name]!}</span> 
            <input type="time" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" ng-model="${model.dataSourceName}.active.${field.name}" id="textinput-${field.name}" name="textinput-${field.name}" <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"</#if> <#if !field.isNullable()>required="required"</#if>> 
            </label> 
            <#elseif field.isNumber() >
            <label for="textinput-${field.name}" class="item item-input item-stacked-label">
            <span class="input-label">${model.formMapLabels[field.name]!}</span> 
            <input type="number" ng-model="${model.dataSourceName}.active.${field.name}" class="" id="textinput-${field.name}" name="textinput-${field.name}" placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" <#if !field.isNullable()>required="required"</#if>> 
            </label>
            <#elseif field.getProperty("ngOptions")?? >		
            <datasource name="${field.getProperty("ngOptions").dataSourceName}" entity="${field.getProperty("ngOptions").dataSourceUrl}" keys="${field.getProperty("ngOptions").keys}" class=""></datasource> 
            <label for="textinput-${field.name}" class="item item-input item-select">
              <span class="input-label">${model.formMapLabels[field.name]!}</span> 
              <select ng-model="${model.dataSourceName}.active.${field.name}" class="form-control" id="textinput-${field.name}" name="textinput-${field.name}" ng-options="${field.getProperty("ngOptions").options}" <#if !field.isNullable()>required="required"</#if>>
              <option value=''>None</option>
              </select>
            </label>
            <#elseif field.isByteImage()>
            <div class="item item-input-inset">
              <div class="row">
                <div class="col">
                  <img data-ng-src="{{'data:image/png;base64,' + datasource.active.${field.name}}}" style="max-height: 100px;" ng-if="datasource.active.${field.name}">       
                </div>
                <div class="col">
                  <button type="button" ngf-select class="button button-positive icon ion-upload" ngf-change="datasource.setImage($file, datasource.active, '${field.name}')" accept="image/*"></button>         
                  <div ng-if="datasource.active.${field.name}">
                    <br/>
                    <button type="button" class="button button-clear icon ion-close-round" ng-click="datasource.active.${field.name}=null"></button>
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
              id="textinput-${field.name}" name="textinput-${field.name}" 
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
          </div>
        </fieldset>
      </form>
    </div>
  </ion-content>
</ion-view>