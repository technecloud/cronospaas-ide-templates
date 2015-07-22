package api.rest.service.util;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;


/**
 * Realiza disponibiliza os pacotes rest.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-07-21
 *
 */

@ApplicationPath("/api/rest")
public class RESTApplication extends ResourceConfig {

	public RESTApplication() {
		packages("api.rest.service");
	}

}
