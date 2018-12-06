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
	<#list workspaceView.allDiagrams as diagram>${diagram.getGlobalAttribute("namespace")}<#if diagram?has_next>, </#if></#list><#list packages as package>${package}<#if package?has_next>, </#if></#list>
})
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class })
public class SpringBootMain extends SpringBootServletInitializer {

    static {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
    }

	public static void main(String[] args) throws Exception {
		CronappApplication.run(args);
	}

}
