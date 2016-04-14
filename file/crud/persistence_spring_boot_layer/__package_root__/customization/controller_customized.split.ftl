<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.customization;

import ${package_root}.entity.*;
import ${package_root}.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<#assign clazz_name = "${clazz.name}ControllerCustomized"?cap_first>
<#assign clazz_service_name = "${clazz.name}Service"?cap_first>
<#assign clazz_entity_name = clazz.name?cap_first>

/**
 *
 * @author Techne
 * 
 * Customized Controller Class
 */
public class ${clazz_name} {

    @Autowired
    protected ${clazz_service_name} service;

    @RequestMapping(value = "/listar", method = RequestMethod.GET)
    public Iterable<${clazz_entity_name}> listar() throws Exception {
        return service.listarTodas();
    }

}
EOF<${clazz_name}.java
</#list>
