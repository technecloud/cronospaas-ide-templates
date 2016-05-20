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


/**
 * Controller para expor serviços REST de User
 * 
 * @author Techne
 * @version 1.0
 * @since 2016-05-18
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/security/User")
public class UserREST {

    /**
     * Classe de negócio para manipulação de dados
     * 
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
     * Serviço exposto para novo registro de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.POST)
    public User post(@Validated @RequestBody final User entity) throws Exception {
        String rawPassword = entity.getPassword();
        String hashPassword = new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode(rawPassword);
        entity.setPassword(hashPassword);
        userBusiness.getRepository().save(entity);
        return entity;
    }

    /**
     * Serviço exposto para recuperar entidades de acordo com os paramêtros para limite
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<User> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<User> pages = userBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        User entity = userBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final User entity) throws Exception {
        return ResponseEntity.ok( userBusiness.getRepository().saveAndFlush(entity));
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public User put(@PathVariable("id") final String id, @Validated @RequestBody final User entity) throws Exception {

        String formPassword = entity.getPassword();
        String hashPassword = formPassword.startsWith("$2a$10$") ? formPassword : new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode(formPassword);
        entity.setPassword(hashPassword);

        return userBusiness.getRepository().saveAndFlush(entity);
    }


    /**
     * Serviço exposto para remover a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final User entity) throws Exception {
         userBusiness.getRepository().delete(entity);
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
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
  public ResponseEntity<?> postRole(@Validated @RequestBody final Role entity, @PathVariable("instanceId") java.lang.String instanceId) {
      UserRole newUserRole = new UserRole();

      User instance = this.userBusiness.getRepository().findOne(instanceId);

      newUserRole.setRole(entity);
      newUserRole.setUser(instance);
      
      this.userRoleBusiness.getRepository().saveAndFlush(newUserRole);

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