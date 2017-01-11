<#if PackageName?has_content && (PackageName?length > 0) >
package ${PackageName};
</#if>		

import org.junit.*;
import static org.junit.Assert.*;


/**
 * Classe de Teste que representa ...
 * 
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
 *
 */
 
public class ${ClassName} {

  /**
   * Preparação antes dos testes
   */
  @Before
  public void setUp() {
     // TODO
  }


  @Test
  public void sumTest() {
    assertEquals(2, 1+1);
  }

  /**
   * Limpeza após os testes
   */
  @After
  public void tearDown() {
     // TODO
  }

}
