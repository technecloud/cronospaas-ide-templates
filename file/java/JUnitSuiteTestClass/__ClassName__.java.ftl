<#if PackageName?has_content && (PackageName?length > 0) >
package ${PackageName};
</#if>		

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

/**
 * Classe de Teste que representa um aglomerado de testes unitários.
 * 
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
 *
 */
 
@RunWith(Suite.class)
@SuiteClasses({ 
/*
 * Test1.class, Test2.class, ...
 */
})
public class  ${ClassName} {
}

