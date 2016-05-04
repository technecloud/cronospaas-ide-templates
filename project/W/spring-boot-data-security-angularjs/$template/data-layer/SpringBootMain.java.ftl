import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.context.web.*;
import org.springframework.context.annotation.*;

@ComponentScan(basePackages = {
<#list workspaceView.allDiagrams as diagram>
${diagram.getGlobalAttribute("namespace")} <#if diagram_has_next>,</#if> 
</#list>
})
@SpringBootApplication
public class SpringBootMain extends SpringBootServletInitializer {
  
    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}


