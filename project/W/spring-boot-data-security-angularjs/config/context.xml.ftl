<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<Context>
    <Resource accessToUnderlyingConnectionAllowed="true" 
        type="javax.sql.DataSource"
        driverClassName="org.h2.Driver"
        name="jdbc/main" 
        username="root"
        password="root" 
        removeAbandoned="false" 
        removeAbandonedTimeout="60" 
        logAbandoned="true" 
        url="jdbc:h2:file:~/${workCopyInfo.rootPath[workCopyInfo.rootPath?replace("/", "\\")?last_index_of("\\")+1..]};DATABASE_TO_UPPER=false;ALIAS_COLUMN_NAME=true;AUTO_SERVER=TRUE" />
</Context>
