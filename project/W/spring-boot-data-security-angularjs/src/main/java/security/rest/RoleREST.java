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



@RestController
@RequestMapping(value = "/api/rest/security/Role")
public class RoleREST {


    @Autowired
    @Qualifier("RoleBusiness")
    private RoleBusiness roleBusiness;

    // CRUD
    @RequestMapping(method = RequestMethod.POST)
    public Role post(@Validated @RequestBody final Role entity) throws Exception {
        roleBusiness.getRepository().save(entity);
        return entity;
    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Role> get(@RequestParam(defaultValue = "100", required = false) Integer limit, @RequestParam(defaultValue = "0", required = false) Integer offset) throws Exception {
        Page<Role> pages = roleBusiness.getRepository().findAll(new PageRequest(offset, limit));
        return pages.getContent();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public ResponseEntity<?> get(@PathVariable("id") final String id) throws Exception {
        Role entity = roleBusiness.getRepository().findOne(id);
        return entity == null ? ResponseEntity.status(404).build() : ResponseEntity.ok(entity);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> put(@Validated @RequestBody final Role entity) throws Exception {
        return ResponseEntity.ok( roleBusiness.getRepository().saveAndFlush(entity));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/{id}")
    public Role put(@PathVariable("id") final String id, @Validated @RequestBody final Role entity) throws Exception {
        return roleBusiness.getRepository().saveAndFlush(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public void delete(@Validated @RequestBody final Role entity) throws Exception {
         roleBusiness.getRepository().delete(entity);
    }

    @RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
    public void delete(@PathVariable("id") final String id) throws Exception {
         roleBusiness.getRepository().delete(id);
    }

// NamedQueries

}