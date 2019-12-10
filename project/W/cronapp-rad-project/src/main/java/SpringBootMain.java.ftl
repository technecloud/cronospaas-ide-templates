import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

import java.util.TimeZone;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@ComponentScan(basePackages = {
	<#if social?? && social?lower_case == "sim">"cronapp.framework.authentication.social",</#if>
	<#if (authentication??)>"cronapp.framework.authentication.${authentication?lower_case}",</#if>
	"cronapp.framework.authentication.security",
	"cronapp.framework.rest",
	<#if mutual?? && mutual?lower_case == "sim" && (enterprise)!false>
	"cronapp.framework.authentication.mutual",
	</#if>
	<#if multitenant?? && multitenant?lower_case == "sim">
	"cronapp.framework.tenant",
	</#if>
    "cronapp.framework.scheduler",
	"auth.permission",
	"api.rest.events",
	"api.rest.webservices",
	"reports",
	"cronapi",
	"blockly",
	"app"
})
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class })
public class SpringBootMain extends SpringBootServletInitializer {

    static {
    	<#if timezone?? && timezone?lower_case != "utc">
        TimeZone.setDefault(TimeZone.getTimeZone("${timezone}"));
        <#else>
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        </#if>
    }

	public static void main(String[] args) throws Exception {
		CronappApplication.run(args);
	}

}
