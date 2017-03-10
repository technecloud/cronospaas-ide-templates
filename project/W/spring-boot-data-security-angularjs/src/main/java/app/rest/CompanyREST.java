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
  @RequestMapping(method = RequestMethod.DELETE, value = "/{companyId}")
  public void delete(@PathVariable("companyId") java.lang.String companyId) throws Exception {
    companyBusiness.delete(companyId);
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
  , value="/{companyId}/User")    
  public HttpEntity<PagedResources<User>> findUser(@PathVariable("companyId") java.lang.String companyId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(companyBusiness.findUser(companyId, pageable)), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{companyId}/User/{userId}")    
  public void deleteUser(@PathVariable("userId") java.lang.String userId) throws Exception {
    this.userBusiness.delete(userId);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/{companyId}/User/{userId}")
  public User putUser(@Validated @RequestBody final User entity, @PathVariable("userId") java.lang.String userId) throws Exception {
    return this.userBusiness.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/{companyId}/User")
  public User postUser(@Validated @RequestBody final User entity, @PathVariable("companyId") java.lang.String companyId) throws Exception {
  Company company = this.companyBusiness.get(companyId);
  entity.setCompany(company);
    return this.userBusiness.post(entity);
  }   


  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{companyId}/Department")    
  public HttpEntity<PagedResources<Department>> findDepartment(@PathVariable("companyId") java.lang.String companyId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(companyBusiness.findDepartment(companyId, pageable)), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{companyId}/Department/{departmentId}")    
  public void deleteDepartment(@PathVariable("departmentId") java.lang.String departmentId) throws Exception {
    this.departmentBusiness.delete(departmentId);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/{companyId}/Department/{departmentId}")
  public Department putDepartment(@Validated @RequestBody final Department entity, @PathVariable("departmentId") java.lang.String departmentId) throws Exception {
    return this.departmentBusiness.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/{companyId}/Department")
  public Department postDepartment(@Validated @RequestBody final Department entity, @PathVariable("companyId") java.lang.String companyId) throws Exception {
  Company company = this.companyBusiness.get(companyId);
  entity.setCompany(company);
    return this.departmentBusiness.post(entity);
  }   



  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET, value = "/{companyId}")
  public Company get(@PathVariable("companyId") java.lang.String companyId) throws Exception {
    return companyBusiness.get(companyId);
  }
}