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
@RequestMapping(value = "/api/rest/sample/pessoa/Cidade")
public class CidadeREST {


    @Autowired
    @Qualifier("CidadeBusiness")
    private CidadeBusiness cidadeBusiness;

    // CRUD
    @RequestMapping(method = RequestMethod.POST)
    public Cidade post(@Validated @RequestBody final Cidade entity) throws Exception {
        cidadeBusiness.getRepository().save(entity);
        return entity;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Cidade> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<Cidade> pages = cidadeBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        Cidade entity = cidadeBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final Cidade entity) throws Exception {
        return ResponseEntity.ok( cidadeBusiness.getRepository().saveAndFlush(entity));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Cidade put(@PathVariable("id") final String id, @Validated @RequestBody final Cidade entity) throws Exception {
        return cidadeBusiness.getRepository().saveAndFlush(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final Cidade entity) throws Exception {
         cidadeBusiness.getRepository().delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         cidadeBusiness.getRepository().delete(id);
    }

// NamedQueries

  /**
   * NamedQuery listByNome
   * @generated
   */
  @RequestMapping(method = RequestMethod.GET
  , value="/listByNome")    
  public  List<Cidade> listByNomeParams (@RequestParam("nome") java.lang.String nome, @RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset){
      return cidadeBusiness.getRepository().listByNome(nome, new PageRequest(offset, limit)   );  
  }

}