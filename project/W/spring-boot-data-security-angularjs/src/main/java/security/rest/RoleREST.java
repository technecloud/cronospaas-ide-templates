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
 * Controller para expor serviços REST de Role
 * 
 * @author Humberto Dias
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
  
  // NamedQueries
  
}
