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
 * Controller para expor serviços REST de Company
 * 
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/Company")
public class CompanyREST {

  /**
   * Classe de negócio para manipulação de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("CompanyBusiness")
  private CompanyBusiness companyBusiness;
  
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
  @Qualifier("DepartmentBusiness")
  private DepartmentBusiness departmentBusiness;
  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.POST)
  public Company post(@Validated @RequestBody final Company entity) throws Exception {
    return companyBusiness.post(entity);
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.PUT)
  public Company put(@Validated @RequestBody final Company entity) throws Exception {
    return companyBusiness.put(entity);
  }

  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
  public void delete(@PathVariable("id") java.lang.String id) throws Exception {
    companyBusiness.delete(id);
  }

  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public HttpEntity<PagedResources<Company>> listParams (Pageable pageable, PagedResourcesAssembler assembler){
    return new ResponseEntity<>(assembler.toResource(companyBusiness.list(pageable)), HttpStatus.OK);    
  }


  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{instanceId}/User")    
  public HttpEntity<PagedResources<User>> findUser(@PathVariable("instanceId") java.lang.String instanceId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(companyBusiness.findUser(instanceId, pageable)), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{instanceId}/User/{relationId}")    
  public void deleteUser(@PathVariable("relationId") java.lang.String relationId) throws Exception {
    this.userBusiness.delete(relationId);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/{instanceId}/User/{relationId}")
  public User putUser(@Validated @RequestBody final User entity, @PathVariable("relationId") java.lang.String relationId) throws Exception {
    return this.userBusiness.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/{instanceId}/User")
  public User postUser(@Validated @RequestBody final User entity, @PathVariable("instanceId") java.lang.String instanceId) throws Exception {
  Company company = this.companyBusiness.get(instanceId);
  entity.setCompany(company);
    return this.userBusiness.post(entity);
  }   


  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{instanceId}/Department")    
  public HttpEntity<PagedResources<Department>> findDepartment(@PathVariable("instanceId") java.lang.String instanceId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(companyBusiness.findDepartment(instanceId, pageable)), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{instanceId}/Department/{relationId}")    
  public void deleteDepartment(@PathVariable("relationId") java.lang.String relationId) throws Exception {
    this.departmentBusiness.delete(relationId);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/{instanceId}/Department/{relationId}")
  public Department putDepartment(@Validated @RequestBody final Department entity, @PathVariable("relationId") java.lang.String relationId) throws Exception {
    return this.departmentBusiness.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/{instanceId}/Department")
  public Department postDepartment(@Validated @RequestBody final Department entity, @PathVariable("instanceId") java.lang.String instanceId) throws Exception {
  Company company = this.companyBusiness.get(instanceId);
  entity.setCompany(company);
    return this.departmentBusiness.post(entity);
  }   



  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{id}")
  public Company get(@PathVariable("id") java.lang.String id) throws Exception {
    return companyBusiness.get(id);
  }
}