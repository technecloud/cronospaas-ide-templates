package ${restPackage};

import org.apache.commons.httpclient.protocol.Protocol;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

<#assign class_name = "${className}">
/**
 * Controller para expor serviços REST de ${webserviceStub}
 * 
 * @generated
 **/
@RestController
@RequestMapping(value = "${restPath}/${className?replace("REST", "")}")
public class ${className} {

<#list baseInfo.methods as method>
  @RequestMapping(method = RequestMethod.GET, value = "/${method.methodName}")   
  public ${method.returnType} ${method.methodName} (
    <#list baseInfo.getTopParams(method.methodName) as parameter>
      <#if parameter.type == "java.util.Date">
    @RequestParam(value="${parameter.name}", required=false) java.lang.String ${parameter.name},
      <#else>
    @RequestParam(value="${parameter.name}", required=false) ${parameter.type} ${parameter.name},
      </#if>
    </#list>
    @RequestParam(value="page", required=false) String page,
    @RequestParam(value="size", required=false) String size
    ) throws Exception {
    
    ${method.returnType} respn = null;
    
    try {
      ${baseInfo.stubClass} stub = new ${baseInfo.stubClass}();
  
<#list baseInfo.getAllObjectsToInstance(method) as param>
    <#if param.hasArgumentsInConstructor>
      //Constructor has arguments - requires manual implementation
      //${param.type} ${param.name};
    <#elseif param.type?contains("[]") || param.type?contains("[][]")>
      ${param.type} ${param.name} = null; //Array requires manual implementation
    <#else>
      ${param.type} ${param.name} = new ${param.type}();
    </#if>
</#list>  
<#list baseInfo.getAllObjectsToInstance(method) as param>
    <#if param.methods??>
      <#list param.methods as methodFromObjParam>
        <#if baseInfo.checkHasArgumentsConstructorParameterFromMethod(methodFromObjParam)>
      //${param.name}.${methodFromObjParam.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(methodFromObjParam) as instanceName>${instanceName}<#if instanceName_has_next>, </#if></#list>);
        <#elseif baseInfo.checkHasDateParameterFromMethod(methodFromObjParam)>
          <#list baseInfo.getInstanceNameParameterFromMethod(methodFromObjParam) as instanceName>
      java.util.Date ${instanceName}Aux = null;
      if (${instanceName} != null && ${instanceName}.length() > 0 ) {
        try {
          java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
          ${instanceName}Aux = formatter.parse(${instanceName});
        } catch (Exception e) {
            e.printStackTrace();
        }
      }
          </#list>
      ${param.name}.${methodFromObjParam.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(methodFromObjParam) as instanceName>${instanceName}Aux<#if instanceName_has_next>, </#if></#list>);
        <#else>
      ${param.name}.${methodFromObjParam.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(methodFromObjParam) as instanceName>${instanceName}<#if instanceName_has_next>, </#if></#list>);
        </#if>
      </#list>     
    </#if>
</#list> 
    
      org.apache.commons.httpclient.protocol.Protocol.unregisterProtocol("https");
      org.apache.commons.httpclient.protocol.Protocol.registerProtocol("https",  new Protocol("https", new org.apache.commons.httpclient.contrib.ssl.EasySSLProtocolSocketFactory(), 443));
      respn = stub.${method.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(method) as instanceName>${instanceName}<#if instanceName_has_next>, </#if></#list>);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
    return respn;
  }
  
</#list>
}