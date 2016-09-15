package ${packageRoot};

import org.springframework.orm.jpa.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;
import org.springframework.transaction.*;
import org.springframework.transaction.annotation.*;

<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
<#assign persistence_unit_name_formatted = persistence_unit_name?replace('.',' ')?capitalize?replace(' ','')>
<#assign clazz_name = persistence_unit_name_formatted + "Configuration">
<#if persistence_unit_name_formatted == "Security" >
import org.springframework.core.io.*;
import org.springframework.data.repository.init.*;
import java.io.File;
import java.util.Scanner;
import java.util.regex.Pattern;
import auth.permission.SecurityPermission;
</#if>

<#assign entityManagerFactoryRef = persistence_unit_name + "-EntityManagerFactory">
<#assign transactionManagerRef = persistence_unit_name + "-TransactionManager">

<#assign first_pu = workspaceView.primaryDiagram>

/**
 * Classe que configura os beans para persistencia
 * 
 * @author ${UserName}
 *
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

  <#if persistence_unit_name_formatted == "Security" >
    @Bean
  	public Jackson2RepositoryPopulatorFactoryBean repositoryPopulator() {
  
  		//Criando dinamicamente os dados do Security
  
  		String strSecurity = "";
  		try {
  
  			Scanner scanner = new Scanner(
  					new File(getClass().getClassLoader().getResource("SecurityData.json").getFile()));
  			strSecurity = scanner.useDelimiter("\\A").next();
  			scanner.close();
  
  			strSecurity = strSecurity.replaceAll(Pattern.quote("{{ROLE_ADMIN_NAME}}"),
  					SecurityPermission.ROLE_ADMIN_NAME);
  			strSecurity = strSecurity.replaceAll(Pattern.quote("{{ROLE_LOGGED_NAME}}"),
  					SecurityPermission.ROLE_LOGGED_NAME);
  
  		} catch (Exception e) {
  		}
  
  		Resource sourceData = new InputStreamResource(new java.io.ByteArrayInputStream(strSecurity.getBytes()));
  
  		Jackson2RepositoryPopulatorFactoryBean factory = new Jackson2RepositoryPopulatorFactoryBean();
  
  		factory.setResources(new Resource[] { sourceData });
  
  		return factory;
  
  	}
  </#if>
    
}


