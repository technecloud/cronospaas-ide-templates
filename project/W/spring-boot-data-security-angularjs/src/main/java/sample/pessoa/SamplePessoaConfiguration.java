package sample.pessoa;

import org.springframework.orm.jpa.*;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.*;
import org.springframework.transaction.*;
import org.springframework.transaction.annotation.*;


@Configuration

@EnableTransactionManagement
@EnableJpaRepositories(
        entityManagerFactoryRef = "sample.pessoa-EntityManagerFactory",
        transactionManagerRef = "sample.pessoa-TransactionManager"
)

class SamplePessoaConfiguration {
  

    @Bean(name="sample.pessoa-EntityManagerFactory")
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
        factoryBean.setPersistenceUnitName("sample.pessoa");
        return factoryBean;
    }

    @Bean(name = "sample.pessoa-TransactionManager")
    public PlatformTransactionManager transactionManager() {
        return new JpaTransactionManager(entityManagerFactory().getObject());
    }


}


