<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.service;

import ${package_root}.entity.*;
import ${package_customized}.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

<#assign clazz_name = "${clazz.name}Service"?cap_first>
<#assign clazz_service_customized_name = "${clazz.name}ServiceCustomized"?cap_first>
<#assign clazz_entity_name = clazz.name?cap_first>

/**
 * 
 * @author Techne
 * 
 * Service
 */
@Service
public class ${clazz_name} extends ${clazz_service_customized_name} {


    @Transactional
    public void save(${clazz_entity_name} entity) throws Exception {
        repository.save(entity);
    }

    @Transactional
    public ${clazz_entity_name} findOne(String id) throws Exception {
        return repository.findOne(id);
    }

    @Transactional
    public Page<${clazz_entity_name}> listarWithPagination(Pageable page) throws Exception {
        return repository.findAll(page);
    }

    @Transactional
    public ${clazz_entity_name} update(${clazz_entity_name} entity) throws Exception {
        return repository.saveAndFlush(entity);
    }

    @Transactional
    public void delete(${clazz_entity_name} entity) throws Exception {
        repository.delete(entity);
    }

    @Transactional
    public void delete(String id) throws Exception {
        ${clazz_entity_name} entity = repository.findOne(id);
        repository.delete(entity);
    }

}
EOF<${clazz_name}.java
</#list>
