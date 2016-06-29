package diagram.contact.rest;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;

import org.springframework.http.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import diagram.contact.entity.*;
import diagram.contact.business.*;


/**
 * Controller para expor serviços REST de Contact
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/rest/diagram/contact/Contact")
public class ContactREST {

    /**
     * Classe de negócio para manipulação de dados
     * 
     * @generated
     */
    @Autowired
    @Qualifier("ContactBusiness")
    private ContactBusiness contactBusiness;


    /**
     * Serviço exposto para novo registro de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.POST)
    public Contact post(@Validated @RequestBody final Contact entity) throws Exception {
        contactBusiness.post(entity);
        return entity;
    }

    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public List<Contact> get(@PathVariable("id") java.lang.String id) throws Exception {
        Contact entity = contactBusiness.get(id);
        return entity == null ? Collections.emptyList() : Arrays.asList(entity);
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final Contact entity) throws Exception {
        return ResponseEntity.ok(contactBusiness.put(entity));
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Contact put(@PathVariable("id") final java.lang.String id, @Validated @RequestBody final Contact entity) throws Exception {
        return contactBusiness.put(entity);
    }


    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") java.lang.String id) throws Exception {
        contactBusiness.delete(id);
    }


  /**
   * NamedQuery list
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  )    
  public  List<Contact> listParams (@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return contactBusiness.list(new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery listByTitle
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/listByTitle/{title}")    
  public  List<Contact> listByTitleParams (@PathVariable("title") java.lang.String title, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return contactBusiness.listByTitle(title, new PageRequest(offset, limit)   );  
  }




}
