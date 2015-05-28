package api.rest.service;

/**
 * REST.ftl - Publicando metodos de negocio via REST
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-05-27
 *
 **/

import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.persistence.*;

import api.rest.util.*;

import br.com.entity.*;
import br.com.business.*;

import api.rest.exceptions.*;


@Path("/Pessoa")
@Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@SuppressWarnings("unchecked")
public class PessoaREST {

  private SessionManager session;
  private PessoaBusiness business;

  public PessoaREST() {
    this.session = SessionManager.getInstance();
    this.business = new PessoaBusiness(session);
  }

  @GET
  public Response get(@QueryParam("page")Integer page, @QueryParam("size")Integer size) {
    List<PessoaEntity> entities = new ArrayList<>();
	try{
	
	    if(page == null || size == null)
	      entities = business.findAll();
	    else
	      entities = business.findAll(page,size);
	
	    GenericEntity entity = new GenericEntity<List<PessoaEntity>>(entities) {};
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
      PessoaEntity entity = business.getById(id);
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
      Query query = session.getEntityManager().createNamedQuery("PessoaEntity.findBy" + formattedAttributeName);
      query.setParameter(formattedAttributeName, value);
      List<PessoaEntity> entities = (List<PessoaEntity>)query.getResultList();
      GenericEntity<List<PessoaEntity>> entity = new GenericEntity<List<PessoaEntity>>(entities) {};
      return Response.ok(entity).build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }


  @POST
  public Response post(PessoaEntity entity) {
    try{
	    session.begin();
	    business.save(entity);
	    session.commit();
	    return Response.ok().build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }

  @PUT
  @Path("{id}")
  public Response putWithId(@PathParam("id")String sid, PessoaEntity entity) {
    return put(entity);
  }
  
  @PUT
  public Response put(PessoaEntity entity) {
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
	    PessoaEntity entity = business.getById(id);
	    PessoaEntity managedEntity = this.session.getEntityManager().getReference(PessoaEntity.class, entity.getId());
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
      return Response.ok().entity(business.options(PessoaEntity.class)).build();
    }catch(Exception exception){
      session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }
  
}
