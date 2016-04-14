<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.test;

/**
 * Classe utilitária de teste ${clazz.name}
 * @generated
 **/
public class ${clazz.name}Test {
	
}
EOF<${clazz.name}Test.java
</#list>
