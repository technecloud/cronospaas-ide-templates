package security;

import java.io.File;
import java.util.Scanner;
import java.util.regex.Pattern;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.init.Jackson2RepositoryPopulatorFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import auth.permission.SecurityPermission;

/**
 * Classe que configura os beans para persistencia
 * 
 * @author Usuário de Teste
 *
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(entityManagerFactoryRef = "security-EntityManagerFactory", transactionManagerRef = "security-TransactionManager")
class SecurityConfiguration {

	@Primary

	@Bean(name = "security-EntityManagerFactory")
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

}
