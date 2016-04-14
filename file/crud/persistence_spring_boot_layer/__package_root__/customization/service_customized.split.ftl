<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.customization;

import ${package_root}.entity.*;
import ${package_root}.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

<#assign clazz_name = "${clazz.name}ServiceCustomized"?cap_first>
<#assign clazz_repository_name = "${clazz.name}Repository"?cap_first>
<#assign clazz_entity_name = clazz.name?cap_first>

/**
 *
 * @author Techne
 * 
 * Repository Customized Class.
 */
public class ${clazz_name} {
	@Autowired
	protected ${clazz_repository_name} repository;
    
    	@Transactional
	public Iterable<${clazz_entity_name}> listarTodas() throws Exception {
		return repository.findAll();
	}
}
EOF<${clazz_name}.java
</#list>
