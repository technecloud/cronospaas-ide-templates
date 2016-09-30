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
 * Controller para expor serviços REST de Order
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/Order")
public class OrderREST {

    /**
     * Classe de negócio para manipulação de dados
     * 
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
    public Order post(@Validated @RequestBody final Order entity) throws Exception {
        return orderBusiness.post(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public Order put(@Validated @RequestBody final Order entity) throws Exception {
        return orderBusiness.put(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Order put(@PathVariable("id") final java.lang.String id, @Validated @RequestBody final Order entity) throws Exception {
        return orderBusiness.put(entity);
    }

    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") java.lang.String id) throws Exception {
        orderBusiness.delete(id);
    }


  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public  HttpEntity<PagedResources<Order>> listParams (Pageable pageable, PagedResourcesAssembler assembler){
      return new ResponseEntity<>(assembler.toResource(orderBusiness.list(pageable   )), HttpStatus.OK);    
  }



    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public Order get(@PathVariable("id") java.lang.String id) throws Exception {
        return orderBusiness.get(id);
    }
}
