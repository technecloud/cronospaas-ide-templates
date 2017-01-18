<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<Context>
    <Realm appName="EmptyRealm" className="org.apache.catalina.realm.JAASRealm" 
    roleClassNames="techne.security.TechneRole" 
    useContextClassLoader="true" 
    userClassNames="techne.security.TechnePrincipal"/>

    <Resource driverClassName="org.h2.Driver" logAbandoned="true" name="jdbc/Cronos" 
    password="" 
    removeAbandoned="true" 
    removeAbandonedTimeout="60" 
    type="javax.sql.DataSource" 
    url="jdbc:h2:file:${workCopyInfo.rootPath}/db/cronos;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=false;ALIAS_COLUMN_NAME=true" 
    username="sa"/>
    
    <Resource driverClassName="org.h2.Driver" 
    logAbandoned="true" name="jdbc/aplicacao" password="" 
    removeAbandoned="true" 
    removeAbandonedTimeout="60" type="javax.sql.DataSource" 
    url="jdbc:h2:file:${workCopyInfo.rootPath}/db/aplicacao;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=false;ALIAS_COLUMN_NAME=true" 
    username="sa"/>

    <!-- debug options - DEVE SER REMOVIDO EM PRODUcãO -->
    <Parameter name="ignorePageCaching" value="true"/>
    <Parameter name="debugMode" value="true"/>
    <Parameter name="extRequestTimeout" value="300000"/>
    <Parameter name="maxCauses" value="10"/>
    <Parameter name="enableShowExceptions" value="true"/>

    <!-- debug options - DEVE SER REMOVIDO EM PRODUÃCAO -->
    <!-- websocket-->
    <Parameter name="webSocket" value="false"/>
    <Parameter name="applicationsPackages" value="techne.template"/>

    <Parameter name="wizardServicePackages" value="techne.appteste.obj.rn,custom.appteste.obj.rn"/>

    <Parameter name="securityConnectionClass" value="techne.security.EmptySecurityConnection"/>
    <Parameter name="resetPasswordUrl" value="/template/esquecisenha.html"/>
    <Parameter name="defaultApplication" value="template"/>
    <Parameter name="loginResourcesSubpath" value="rainyblue"/>
    <Parameter name="logoUrl" value="/image/rainyblue/techne.png"/>
    <!-- URL base para o help (Confluence) -->
    <Parameter name="helpUrl" value="http://localhost:8080"/>
    <!-- diretório temporário usado para upload de arquivos -->
    <!-- pode ser colocado um caminho absoluto para o diretório, em que deve haver permissao de escrita para o tomcat -->
    <!-- 	<Parameter name="tempDir" value="."/> -->
    <!-- Habilita mensagens na forma de alert() do JavaScript (default: false) -->
    <Parameter name="enableBrowserAlerts" value="true"/>
    <!-- informacÃµes para linkReport -->
    <Parameter name="oracle.reportServer" value="http://techne14.techne.com.br:7778/reports/"/>
    <Parameter name="oracle.reportUrl" value="http://techne14.techne.com.br:7778/reports/rwservlet"/>
    <Parameter name="oracle.reportUserId" value="hades/hades@t32pmsp"/>
    <Parameter name="oracle.reportEncoding" value="ISO-8859-1"/>
    <Parameter name="sqlserver.reportServer" value="http://vm-reportsrv/ReportServer"/>
    <Parameter name="sqlserver.reportUrl" value="http://vm-reportsrv/ReportServer/ReportExecution2005.asmx"/>
    <Parameter name="sqlserver.reportUserId" value="vm-reportsrv\wcronos"/>
    <Parameter name="sqlserver.reportPassword" value="bhimA123"/>
    <Parameter name="sqlserver.exceptionHandler" value="techne.report.exception.SQLServerDefaultReportExceptionHandler"/>
    <Parameter name="jasper.reportServer" value="http://FERNANDO7:8080/jasperserver/"/>
    <Parameter name="jasper.reportUrl" value="http://FERNANDO7:8080/jasperserver/services/repository"/>
    <Parameter name="jasper.reportUserId" value="jasperadmin/jasperadmin"/>
    <!--  Limita o número de registros retornados para a página (GridPanel e DataPanel) -->
    <Parameter name="queryLimit" value="100"/>
    <!-- Limita a quantidade de erros de ping permitidas. Quando 0 (o padrao) a verificacao de ping está desabilitada -->
    <Parameter name="pingErrorLimit" value="0"/>
</Context>
