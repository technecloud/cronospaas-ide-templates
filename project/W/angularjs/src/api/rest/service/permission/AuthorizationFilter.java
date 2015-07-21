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
  
  	public static final long serialVersionUID = -1l;
    private final Logger logger = Logger.getLogger(this.getClass().getName()); 

    private PermissionDAO dao;
    private List<PermissionEntity> loggedPermissions = new ArrayList<>();
    
    public void  init(FilterConfig config) 
                         throws ServletException{

    // Ao criar aplicação, o usuário logado é o administrador
    loggedPermissions.add( buildPermission(null, "/views/logged/(.)+", "ALL", null )  );
    loggedPermissions.add( buildPermission(null, "/api/rest/(User|Role|UserRole|Permission)(/.)*|/views/admin/(.)+", "ALL", null) );

                           
      dao = new PermissionDAO( SessionManager.getInstance().getEntityManager() );
      
      try{
        if(dao.findAll().isEmpty())
        initialPermission();                           
      }catch(Exception e){
        logger.log(Level.SEVERE, e.getMessage());
      }
      
    
   }

   private PermissionEntity buildPermission(RoleEntity role, String path, String verb, String exclude)   {
    
      PermissionEntity permission = new PermissionEntity();
      permission.setRole(role);
      permission.setPath(path);
      permission.setVerb(verb);
      permission.setExclude(exclude);
      
      return permission;
     
   }
   
   private void initialPermission(){
    System.out.println("creatingDefaultPermission");

    RoleEntity roleAdmin = new RoleEntity();
    roleAdmin.setName("admin");
    RoleEntity roleEveryOne = new RoleEntity();
    roleEveryOne.setName("everyOne");
    RoleEntity roleLogged = new RoleEntity();
    roleLogged.setName("logged");

    List<PermissionEntity> permissions = new ArrayList<>();
    permissions.add( buildPermission(roleAdmin, "/api/rest/(User|Role|UserRole|Permission)(/.)*|/views/admin/(.)+", "ALL", null) );
    permissions.add( buildPermission(roleEveryOne, "/(.)+\\.(js|css|jpg|gif|png|ico|html|woff2)", "GET", "/views/(admin|logged)/(.)*" ) );
    permissions.add( buildPermission(roleEveryOne, "(/|/index.html|/oauth2(.)*|/oauth2callback|/revoke|/page/(.)+|/session)", "GET", null  ) );
  
    
    // Ao criar aplicação, o usuário logado é o administrador
    for(PermissionEntity pe : loggedPermissions){
      System.out.println("Elvis was here");
      pe.setRole(roleLogged);
      permissions.add( pe );
    }
    
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
    roles.add(roleLogged);
    
    for(RoleEntity role: roles)
    roleDAO.save(role);    
    
    for(PermissionEntity permission : permissions)
    permissionDAO.save(permission);

    
    UserEntity userAdmin = new UserEntity();
    userAdmin.setName("admin");
    userDAO.save(userAdmin);
    
    userRoleDAO.save(new UserRoleEntity(userAdmin, roleAdmin));
    userRoleDAO.save(new UserRoleEntity(userAdmin, roleEveryOne));
    userRoleDAO.save(new UserRoleEntity(userAdmin, roleLogged));
    
    UserEntity userAnonymous = new UserEntity();
    userAnonymous.setName("anonymous");
    userDAO.save(userAnonymous);

    userRoleDAO.save(new UserRoleEntity(userAnonymous, roleEveryOne));
    userRoleDAO.save(new UserRoleEntity(userAnonymous, roleLogged));

    
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

    // Public Permissions
    permissions.add( buildPermission(null, "/auth", "POST", null ) );
    permissions.add( buildPermission(null, "/logout", "GET", null ) );
    permissions.add( buildPermission(null, "/session", "GET", null ) );
    
    if(isLogged(request)){
      for(PermissionEntity pe : loggedPermissions)
          permissions.add( pe );
    }

    for(PermissionEntity permission : permissions){

    logger.log(Level.INFO,"path:(" + path + ")=match(" + permission.getPath() + ")=" +  path.matches(permission.getPath()) );

      if( permission.isEnabled() 
      && (verb.equalsIgnoreCase(permission.getVerb()) || permission.getVerb().equalsIgnoreCase("ALL"))
      && (path.matches(permission.getPath()) && !path.matches(""+permission.getExclude())) 
      ){
        allowed = true;
        break;
      }
      
      
    }

    return allowed;               
   }
   
   public boolean isLogged(HttpServletRequest request){
     HttpSession session = request.getSession();
    Object username = session.getAttribute("username");
    System.out.println("isLogged:" + username);
    return (username != null);
   }
   
   
   public List<PermissionEntity> fillAllByUserName(EntityManager entityManager, String username) {
    String jql = "SELECT OBJECT(p) FROM PermissionEntity p, UserRoleEntity ur, UserEntity u WHERE p.role.id = ur.role.id AND ur.user.id = u.id AND u.name = :username"
               + " ORDER BY p.priority desc";
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