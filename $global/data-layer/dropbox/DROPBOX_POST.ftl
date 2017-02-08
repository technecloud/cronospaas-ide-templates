    <#list clazz.fields as field>
    <#if field.isCloudStorage()>
    byte[] ${field.name} = entity.get${field.name?cap_first}();
    </#if>
    </#list>
    <#if clazz.getCloudStorage().isClearDatabaseRecord()>
    <#list clazz.fields as field>
    <#if field.isCloudStorage()>
    entity.set${field.name?cap_first}(null);
    </#if>
    </#list>
    </#if>
    dao.save(entity);
    <#list clazz.fields as field>
    <#if field.isCloudStorage()>
    entity.set${field.name?cap_first}(${field.name});
    </#if>
    </#list>
    this.cloudManager.byEntity(entity).build().dropbox(DROPBOX_APP_ACCESS_TOKEN).upload();
