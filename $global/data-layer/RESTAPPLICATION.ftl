package ${restPackage};

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;


/**
 * Realiza disponibiliza os pacotes rest.
 * @generated
 */

@ApplicationPath("${restPath}")
public class RESTApplication extends ResourceConfig {

    /**
     * @generated
     */
	public RESTApplication() {
		packages("${restPackage}");
	}

}