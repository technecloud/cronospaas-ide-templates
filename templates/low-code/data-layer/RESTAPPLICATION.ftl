package ${packageRoot};

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

<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
<#assign persistence_unit_name_formatted = persistence_unit_name?replace('.',' ')?capitalize?replace(' ','')>
<#assign persistence_unit_name_path = persistence_unit_name?replace('.','//')>
<#assign clazz_name = persistence_unit_name_formatted + "Configuration">
<#assign entityManagerFactoryRef = persistence_unit_name + "-EntityManagerFactory">
<#assign transactionManagerRef = persistence_unit_name + "-TransactionManager">
<#assign first_pu = workspaceView.primaryDiagram>
/**
 * Classe que configura os beans para persistencia
 * @generated
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "${entityManagerFactoryRef}",
        transactionManagerRef = "${transactionManagerRef}"
)
class ${configurationName} {

    <#if persistence_unit_name == first_pu || first_pu == "">
    @Primary
    </#if>

    @Bean(name="${entityManagerFactoryRef}")
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
        factoryBean.setPersistenceUnitName("${persistence_unit_name}");
        return factoryBean;
    }

    @Bean(name = "${transactionManagerRef}")
    public PlatformTransactionManager transactionManager() {
        return new JpaTransactionManager(entityManagerFactory().getObject());
    }

    <#if persistence_unit_name == first_pu || first_pu == "">  
    @Bean
    public Jackson2RepositoryPopulatorFactoryBean repositoryPopulator() {
  
    //Criando dinamicamente os dados do ${persistence_unit_name_formatted}

    Jackson2RepositoryPopulatorFactoryBean factory = new Jackson2RepositoryPopulatorFactoryBean();
    URL url = this.getClass().getClassLoader().getResource("${persistence_unit_name_path}//populate.json");

    String strJSON = "[]";
    if (url != null) {
      File file = new File(url.getFile());

      try {
        Scanner scanner = new Scanner(file);
        strJSON = scanner.useDelimiter("\\A").next();
        scanner.close();
        // Caso queira sobrescrever dados do populate
        strJSON = strJSON.replaceAll(Pattern.quote("{{ROLE_ADMIN_NAME}}"), "Administrators");
      } catch (Exception e) {
      }
    }
    
    Resource sourceData = new InputStreamResource(new java.io.ByteArrayInputStream(strJSON.getBytes()));
    factory.setResources(new Resource[] { sourceData });

    return factory;
  
    }
    </#if>
}