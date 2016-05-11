import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.context.web.*;
import org.springframework.context.annotation.*;

@ComponentScan(basePackages = {
"security" , 
"sample.pessoa" ,
"auth.permission"
})
@SpringBootApplication
public class SpringBootMain extends SpringBootServletInitializer {
  
    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}


