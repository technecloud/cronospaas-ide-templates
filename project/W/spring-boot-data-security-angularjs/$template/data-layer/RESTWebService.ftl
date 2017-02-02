package ${restPackage};

import java.io.StringWriter;

import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamWriter;

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
  public String ${method.methodName} (
    <#list baseInfo.getTopParams(method.methodName) as parameter>
    @RequestParam(value="${parameter.name}", required=false) ${parameter.type} ${parameter.name},
    </#list>
    @RequestParam(value="page", required=false) String page,
    @RequestParam(value="size", required=false) String size
    ) throws Exception {
    
    
    ${baseInfo.stubClass} stub = new ${baseInfo.stubClass}();
    
<#list method.parameters as param>
  <#if param.isObject>
    ${param.type} ${param.name} = new ${param.type}();
    <#list param.methods as methodFromObjParam>
    ${param.name}.${methodFromObjParam.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(methodFromObjParam) as instanceName>${instanceName}<#if instanceName_has_next>, </#if></#list>);
    </#list>      
  </#if>
</#list>
    
    ${method.returnType} respn = stub.${method.methodName}(<#list baseInfo.getInstanceNameParameterFromMethod(method) as instanceName>${instanceName}<#if instanceName_has_next>, </#if></#list>);
    /*org.tempuri.CalcPrecoPrazoWSStub.CalcPrazo calcPrazo = new org.tempuri.CalcPrecoPrazoWSStub.CalcPrazo();
    
    if (param0!=null && !param0.isEmpty())
      calcPrazo.setSCepOrigem(param0);
    
    org.tempuri.CalcPrecoPrazoWSStub.CalcPrazoResponse resp = stub.calcPrazo(calcPrazo);
    
    XMLOutputFactory xmlof = XMLOutputFactory.newInstance();
    StringWriter stringOut = new StringWriter();
    XMLStreamWriter xmlw = xmlof.createXMLStreamWriter(stringOut);
    resp.serialize(resp.MY_QNAME, xmlw);
    stringOut.toString();*/
    
    String result = "{\"content\": %s, \"page\":{\"size\":%s,\"totalElements\":%s,\"totalPages\":1,\"number\":%s},\"links\":[{\"rel\": \"self\", \"href\": \"/api/rest/LyceumListarDocentes\"}]  }";
    return  result; 
  }
</#list>
}