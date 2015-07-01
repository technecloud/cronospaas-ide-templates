package api.rest.service.permission;

import javax.servlet.*;
import javax.persistence.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.*;
import java.util.logging.Logger;
import java.util.logging.Level;
import br.dao.*;
import br.entity.*;


@WebFilter(
  urlPatterns = {"/*"}
, filterName = "authorization-filter"
)
public class AuthorizationFilter implements Filter {
  
  	static final long serialVersionUID = -1l;
    private final Logger logger = Logger.getLogger(this.getClass().getName()); 

    PermissionDAO dao;
  public void  init(FilterConfig config) 
                         throws ServletException{
                           
      dao = new PermissionDAO( SessionManager.getInstance().getEntityManager() );

   }
   
   public void  doFilter(ServletRequest request, 
                 ServletResponse response,
                 FilterChain chain) 
                 throws IOException, ServletException {
      
      HttpServletRequest httpRequest = (HttpServletRequest)request;
      HttpServletResponse httpResponse = (HttpServletResponse)response;
      
      
      if( filter(httpRequest, httpResponse) ){
        
      }else{

        // Pass request back down the filter chain
        chain.doFilter(request,response);
        
      }
      
   }
   
   private boolean filter(HttpServletRequest request, 
                 HttpServletResponse response){
    boolean blocked = false;               
    
    String verb = request.getMethod();
    String uri  = request.getRequestURI();
    String path = uri.substring(request.getContextPath().length());
    
    List<PermissionEntity> permissions = syncDatabase();
    for(PermissionEntity permission : permissions){
      if(verb.equalsIgnoreCase(permission.getVerb()) 
      && path.matches(permission.getPath())){
        response.setStatus(permission.getResponse());
        blocked = true;
        break;
      }
      
    }

    logger.log(Level.INFO,"filter(" + path + "," + verb + ")=blocked(" + blocked + ")");
    return blocked;               
   }
   
   private List<PermissionEntity> syncDatabase(){
    EntityManager em = dao.getEntityManager();
    List<PermissionEntity> permissions = dao.findAll();
    for(PermissionEntity permission : permissions){
      em.refresh(permission);
    }
    return permissions;
   }
   
   public void destroy( ){
      /* Called before the Filter instance is removed 
      from service by the web container*/
   }

}