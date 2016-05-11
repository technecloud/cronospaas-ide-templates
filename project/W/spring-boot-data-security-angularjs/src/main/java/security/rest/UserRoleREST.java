package security.rest;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;


import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;

import security.entity.*;
import security.business.*;



@RestController
@RequestMapping(value = "/api/rest/security/UserRole")
public class UserRoleREST {


    @Autowired
    @Qualifier("UserRoleBusiness")
    private UserRoleBusiness userRoleBusiness;

    // CRUD
    @RequestMapping(method = RequestMethod.POST)
    public UserRole post(@Validated @RequestBody final UserRole entity) throws Exception {
        userRoleBusiness.getRepository().save(entity);
        return entity;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<UserRole> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<UserRole> pages = userRoleBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        UserRole entity = userRoleBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final UserRole entity) throws Exception {
        return ResponseEntity.ok( userRoleBusiness.getRepository().saveAndFlush(entity));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public UserRole put(@PathVariable("id") final String id, @Validated @RequestBody final UserRole entity) throws Exception {
        return userRoleBusiness.getRepository().saveAndFlush(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final UserRole entity) throws Exception {
         userRoleBusiness.getRepository().delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         userRoleBusiness.getRepository().delete(id);
    }

// NamedQueries

  /**
   * NamedQuery findByUser
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByUser")    
  public  List<UserRole> findByUserParams (@RequestParam("user") User user, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return userRoleBusiness.getRepository().findByUser(user, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery findByEmail
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByEmail")    
  public  List<UserRole> findByEmailParams (@RequestParam("email") java.lang.String email, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return userRoleBusiness.getRepository().findByEmail(email, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery findByLogin
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByLogin")    
  public  List<UserRole> findByLoginParams (@RequestParam("login") java.lang.String login, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return userRoleBusiness.getRepository().findByLogin(login, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery findByRole
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/findByRole")    
  public  List<UserRole> findByRoleParams (@RequestParam("roleid") java.lang.String roleid, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return userRoleBusiness.getRepository().findByRole(roleid, new PageRequest(offset, limit)   );  
  }

}