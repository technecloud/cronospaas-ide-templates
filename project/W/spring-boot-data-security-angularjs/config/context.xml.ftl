<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<Context>
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
</Context>