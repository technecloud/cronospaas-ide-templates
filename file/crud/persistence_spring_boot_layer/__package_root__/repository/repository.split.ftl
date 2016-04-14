<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.repository;

import ${package_root}.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

<#assign clazz_name = "${clazz.name}Repository"?cap_first>
<#assign clazz_entity_name = clazz.name?cap_first>

/**
 * 
 * @author Techne
 * 
 * Repository
 */
@Repository
public interface ${clazz_name} extends JpaRepository<${clazz_entity_name}, String> {

//	Cidade findByIdeCidade(Integer ideCidade);
	
//	List<Cidade> findByIdeEstado(Estado estado);

}
EOF<${clazz_name}.java
</#list>
