package api.rest.service.permission;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.logging.Logger;
import java.util.logging.Level;


@WebFilter(
  urlPatterns = {"/*"}
, filterName = "authorization-filter"
)
public class AuthorizationFilter implements Filter {
  
  	static final long serialVersionUID = -1l;
    private final Logger logger = Logger.getLogger(this.getClass().getName()); 


  public void  init(FilterConfig config) 
                         throws ServletException{
   }
   
   public void  doFilter(ServletRequest request, 
                 ServletResponse response,
                 FilterChain chain) 
                 throws IOException, ServletException {

      HttpServletRequest httpRequest = (HttpServletRequest)request;
      //HttpServletResponse httpResponse = (HttpServletResponse)response;
      
      logger.log(Level.INFO, "doFilter:" + httpRequest.getRequestURI());
      

      // Pass request back down the filter chain
      chain.doFilter(request,response);

   }
   
   public void destroy( ){
      /* Called before the Filter instance is removed 
      from service by the web container*/
   }

}