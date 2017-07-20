import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {
	<#if (authentication??)>"cronapp.framework.authentication.${authentication?lower_case}",</#if>
	"cronapp.framework.rest",
	"cronapp.framework.tenant",
	"permission",
	"api.rest.events",
	"api.rest.webservices",
	"reports",
	"cronapi",
	"blockly",
	<#list workspaceView.allDiagrams as diagram>${diagram.getGlobalAttribute("namespace")}<#if diagram?has_next>, </#if></#list><#list packages as package>${package}<#if package?has_next>, </#if></#list>
})
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class })
public class SpringBootMain extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMain.class, args);
	}

}