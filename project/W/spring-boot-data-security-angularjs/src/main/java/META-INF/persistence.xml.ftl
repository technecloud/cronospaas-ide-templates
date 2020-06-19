<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<persistence version="2.0" xmlns="http://java.sun.com/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
    <persistence-unit name="app" transaction-type="RESOURCE_LOCAL">
        <provider>org.eclipse.persistence.jpa.PersistenceProvider</provider>
        <jta-data-source>java:comp/env/jdbc/main</jta-data-source>
        <class>app.entity.UserRole</class>
        <class>app.entity.User</class>
        <class>app.entity.Role</class>
    <#if multitenant?? && (multitenant?lower_case == "sim" || multitenant?lower_case == "yes")>
        <class>app.entity.Company</class>
        <class>app.entity.Department</class>
    </#if>
    <#if database??>
      <#assign databaseConfig = database?split("|")>
        <properties>
            <property name="javax.persistence.jdbc.driver" value="${databaseConfig[5]}"/>
            <property name="javax.persistence.jdbc.url" value="${databaseConfig[4]}"/>
            <property name="javax.persistence.jdbc.user" value="${databaseConfig[1]}"/>
            <property name="javax.persistence.jdbc.password" value="${databaseConfig[2]}"/>
            <property name="eclipselink.ddl-generation" value="create-or-extend-tables"/>
        </properties>
    <#else>
        <properties>
            <property name="javax.persistence.jdbc.driver" value="org.h2.Driver"/>
            <property name="javax.persistence.jdbc.url" value="jdbc:h2:file:~/${workCopyInfo.rootPath[workCopyInfo.rootPath?replace("/", "\\")?last_index_of("\\")+1..]};DATABASE_TO_UPPER=false;ALIAS_COLUMN_NAME=true;AUTO_SERVER=TRUE"/>
            <property name="javax.persistence.jdbc.user" value="root"/>
            <property name="javax.persistence.jdbc.password" value="root"/>
            <property name="eclipselink.ddl-generation" value="create-or-extend-tables"/>
        </properties>
    </#if>
    </persistence-unit>
</persistence>
