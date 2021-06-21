package ${restPackage};
<#if hasAuth>
import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axiom.soap.SOAPFactory;
import org.apache.axis2.client.ServiceClient;
</#if>
import org.apache.commons.httpclient.protocol.Protocol;
import cronapi.*;
import cronapi.CronapiMetaData.*;

<#assign class_name = "${className}">
/**
* Controller para expor serviços de ${webserviceStub}
*
* @generated
**/
@CronapiMetaData(categoryName = "${className?replace("REST", "")?replace("API", "")}")
public class ${className} {

<#list baseInfo.methods as method>
@CronapiMetaData(type = "function", returnType = ObjectType.OBJECT)
public static Var ${method.methodName} (
    <#list baseInfo.getTopParams(method.methodName) as parameter>
    @ParamMetaData(type = ObjectType.${baseInfo.getCronapiType(parameter.type)}) Var ${parameter.name}Var<#if parameter?has_next>,</#if>
    </#list>
) throws Exception {

    <#list baseInfo.getTopParams(method.methodName) as parameter>
    ${parameter.type} ${parameter.name} = ${parameter.name}Var.getTypedObject(${parameter.type}.class);
    </#list>

${method.returnType} respn = null;


${baseInfo.stubClass} stub = new ${baseInfo.stubClass}();

<#if hasAuth>
OMFactory fac = OMAbstractFactory.getOMFactory();
SOAPFactory factory = OMAbstractFactory.getSOAP11Factory();
OMNamespace nsWSSE = fac.createOMNamespace("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd", "wsse");

org.apache.axiom.soap.SOAPHeaderBlock header = factory.createSOAPHeaderBlock("Security", nsWSSE);
header.setMustUnderstand(true);

OMElement usernameToken = fac.createOMElement("UsernameToken", nsWSSE);

OMElement username = fac.createOMElement("Username", nsWSSE);
username.setText("${wssUser}");

usernameToken.addChild(username);

OMElement password = fac.createOMElement("Password", nsWSSE);
password.addAttribute("Type", "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText", null);
password.setText("${wssPwd}");
usernameToken.addChild(password);
header.addChild(usernameToken);
ServiceClient sender = stub._getServiceClient();
sender.addHeader(header);
</#if>
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

return Var.valueOf(respn);
}

</#list>
}