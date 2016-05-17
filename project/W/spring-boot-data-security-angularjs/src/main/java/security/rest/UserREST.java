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

/**
 * Controller para expor serviços REST de User
 * 
 * @author Humberto Dias
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
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST)
  public User post(@Validated @RequestBody final User entity) throws Exception {
    userBusiness.getRepository().save(entity);
    return entity;
  }
  
  /**
   * Serviço exposto para recuperar entidades de acordo com os paramêtros para limite
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET)
  public List<User> get(@RequestParam(defaultValue = "100", required = false) Integer limit,
                        @RequestParam(defaultValue = "0", required = false) Integer offset)
          throws Exception {
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
    return ResponseEntity.ok(userBusiness.getRepository().saveAndFlush(entity));
  }
  
  /**
   * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
  public User put(@PathVariable("id") final String id, @Validated @RequestBody final User entity) throws Exception {
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
  
  // NamedQueries
  
  /**
   * NamedQuery findByRole
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/findByRole")
  public List<User> findByRoleParams(@RequestParam("roleid") java.lang.String roleid,
                                     @RequestParam(defaultValue = "100", required = false) Integer limit,
                                     @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return userBusiness.getRepository().findByRole(roleid, new PageRequest(offset, limit));
  }
  
  /**
   * NamedQuery findByLogin
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/findByLogin")
  public List<User> findByLoginParams(@RequestParam("login") java.lang.String login,
                                      @RequestParam(defaultValue = "100", required = false) Integer limit,
                                      @RequestParam(defaultValue = "0", required = false) Integer offset) {
    return userBusiness.getRepository().findByLogin(login, new PageRequest(offset, limit));
  }
  
}
