package ${package_root};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;

<#assign clazz_name = "Application">

@Configuration
@ComponentScan
@EnableAutoConfiguration
public class ${clazz_name} extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(${clazz_name}.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(${clazz_name}.class);
    }
/*
    @Bean
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
        factoryBean.setPersistenceUnitName("${persistence_unit_name}");
        return factoryBean;
    }
*/

}
EOF<${clazz_name}.java
