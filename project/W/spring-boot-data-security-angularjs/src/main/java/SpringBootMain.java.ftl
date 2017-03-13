import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.context.web.*;
import org.springframework.context.annotation.*;
import org.springframework.boot.autoconfigure.jdbc.*;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

/**
 * Classe responsável iniciar a aplicação, por padrão ela executará as seguintes etapas:
 *  - Criar uma instância do ApplicationContext;
 *  - Registrar um CommandLinePropertySource para expor argumentos como propriedades do Spring;
 *  - Atualizar o contexto de aplicação para carregar os singletons;
 *  - Executar qualquer bean do tipo CommandLineRunner;
 */
@ComponentScan(basePackages = {
  "auth.permission", "api.rest.events", "api.rest.webservices", "reports", "app"
})
@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class SpringBootMain extends SpringBootServletInitializer {
  
    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}