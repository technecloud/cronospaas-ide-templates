    ${class_entity_name} result = null;
    <#list clazz.fields as field>
    <#if field.isCloudStorage()>
    byte[] ${field.name} = entity.get${field.name?cap_first}();
    </#if>
    </#list>
    try {
      <#if clazz.getCloudStorage().isClearDatabaseRecord()>
      <#list clazz.fields as field>
      <#if field.isCloudStorage()>
      entity.set${field.name?cap_first}(null);
      </#if>
      </#list>
      </#if>
      result = repository.saveAndFlush(entity);
      <#list clazz.fields as field>
      <#if field.isCloudStorage()>
      result.set${field.name?cap_first}(${field.name});
      </#if>
      </#list>
      this.cloudManager.byEntity(result).build().dropbox(DROPBOX_APP_ACCESS_TOKEN).upload();
    } catch (Exception e) {
      log.error(e.getMessage());
    }
