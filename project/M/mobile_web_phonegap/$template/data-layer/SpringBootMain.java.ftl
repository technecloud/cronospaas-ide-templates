import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.context.web.*;
import org.springframework.context.annotation.*;

/**
 * Classe responsável iniciar a aplicação, por padrão ela executará as seguintes etapas:
 *  - Criar uma instância do ApplicationContext
 *  - Registrar um CommandLinePropertySource para expor argumentos como propriedades do Spring
 *  - Atualizar o contexto de aplicação para carregar os singletons
 *  - Executar qualquer bean do tipo CommandLineRunner 
 * 
 * @author ${UserName}
 *
 */
@ComponentScan(basePackages = {
<#list workspaceView.allDiagrams as diagram>
${diagram.getGlobalAttribute("namespace")} <#if diagram_has_next>,</#if> 
</#list>
, "auth.permission", "api.events"
})
@SpringBootApplication
public class SpringBootMain extends SpringBootServletInitializer {
  
    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}


