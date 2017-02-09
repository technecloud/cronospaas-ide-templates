    ${class_entity_name} updatedEntity = null;
    <#list clazz.fields as field>
    <#if field.isDropbox()>
    byte[] ${field.name} = entity.get${field.name?cap_first}();
    </#if>
    </#list>
    <#if clazz.getCloudStorage().isClearDatabaseRecord()>
    <#list clazz.fields as field>
    <#if field.isDropbox()>
    entity.set${field.name?cap_first}(null);
    </#if>
    </#list>
    </#if>
    updatedEntity = dao.update(entity);
    <#list clazz.fields as field>
    <#if field.isDropbox()>
    updatedEntity.set${field.name?cap_first}(${field.name});
    </#if>
    </#list>
    this.cloudManager.byEntity(updatedEntity).build().dropbox(DROPBOX_APP_ACCESS_TOKEN).upload();
