<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.controller;

import ${package_root}.entity.*;
import ${package_root}.customization.*;
import org.springframework.data.domain.*;
import org.springframework.validation.annotation.*;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;



<#assign request_mapping = clazz.name?lower_case>
<#assign clazz_name = "${clazz.name}Controller"?cap_first>
<#assign clazz_name_extends = "${clazz_name}Customized">
<#assign clazz_name_entity = clazz.name>

@RestController
@RequestMapping("${request_mapping}")
public class ${clazz_name} extends ${clazz_name_extends} {

    // create
    @RequestMapping(method = RequestMethod.POST)
    public ${clazz_name_entity} post(@Validated @RequestBody final ${clazz_name_entity} entity) throws Exception {
        service.save(entity);
        return entity;
    }
    // create

    // read
    @RequestMapping(method = RequestMethod.GET)
    public List< ${clazz_name_entity}> get(@QueryParam("limit") Integer limit, @QueryParam("offset") Integer offset) throws Exception {
        if (limit == null) {
            limit = 100;
        }
        if (offset == null) {
            offset = 0;
        }
        Page<${clazz_name_entity}> pages = service.listarWithPagination(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ${clazz_name_entity} get(@PathVariable("id") final String id) throws Exception {
        return service.findOne(id);
    }
    // read

    // update
    @RequestMapping(method = RequestMethod.PUT)
    public ${clazz_name_entity} put(@Validated @RequestBody final ${clazz_name_entity} entity) throws Exception {
        return service.update(entity);
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public ${clazz_name_entity} put(@PathVariable("id") final String id, @Validated @RequestBody final ${clazz_name_entity} entity) throws Exception {
        return service.update(entity);
    }

    // update
    // delete
    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final ${clazz_name_entity} entity) throws Exception {
        service.delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
        service.delete(id);
    }
    // delete
}
EOF<${clazz_name}.java
</#list>
