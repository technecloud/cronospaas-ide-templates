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
 * Controller para expor serviços REST de Role
 * 
 * @author Techne
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/security/Role")
public class RoleREST {
  
  /**
   * Classe de negócio para manipulação de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("RoleBusiness")
  private RoleBusiness roleBusiness;
  
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
  @Qualifier("UserRoleBusiness")
  private UserRoleBusiness userRoleBusiness;
  /**
   * @generated
   */
  @Autowired
  @Qualifier("PermissionBusiness")
  private PermissionBusiness permissionBusiness;
  
  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST)
  public Role post(@Validated @RequestBody final Role entity) throws Exception {
    roleBusiness.getRepository().save(entity);
    return entity;
  }
  
  /**
   * Serviço exposto para recuperar entidades de acordo com os paramêtros para limite
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET)
  public List<Role> get(@RequestParam(defaultValue = "100", required = false) Integer limit,
                        @RequestParam(defaultValue = "0", required = false) Integer offset)
          throws Exception {
    Page<Role> pages = roleBusiness.getRepository().findAll(new PageRequest(offset, limit));
    return pages.getContent();
  }
  
  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{id}")
  public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
    Role entity = roleBusiness.getRepository().findOne(id);
    return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
  }
  
  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT)
  public ResponseEntity<?> put(@Validated @RequestBody final Role entity) throws Exception {
    return ResponseEntity.ok(roleBusiness.getRepository().saveAndFlush(entity));
  }
  
  /**
   * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
  public Role put(@PathVariable("id") final String id, @Validated @RequestBody final Role entity) throws Exception {
    return roleBusiness.getRepository().saveAndFlush(entity);
  }
  
  /**
   * Serviço exposto para remover a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE)
  public void delete(@Validated @RequestBody final Role entity) throws Exception {
    roleBusiness.getRepository().delete(entity);
  }
  
  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
  public void delete(@PathVariable("id") final String id) throws Exception {
    roleBusiness.getRepository().delete(id);
  }
  
  /**
   * OneToMany Relationship GET
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{instanceId}/UserRole")
  public List<UserRole> findUserRole(@PathVariable("instanceId") java.lang.String instanceId,
                                     @RequestParam(defaultValue = "100", required = false) Integer limit,
                                     @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return roleBusiness.findUserRole(instanceId, new PageRequest(offset, limit));
  }
  
  /**
   * OneToMany Relationship DELETE
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{instanceId}/UserRole/{relationId}")
  public ResponseEntity<?> deleteUserRole(@PathVariable("relationId") java.lang.String relationId) {
    try {
      this.userRoleBusiness.getRepository().delete(relationId);
      return ResponseEntity.ok().build();
    }
    catch(Exception e) {
      return ResponseEntity.status(404).build();
    }
  }
  
  /**
   * OneToMany Relationship GET
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{instanceId}/Permission")
  public List<Permission> findPermission(@PathVariable("instanceId") java.lang.String instanceId,
                                         @RequestParam(defaultValue = "100", required = false) Integer limit,
                                         @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return roleBusiness.findPermission(instanceId, new PageRequest(offset, limit));
  }
  
  /**
   * OneToMany Relationship DELETE
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{instanceId}/Permission/{relationId}")
  public ResponseEntity<?> deletePermission(@PathVariable("relationId") java.lang.String relationId) {
    try {
      this.permissionBusiness.getRepository().delete(relationId);
      return ResponseEntity.ok().build();
    }
    catch(Exception e) {
      return ResponseEntity.status(404).build();
    }
  }
  
  /**
   * ManyToMany Relationship GET
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{instanceId}/User")
  public List<User> listUser(@PathVariable("instanceId") java.lang.String instanceId,
                             @RequestParam(defaultValue = "100", required = false) Integer limit,
                             @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return roleBusiness.listUser(instanceId, new PageRequest(offset, limit));
  }
  
  /**
   * ManyToMany Relationship POST
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST, value = "/{instanceId}/User")
  public ResponseEntity<?> postUser(User entity, @PathVariable("instanceId") java.lang.String instanceId) {
    UserRole newUserRole = new UserRole();
    
    Role instance = this.roleBusiness.getRepository().findOne(instanceId);
    
    newUserRole.setUser(entity);
    newUserRole.setRole(instance);
    
    this.userRoleBusiness.getRepository().saveAndFlush(newUserRole);
    // session.commit();
    // this.userRoleBusiness.refresh(newUserRole);
    return ResponseEntity.ok(newUserRole.getRole());
  }
  
  /**
   * ManyToMany Relationship DELETE
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{instanceId}/User/{relationId}")
  public ResponseEntity<?> deleteUser(@PathVariable("instanceId") java.lang.String instanceId,
                                      @PathVariable("relationId") java.lang.String relationId) {
    this.roleBusiness.deleteUser(instanceId, relationId);
    return ResponseEntity.ok().build();
  }
  
}
