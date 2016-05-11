package sample.pessoa.rest;

import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.*;


import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;

import sample.pessoa.entity.*;
import sample.pessoa.business.*;



@RestController
@RequestMapping(value = "/api/rest/sample/pessoa/Pessoa")
public class PessoaREST {


    @Autowired
    @Qualifier("PessoaBusiness")
    private PessoaBusiness pessoaBusiness;

    // CRUD
    @RequestMapping(method = RequestMethod.POST)
    public Pessoa post(@Validated @RequestBody final Pessoa entity) throws Exception {
        pessoaBusiness.getRepository().save(entity);
        return entity;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Pessoa> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<Pessoa> pages = pessoaBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        Pessoa entity = pessoaBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final Pessoa entity) throws Exception {
        return ResponseEntity.ok( pessoaBusiness.getRepository().saveAndFlush(entity));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Pessoa put(@PathVariable("id") final String id, @Validated @RequestBody final Pessoa entity) throws Exception {
        return pessoaBusiness.getRepository().saveAndFlush(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final Pessoa entity) throws Exception {
         pessoaBusiness.getRepository().delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         pessoaBusiness.getRepository().delete(id);
    }

// NamedQueries

  /**
   * NamedQuery listByNome
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/listByNome")    
  public  List<Pessoa> listByNomeParams (@RequestParam("nome") java.lang.String nome, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return pessoaBusiness.getRepository().listByNome(nome, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery listBySobrenome
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/listBySobrenome")    
  public  List<Pessoa> listBySobrenomeParams (@RequestParam("sobrenome") java.lang.String sobrenome, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return pessoaBusiness.getRepository().listBySobrenome(sobrenome, new PageRequest(offset, limit)   );  
  }

  /**
   * NamedQuery listByCidade
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/listByCidade")    
  public  List<Pessoa> listByCidadeParams (@RequestParam("id") java.lang.String id, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return pessoaBusiness.getRepository().listByCidade(id, new PageRequest(offset, limit)   );  
  }

}