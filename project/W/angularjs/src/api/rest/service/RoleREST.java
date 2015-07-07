package api.rest.service;

/**
 * REST.ftl - Publicando metodos de negocio via REST
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 **/

import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.persistence.*;

import api.rest.service.util.*;

import br.entity.*;
import br.business.*;
import br.dao.*;


import api.rest.service.exceptions.*;
import api.rest.service.util.*;


@Path("/Role")
@Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
public class RoleREST implements RESTService<RoleEntity> {

  private SessionManager session;
  private RoleBusiness business;

  public RoleREST() {
    this.session = SessionManager.getInstance();
    this.business = new RoleBusiness(session);
  }

  @GET
  public Response get(@QueryParam("page")Integer page, @QueryParam("size")Integer size) {
    List<RoleEntity> entities = new ArrayList<>();
	try{
	
	    if(page == null || size == null)
	      entities = business.findAll();
	    else
	      entities = business.findAll(page,size);
	
	    GenericEntity entity = new GenericEntity<List<RoleEntity>>(entities) {};
	    return Response.ok(entity).build();
	    
    }catch(Exception exception){
      throw new CustomWebApplicationException(exception);
    }
      
  }

  @GET
  @Path("{id}")
  public Response getById(@PathParam("id")String sid) {
    try{
      Integer id = Integer.parseInt(sid);
      RoleEntity entity = business.getById(id);
      return Response.ok(entity).build();
    }catch(Exception exception){
      throw new CustomWebApplicationException(exception);
    }
  }
  
  @GET
  @Path("/{attributeName}/{value}")
  public Response getByAttributeName(@PathParam("attributeName")String attributeName, @PathParam("value")String value) {
    try {
      String formattedAttributeName = attributeName.toUpperCase();
      Query query = session.getEntityManager().createNamedQuery("RoleEntity.findBy" + formattedAttributeName);
      query.setParameter(formattedAttributeName, value);
      List<RoleEntity> entities = (List<RoleEntity>)query.getResultList();
      GenericEntity<List<RoleEntity>> entity = new GenericEntity<List<RoleEntity>>(entities) {};
      return Response.ok(entity).build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }


  @POST
  public Response post(RoleEntity entity) {
    try{
	    session.begin();
	    business.save(entity);
	    session.commit();
	    return Response.ok(entity).build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }

  @PUT
  @Path("{id}")
  public Response putWithId(@PathParam("id")String sid, RoleEntity entity) {
    return put(entity);
  }

  @PUT
  public Response put(RoleEntity entity) {
    try{
	    session.begin();
	    business.update(entity);
	    session.commit();
	    return Response.ok().build();
    }catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }
  }

  @DELETE
  @Path("{id}")
  public Response delete(@PathParam("id")String sid) {
    try{
	    Integer id = Integer.parseInt(sid);
	    session.begin();
	    RoleEntity entity = business.getById(id);
	    RoleEntity managedEntity = this.session.getEntityManager().getReference(RoleEntity.class, entity.getId());
	    business.delete(managedEntity);
	    session.commit();
	    return Response.ok().build();
    }catch(Exception exception){
	    session.rollBack();
	    throw new CustomWebApplicationException(exception);
    }
  }
  
  @OPTIONS
  @Produces(MediaType.APPLICATION_XML)
  public Response options() {
    try{
      return Response.ok().entity(business.options(RoleEntity.class)).build();
    }catch(Exception exception){
      session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }
  
}
