package api.rest.exceptions;

import javax.ws.rs.core.*;
import javax.ws.rs.WebApplicationException;
import java.io.*;

public class CustomWebApplicationException extends WebApplicationException implements Serializable {
  
  /**
   * UID da classe, necessário na serialização
   */
  private static final long serialVersionUID = 2127320450194633408l;
  
  /**
   * Create a HTTP 404 (Not Found) exception.
   */
  public CustomWebApplicationException() {
    super(Response.ok().build());
  }
  
  /**
   * Create a HTTP 404 (Not Found) exception.
   * 
   * @param message
   *          the String that is the entity of the 404 response.
   */
  public CustomWebApplicationException(ExceptionInfo message) {
    super(Response.status(500).entity(message).type(MediaType.APPLICATION_JSON).build());
  }
  
  static ExceptionInfo toExceptionInfo(Throwable exception) {
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    exception.printStackTrace(pw);
    
    String title = exception.getCause() == null ? exception.getMessage() : exception.getCause().toString();
    
    ExceptionInfo message = new ExceptionInfo(500, title.toString(), sw.toString());
    return message;
    
  }
  
  public CustomWebApplicationException(Throwable exception) {
    this(toExceptionInfo(exception));
  }
  
}
