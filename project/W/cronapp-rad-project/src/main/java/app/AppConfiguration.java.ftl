package app;

import org.springframework.orm.jpa.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;
import org.springframework.transaction.*;
import org.springframework.transaction.annotation.*;
<#if (!authentication??) || (authentication?lower_case) == "normal" || (authentication?lower_case) == "token">
import org.springframework.core.io.*;
import org.springframework.data.repository.init.*;
import java.net.URL;
import java.io.File;
import java.util.Scanner;
import java.util.regex.Pattern;
</#if>
<#if multitenant?? && multitenant?lower_case == "sim">
import cronapp.framework.tenant.MultitenantJpaTransactionManager;
</#if>

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(entityManagerFactoryRef = "app-EntityManagerFactory", transactionManagerRef = "app-TransactionManager")
public class AppConfiguration {

  @Primary
  @Bean(name="app-EntityManagerFactory")
  public LocalEntityManagerFactoryBean entityManagerFactory() {
    LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
    factoryBean.setPersistenceUnitName("app");
    return factoryBean;
  }

  @Bean(name = "app-TransactionManager")
  public PlatformTransactionManager transactionManager() {
  <#if multitenant?? && multitenant?lower_case == "sim">
    return new MultitenantJpaTransactionManager();
  <#else>
    return new JpaTransactionManager(entityManagerFactory().getObject());
  </#if>
  }

<#if (!authentication??) || (authentication?lower_case) == "normal" || (authentication?lower_case) == "token" >
  @Bean
  public Jackson2RepositoryPopulatorFactoryBean repositoryPopulator() {
    Jackson2RepositoryPopulatorFactoryBean factory = new Jackson2RepositoryPopulatorFactoryBean();
    URL url = this.getClass().getClassLoader().getResource("app//populate.json");
    String strJSON = "[]";
    if(url != null) {
      File file = new File(url.getFile());
      try {
        Scanner scanner = new Scanner(file);
        strJSON = scanner.useDelimiter("\\A").next();
        scanner.close();
        strJSON = strJSON.replaceAll(Pattern.quote("{{ROLE_ADMIN_NAME}}"), "Administrators");
      }
      catch(Exception ignored) {
      }
    }
    Resource sourceData = new InputStreamResource(new java.io.ByteArrayInputStream(strJSON.getBytes()));
    factory.setResources(new Resource[] { sourceData });
    return factory;
  }
</#if>
}