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
      
      try{
        if(dao.findAll().isEmpty())
        initialPermission();                           
      }catch(Exception e){
        logger.log(Level.SEVERE, e.getMessage());
      }

   }
   
   void initialPermission(){
    System.out.println("INITIAL_PERMISSION");

    RoleEntity roleAdmin = new RoleEntity("admin");
    RoleEntity roleEveryOne = new RoleEntity("angular");
    RoleEntity logged = new RoleEntity("logged");

    List<PermissionEntity> permissions = new ArrayList<>();
    permissions.add( new PermissionEntity("/api/rest/.", "ALL", roleAdmin ) );

    permissions.add( new PermissionEntity("(/*)+\\.(js|css|jpg|gif|png)", "GET", roleEveryOne ) );
    permissions.add( new PermissionEntity("/index.html", "GET", roleEveryOne ) );
    permissions.add( new PermissionEntity("/", "GET", roleEveryOne ) );
    
    permissions.add( new PermissionEntity("/auth", "POST", roleEveryOne ) );
    permissions.add( new PermissionEntity("/logout", "GET", roleEveryOne ) );
    
    permissions.add( new PermissionEntity("/views/(.)+\\.html", "GET", logged ) );
    permissions.add( new PermissionEntity("/page/.", "GET", logged ) );

    SessionManager session = SessionManager.getInstance();
    session.begin();
    
    EntityManager em = session.getEntityManager();
    
    UserDAO userDAO = new UserDAO( em );
    RoleDAO roleDAO = new RoleDAO( em );
    UserRoleDAO userRoleDAO = new UserRoleDAO( em );
    PermissionDAO permissionDAO = new PermissionDAO( em );
    
    List<RoleEntity> roles = new ArrayList<>();
    roles.add(roleAdmin);
    roles.add(roleEveryOne);
    roles.add(logged);
    
    for(RoleEntity role: roles)
    roleDAO.save(role);    
    
    for(PermissionEntity permission : permissions)
    permissionDAO.save(permission);

    
    UserEntity userAdmin = new UserEntity("admin");
    userDAO.save(userAdmin);
    
    userRoleDAO.save(new UserRoleEntity(userAdmin, roleAdmin));
    userRoleDAO.save(new UserRoleEntity(userAdmin, roleEveryOne));
    userRoleDAO.save(new UserRoleEntity(userAdmin, logged));
    
    UserEntity userAnonymous = new UserEntity("anonymous");
    userDAO.save(userAnonymous);

    userRoleDAO.save(new UserRoleEntity(userAnonymous, roleEveryOne));
    userRoleDAO.save(new UserRoleEntity(userAnonymous, logged));

    
    session.commit();
    
   }
   
   public void  doFilter(ServletRequest request, 
                 ServletResponse response,
                 FilterChain chain) 
                 throws IOException, ServletException {
      
      HttpServletRequest httpRequest = (HttpServletRequest)request;
      HttpServletResponse httpResponse = (HttpServletResponse)response;
      String username = httpRequest.getSession().getAttribute("username") == null ? "anonymous" : httpRequest.getSession().getAttribute("username").toString() ;
      
      logger.log(Level.INFO, "session.username:"+ username);

      if( filter(httpRequest, httpResponse, username )  ){
        chain.doFilter(request,response);
      }else{
          httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
      }

   }
   
   private boolean filter(HttpServletRequest request, 
                 HttpServletResponse response, String username){
    
    boolean allowed = false;
    
    String verb = request.getMethod();
    String uri  = request.getRequestURI();
    String path = uri.substring(request.getContextPath().length());
    
    List<PermissionEntity> permissions = syncDatabase(username);
    for(PermissionEntity permission : permissions){

    logger.log(Level.INFO,"permission(" + permission.isEnabled() + "," + permission.getVerb() + "," + permission.getPath()  + ")");

      if( permission.isEnabled() 
      && (verb.equalsIgnoreCase(permission.getVerb()) || permission.getVerb().equalsIgnoreCase("ALL"))
      && path.matches(permission.getPath())){
        allowed = true;
        break;
      }
      
    }

    logger.log(Level.INFO,"permission(" + uri + ")=" + allowed);
    
    return allowed;               
   }
   
   
   public List<PermissionEntity> fillAllByUserName(EntityManager entityManager, String username) {
    String jql = "SELECT OBJECT(p) FROM PermissionEntity p, UserRoleEntity ur, UserEntity u WHERE p.role.id = ur.role.id AND ur.user.id = u.id AND u.name = :username";
    Query q = entityManager.createQuery(jql);
    q.setParameter("username", username);
    return q.getResultList();
  }


   private List<PermissionEntity> syncDatabase(String username){
    EntityManager em = dao.getEntityManager();
    List<PermissionEntity> permissions = fillAllByUserName(em, username);
    
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