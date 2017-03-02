<#assign databaseName = "h2">
<#if database??>
  <#assign databaseConfig = database?split("|")>
  <#assign databaseName = database[3]> 
</#if>
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.context.web.*;
import org.springframework.context.annotation.*;
<#if databaseName?lower_case!="h2">
import org.springframework.boot.autoconfigure.jdbc.*;
</#if>
/**
 * Classe responsável iniciar a aplicação, por padrão ela executará as seguintes etapas:
 *  - Criar uma instância do ApplicationContext;
 *  - Registrar um CommandLinePropertySource para expor argumentos como propriedades do Spring;
 *  - Atualizar o contexto de aplicação para carregar os singletons;
 *  - Executar qualquer bean do tipo CommandLineRunner;
 */
@ComponentScan(basePackages = {
  "auth.permission", "api.rest.events", "api.rest.webservices", "app", "reports"
})
@SpringBootApplication
<#if databaseName?lower_case!="h2">
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
</#if>
public class SpringBootMain extends SpringBootServletInitializer {
  
    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}
