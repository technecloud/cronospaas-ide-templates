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
 * Controller para expor serviços REST de Consumer
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/Consumer")
public class ConsumerREST {

    /**
     * Classe de negócio para manipulação de dados
     * 
     * @generated
     */
    @Autowired
    @Qualifier("ConsumerBusiness")
    private ConsumerBusiness consumerBusiness;

    /**
     * @generated
     */
      @Autowired
      @Qualifier("ProductBusiness")
      private ProductBusiness productBusiness;
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
    public Consumer post(@Validated @RequestBody final Consumer entity) throws Exception {
        return consumerBusiness.post(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public Consumer put(@Validated @RequestBody final Consumer entity) throws Exception {
        return consumerBusiness.put(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Consumer put(@PathVariable("id") final java.lang.String id, @Validated @RequestBody final Consumer entity) throws Exception {
        return consumerBusiness.put(entity);
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") java.lang.String id) throws Exception {
        consumerBusiness.delete(id);
    }


  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public  HttpEntity<PagedResources<Consumer>> listParams (Pageable pageable, PagedResourcesAssembler assembler){
      return new ResponseEntity<>(assembler.toResource(consumerBusiness.list(pageable   )), HttpStatus.OK);    
  }

  /**
   * OneToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/{instanceId}/Order")    
  public HttpEntity<PagedResources<Order>> findOrder(@PathVariable("instanceId") java.lang.String instanceId, Pageable pageable, PagedResourcesAssembler assembler) {
    return new ResponseEntity<>(assembler.toResource(consumerBusiness.findOrder(instanceId,  pageable )), HttpStatus.OK);
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
	Consumer consumer = this.consumerBusiness.get(instanceId);
	entity.setConsumer(consumer);
	return this.orderBusiness.post(entity);
  }   


  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  ,value="/{instanceId}/Product")
  public HttpEntity<PagedResources<Product>> listProduct(@PathVariable("instanceId") java.lang.String instanceId,  Pageable pageable, PagedResourcesAssembler assembler ) {
    return new ResponseEntity<>(assembler.toResource(consumerBusiness.listProduct(instanceId,  pageable )), HttpStatus.OK); 
  }

  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @RequestMapping(method = RequestMethod.POST
  ,value="/{instanceId}/Product")
  public Consumer postProduct(@Validated @RequestBody final Product entity, @PathVariable("instanceId") java.lang.String instanceId) throws Exception {
      Order newOrder = new Order();

      Consumer instance = this.consumerBusiness.get(instanceId);

      newOrder.setProduct(entity);
      newOrder.setConsumer(instance);
      
      this.orderBusiness.post(newOrder);

      return newOrder.getConsumer();
  }   

  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @RequestMapping(method = RequestMethod.DELETE
  ,value="/{instanceId}/Product/{relationId}")
  public void deleteProduct(@PathVariable("instanceId") java.lang.String instanceId, @PathVariable("relationId") java.lang.String relationId) {
	  this.consumerBusiness.deleteProduct(instanceId, relationId);
  }  



    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public Consumer get(@PathVariable("id") java.lang.String id) throws Exception {
        return consumerBusiness.get(id);
    }
}
