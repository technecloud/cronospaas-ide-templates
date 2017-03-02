<h2>Webservice ${className?replace("REST", "")}</h2>
<#assign index = 0>
<#list baseInfo.methods as method>
<h3>Method: ${method.methodName}</h3>
<div class="component-holder ng-binding ng-scope" data-component="crn-accordion" id="crn-accordion-${method.methodName}"> 
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"> 
    <div class="panel panel-default"> 
      <div class="panel-heading" role="tab" id="heading${method.methodName}"> 
        <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${method.methodName}" aria-expanded="true" aria-controls="collapse${method.methodName}" target="self"> {{"template.crud.search" | translate}} </a> </h4> 
      </div>
      <div class="panel-collapse content" role="tabpanel"> 
        <div id="collapse${method.methodName}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${method.methodName}"> 
          <div class="panel-body">
  <#assign indexAux = index>
  <#list baseInfo.getTopParams(method.methodName) as parameter>
            <div class="component-holder ng-binding ng-scope" data-component="crn-textinput" id="crn-textinput-${parameter.name}"> 
              <div class="form-group"> 
                <label for="input-${parameter.name}">${parameter.name}</label> 
                <input
      <#if parameter.type == "java.lang.Double" || parameter.type == "java.lang.Float" || parameter.type == "java.lang.Integer" || parameter.type == "java.lang.Long" || parameter.type == "java.lang.Short"  || parameter.type == "java.math.BigDecimal" || parameter.type == "java.math.BigInteger">
                  type="number"
      <#elseif parameter.type == "java.lang.Boolean">
                  type="checkbox"
      <#elseif parameter.type == "java.util.Date">
                  as-date="" type="text" format="DD/MM/YYYY"
      <#else>
                  type="text"
      </#if>
                  ng-model="${parameter.name}${indexAux?string.number}" class="form-control" value="" placeholder="${parameter.name}" > 
              </div> 
            </div> 
    <#assign indexAux += 1>
  </#list>
            <div class="component-holder ng-binding ng-scope" data-component="crn-button" id="crn-button-${method.methodName}"> 
              <button class="btn btn-primary" type="submit" ng-click="${className}${method.methodName}.enabled=true;${className}${method.methodName}.fetch();">{{ "template.crud.search" | translate}}</button> 
            </div>
            <div data-component="crn-datasource" id="crn-datasource-${method.methodName}" class="component-holder">
  <#assign indexAux = index>
  <#assign filterSearch="">
  <#list baseInfo.getTopParams(method.methodName) as parameter>
    <#assign parameter_angular_date = "">
    <#if parameter.type == "java.util.Date" >
      <#assign parameter_angular_date = "| date:'dd/MM/yyyy'">
    </#if>
    <#assign filterSearch += "${parameter.name}={{${parameter.name}${indexAux}${parameter_angular_date}}}">
    <#if parameter_has_next>
      <#assign filterSearch +="&">
    </#if>
    <#assign indexAux += 1>
  </#list>
              <datasource filter="?${filterSearch}" name="${className}${method.methodName}" entity="api/rest/webservices/${className?replace("REST", "")}/${method.methodName}" keys="id" rows-per-page="100" delete-message="Deseja remover?" class="" enabled="false"></datasource>
            </div>
            <div>
<#assign index = indexAux + 1>
            Resultado:
            {{${className}${method.methodName}.data}}
            </div>
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
</#list>