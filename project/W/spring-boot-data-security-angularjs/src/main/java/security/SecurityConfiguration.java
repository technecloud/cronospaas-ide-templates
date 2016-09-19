package security;

import org.springframework.orm.jpa.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;
import org.springframework.transaction.*;
import org.springframework.transaction.annotation.*;
import org.springframework.core.io.*;
import org.springframework.data.repository.init.*;
import java.net.URL;
import java.io.File;
import java.util.Scanner;


import java.util.regex.Pattern;
import auth.permission.SecurityPermission;


/**
 * Classe que configura os beans para persistencia
 * 
 * @author Usuário de Teste
 *
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "security-EntityManagerFactory",
        transactionManagerRef = "security-TransactionManager"
)
class SecurityConfiguration {
  
    @Primary

    @Bean(name="security-EntityManagerFactory")
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
        factoryBean.setPersistenceUnitName("security");
        return factoryBean;
    }

    @Bean(name = "security-TransactionManager")
    public PlatformTransactionManager transactionManager() {
        return new JpaTransactionManager(entityManagerFactory().getObject());
    }

  
    @Bean
    public Jackson2RepositoryPopulatorFactoryBean repositoryPopulator() {
  
    //Criando dinamicamente os dados do Security

    Jackson2RepositoryPopulatorFactoryBean factory = new Jackson2RepositoryPopulatorFactoryBean();
    URL url = this.getClass().getClassLoader().getResource("security//populate.json");

    String strJSON = "[]";
    if (url != null) {
      File file = new File(url.getFile());

      try {
        Scanner scanner = new Scanner(file);
        strJSON = scanner.useDelimiter("\\A").next();
        scanner.close();
      
        strJSON = strJSON.replaceAll(Pattern.quote("{{ROLE_ADMIN_NAME}}"), SecurityPermission.ROLE_ADMIN_NAME);
        strJSON = strJSON.replaceAll(Pattern.quote("{{ROLE_LOGGED_NAME}}"), SecurityPermission.ROLE_LOGGED_NAME);
      } catch (Exception e) {
      }
    }
    
    Resource sourceData = new InputStreamResource(new java.io.ByteArrayInputStream(strJSON.getBytes()));
    factory.setResources(new Resource[] { sourceData });

    return factory;
  
    }
  
    
}