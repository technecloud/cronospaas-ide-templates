package app.rest;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedResources;
import org.springframework.http.*;
import org.springframework.beans.factory.annotation.*;
import java.util.*;
import app.entity.*;
import app.business.*;

/**
 * Controller para expor serviços REST de Department
 * 
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/Department")
public class DepartmentREST {

  /**
   * Classe de negócio para manipulação de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("DepartmentBusiness")
  private DepartmentBusiness departmentBusiness;
  
  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST)
  public Department post(@Validated @RequestBody final Department entity) throws Exception {
    return departmentBusiness.post(entity);
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT)
  public Department put(@Validated @RequestBody final Department entity) throws Exception {
    return departmentBusiness.put(entity);
  }

  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
  public void delete(@PathVariable("id") java.lang.String id) throws Exception {
    departmentBusiness.delete(id);
  }

  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public HttpEntity<PagedResources<Department>> listParams (Pageable pageable, PagedResourcesAssembler assembler){
    return new ResponseEntity<>(assembler.toResource(departmentBusiness.list(pageable)), HttpStatus.OK);    
  }



  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{id}")
  public Department get(@PathVariable("id") java.lang.String id) throws Exception {
    return departmentBusiness.get(id);
  }
}