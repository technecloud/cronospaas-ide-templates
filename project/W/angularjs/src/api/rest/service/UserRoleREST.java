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


@Path("/UserRole")
@Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
public class UserRoleREST implements RESTService<UserRoleEntity> {

  private SessionManager session;
  private UserRoleBusiness business;

  public UserRoleREST() {
    this.session = SessionManager.getInstance();
    this.business = new UserRoleBusiness(session);
  }

  @GET
  public Response get(@QueryParam("page")Integer page, @QueryParam("size")Integer size) {
    List<UserRoleEntity> entities = new ArrayList<>();
	try{
	
	    if(page == null || size == null)
	      entities = business.findAll();
	    else
	      entities = business.findAll(page,size);
	
	    GenericEntity entity = new GenericEntity<List<UserRoleEntity>>(entities) {};
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
      UserRoleEntity entity = business.getById(id);
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
      Query query = session.getEntityManager().createNamedQuery("UserRoleEntity.findBy" + formattedAttributeName);
      query.setParameter(formattedAttributeName, value);
      List<UserRoleEntity> entities = (List<UserRoleEntity>)query.getResultList();
      GenericEntity<List<UserRoleEntity>> entity = new GenericEntity<List<UserRoleEntity>>(entities) {};
      return Response.ok(entity).build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }

  @POST
  @Consumes("application/x-www-form-urlencoded")
  public Response post(@FormParam("userId") Integer userId, @FormParam("roleId") Integer roleId) {
    try {
      
      System.out.println("userId:" + userId + ", roleId:" + roleId);
      
	    session.begin();

	    UserEntity managedUserEntity = this.session.getEntityManager().getReference(UserEntity.class, userId);
	    RoleEntity managedRoleEntity = this.session.getEntityManager().getReference(RoleEntity.class, roleId);

	    
	    UserRoleEntity entity = new UserRoleEntity();
	    entity.setUser(managedUserEntity);
	    entity.setRole(managedRoleEntity);
	    
	    business.save(entity);
	    session.commit();
      return Response.ok(entity).build();
    }catch(Exception exception){
	    session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }


  @POST
  public Response post(UserRoleEntity entity) {
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
  public Response putWithId(@PathParam("id")String sid, UserRoleEntity entity) {
    return put(entity);
  }

  @PUT
  public Response put(UserRoleEntity entity) {
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
	    UserRoleEntity entity = business.getById(id);
	    UserRoleEntity managedEntity = this.session.getEntityManager().getReference(UserRoleEntity.class, entity.getId());
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
      return Response.ok().entity(business.options(UserRoleEntity.class)).build();
    }catch(Exception exception){
      session.rollBack();
      throw new CustomWebApplicationException(exception);
    }
  }
  
}
