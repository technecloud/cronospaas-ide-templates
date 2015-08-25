package security.rest;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;


/**
 * Realiza disponibiliza os pacotes rest.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-08-25
 *
 */

@ApplicationPath("/api/rest/security")
public class RESTApplication extends ResourceConfig {

	public RESTApplication() {
		packages("security.rest");
	}

}