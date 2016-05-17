package security.rest;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;

import org.springframework.http.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import security.entity.*;
import security.business.*;



@RestController
@RequestMapping(value = "/api/rest/security/User")
public class UserREST {

  /**
   * @generated
   */
    @Autowired
    @Qualifier("UserBusiness")
    private UserBusiness userBusiness;
    
  /**
   * @generated
   */
    @Autowired
    @Qualifier("RoleBusiness")
    private RoleBusiness roleBusiness;
  /**
   * @generated
   */
    @Autowired
    @Qualifier("UserRoleBusiness")
    private UserRoleBusiness userRoleBusiness;
    

  /**
   * CRUD - Create
   * @generated
   */
    @RequestMapping(method = RequestMethod.POST)
    public User post(@Validated @RequestBody final User entity) throws Exception {
        userBusiness.getRepository().save(entity);
        return entity;
    }

  /**
   * CRUD - Read
   * @generated
   */
    @RequestMapping(method = RequestMethod.GET)
    public List<User> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<User> pages = userBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

  /**
   * CRUD - Read
   * @generated
   */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        User entity = userBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

  /**
   * CRUD - Update
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT)
  public ResponseEntity<?> put(@Validated @RequestBody final User entity) throws Exception {
      return ResponseEntity.ok( userBusiness.getRepository().saveAndFlush(entity));
  }

  /**
   * CRUD - Update
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
  public User put(@PathVariable("id") final String id, @Validated @RequestBody final User entity) throws Exception {
      return userBusiness.getRepository().saveAndFlush(entity);
  }

  /**
   * CRUD - Delete
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE)
  public void delete(@Validated @RequestBody final User entity) throws Exception {
      userBusiness.getRepository().delete(entity);
  }

  /**
   * CRUD - Delete
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
  public void delete(@PathVariable("id") final String id) throws Exception {
     userBusiness.getRepository().delete(id);
  }



  /**
   * NamedQuery findByRole
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByRole")    
  public  List<User> findByRoleParams (@RequestParam("roleid") java.lang.String roleid, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
    return userBusiness.getRepository().findByRole(roleid, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery findByLogin
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByLogin")    
  public  List<User> findByLoginParams (@RequestParam("login") java.lang.String login, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
    return userBusiness.getRepository().findByLogin(login, new PageRequest(offset, limit)   );  
  }


  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{instanceId}/UserRole")    
  public List<UserRole> findUserRole(@PathVariable("instanceId") java.lang.String instanceId, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return userBusiness.findUserRole(instanceId,  new PageRequest(offset, limit) );
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{instanceId}/UserRole/{relationId}")    
  public ResponseEntity<?> deleteUserRole(@PathVariable("relationId") java.lang.String relationId) {
			try {
			  this.userRoleBusiness.getRepository().delete(relationId);
				return ResponseEntity.ok().build();
			} catch (Exception e) {
				return ResponseEntity.status(404).build();
			}
  }



  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/{instanceId}/Role")
  public List<Role> listRole(@PathVariable("instanceId") java.lang.String instanceId,  @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset ) {
    return userBusiness.listRole(instanceId,  new PageRequest(offset, limit) );
  }

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  ,value="/{instanceId}/Role")
  public ResponseEntity<?> postRole(Role entity, @PathVariable("instanceId") java.lang.String instanceId) {
			UserRole newUserRole = new UserRole();

			User instance = this.userBusiness.getRepository().findOne(instanceId);

			newUserRole.setRole(entity);
			newUserRole.setUser(instance);
			
			this.userRoleBusiness.getRepository().saveAndFlush(newUserRole);
//			session.commit();
//			this.userRoleBusiness.refresh(newUserRole);
			return ResponseEntity.ok(newUserRole.getUser());
  }   

  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  ,value="/{instanceId}/Role/{relationId}")
  public ResponseEntity<?> deleteRole(@PathVariable("instanceId") java.lang.String instanceId, @PathVariable("relationId") java.lang.String relationId) {
			this.userBusiness.deleteRole(instanceId, relationId);
			return ResponseEntity.ok().build();
  }  



}