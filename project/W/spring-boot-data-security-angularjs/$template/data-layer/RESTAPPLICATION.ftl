package ${packageRoot};

import org.springframework.orm.jpa.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;
import org.springframework.transaction.*;
import org.springframework.transaction.annotation.*;

<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>
<#assign persistence_unit_name_formatted = persistence_unit_name?replace('.',' ')?capitalize?replace(' ','')>
<#assign clazz_name = persistence_unit_name_formatted + "Configuration">

<#assign entityManagerFactoryRef = persistence_unit_name + "-EntityManagerFactory">
<#assign transactionManagerRef = persistence_unit_name + "-TransactionManager">

<#assign first_pu = workspaceView.allDiagrams[0].getGlobalAttribute("namespace")?replace('"', '')>

@Configuration

@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "${entityManagerFactoryRef}",
        transactionManagerRef = "${transactionManagerRef}"
)

class ${clazz_name} {
  
    <#if persistence_unit_name == first_pu>
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


}


