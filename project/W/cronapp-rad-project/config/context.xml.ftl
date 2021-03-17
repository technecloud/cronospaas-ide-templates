<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<Context>
  <#if database??>
    <#assign databaseConfig = database?split("|")>
    <Resource accessToUnderlyingConnectionAllowed="true" 
        type="javax.sql.DataSource"
        driverClassName="${databaseConfig[5]}"
        name="jdbc/main" 
        username="${databaseConfig[1]}"
        password="${databaseConfig[2]}" 
        removeAbandoned="false" 
        removeAbandonedTimeout="60" 
        logAbandoned="true" 
        url="${databaseConfig[4]}" />
  <#else>
    <Resource accessToUnderlyingConnectionAllowed="true" 
        type="javax.sql.DataSource"
        driverClassName="org.h2.Driver"
        name="jdbc/main" 
        username="root"
        password="root" 
        removeAbandoned="false" 
        removeAbandonedTimeout="60" 
        logAbandoned="true" 
        url="jdbc:h2:file:~/${workCopyInfo.rootPath[workCopyInfo.rootPath?replace("/", "\\")?last_index_of("\\")+1..]};ALIAS_COLUMN_NAME=true;AUTO_SERVER=TRUE" />
  </#if>
</Context>