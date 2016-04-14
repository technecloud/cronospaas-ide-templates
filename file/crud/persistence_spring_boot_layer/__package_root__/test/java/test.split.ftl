<#list workspaceView.getActiveEditor().getDiagram().getEntityCells() as diagramCell>
<#assign clazz = diagramCell.getClazz()>
package ${package_root}.test.java;

import ${package_root}.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


<#assign clazz_name = "${clazz.name}Test"?cap_first>
<#assign clazz_app_name = "Application">

/**
 * 
 * @author Techne
 *
 * JUnit Test
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = ${clazz_app_name}.class)
public class ${clazz_name} {

	@Test
	public void contextLoads() {
	}

}
EOF<${clazz_name}.java
</#list>
