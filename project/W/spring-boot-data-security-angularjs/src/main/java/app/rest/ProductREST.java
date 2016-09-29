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
 * Controller para expor serviços REST de Product
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/Product")
public class ProductREST {

    /**
     * Classe de negócio para manipulação de dados
     * 
     * @generated
     */
    @Autowired
    @Qualifier("ProductBusiness")
    private ProductBusiness productBusiness;

    /**
     * @generated
     */
      @Autowired
      @Qualifier("ConsumerBusiness")
      private ConsumerBusiness consumerBusiness;
    /**
     * @generated
     */
      @Autowired
      @Qualifier("OrderBusiness")
      private OrderBusiness orderBusiness;

    /**
     * Serviço exposto para novo registro de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.POST)
    public Product post(@Validated @RequestBody final Product entity) throws Exception {
        return productBusiness.post(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public Product put(@Validated @RequestBody final Product entity) throws Exception {
        return productBusiness.put(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Product put(@PathVariable("id") final java.lang.String id, @Validated @RequestBody final Product entity) throws Exception {
        return productBusiness.put(entity);
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") java.lang.String id) throws Exception {
        productBusiness.delete(id);
    }


  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public  HttpEntity<PagedResources<Product>> listParams (Pageable pageable, PagedResourcesAssembler assembler){
      return new ResponseEntity<>(assembler.toResource(productBusiness.list(pageable   )), HttpStatus.OK);    
  }

  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{instanceId}/Order")    
  public HttpEntity<PagedResources<Order>> findOrder(@PathVariable("instanceId") java.lang.String instanceId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(productBusiness.findOrder(instanceId,  pageable )), HttpStatus.OK);
  }

  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  , value="/{instanceId}/Order/{relationId}")    
  public void deleteOrder(@PathVariable("relationId") java.lang.String relationId) throws Exception {
    this.orderBusiness.delete(relationId);
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @RequestMapping(method = RequestMethod.PUT
  , value="/{instanceId}/Order/{relationId}")
  public Order putOrder(@Validated @RequestBody final Order entity, @PathVariable("relationId") java.lang.String relationId) throws Exception {
	return this.orderBusiness.put(entity);
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  , value="/{instanceId}/Order")
  public Order postOrder(@Validated @RequestBody final Order entity, @PathVariable("instanceId") java.lang.String instanceId) throws Exception {
	Product product = this.productBusiness.get(instanceId);
	entity.setProduct(product);
	return this.orderBusiness.post(entity);
  }   


  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/{instanceId}/Consumer")
  public HttpEntity<PagedResources<Consumer>> listConsumer(@PathVariable("instanceId") java.lang.String instanceId,  Pageable pageable, PagedResourcesAssembler assembler ) {
    return new ResponseEntity<>(assembler.toResource(productBusiness.listConsumer(instanceId,  pageable )), HttpStatus.OK); 
  }

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  ,value="/{instanceId}/Consumer")
  public Product postConsumer(@Validated @RequestBody final Consumer entity, @PathVariable("instanceId") java.lang.String instanceId) throws Exception {
      Order newOrder = new Order();

      Product instance = this.productBusiness.get(instanceId);

      newOrder.setConsumer(entity);
      newOrder.setProduct(instance);
      
      this.orderBusiness.post(newOrder);

      return newOrder.getProduct();
  }   

  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  ,value="/{instanceId}/Consumer/{relationId}")
  public void deleteConsumer(@PathVariable("instanceId") java.lang.String instanceId, @PathVariable("relationId") java.lang.String relationId) {
	  this.productBusiness.deleteConsumer(instanceId, relationId);
  }  



    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public Product get(@PathVariable("id") java.lang.String id) throws Exception {
        return productBusiness.get(id);
    }
}
