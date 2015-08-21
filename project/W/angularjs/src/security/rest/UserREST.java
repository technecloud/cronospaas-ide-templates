package security.rest;

/**
 * REST.ftl - Publicando metodos de negocio via REST
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-07-29
 *
 **/

import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.persistence.*;

import security.rest.util.*;

import security.dao.*;
import security.entity.*;
import security.business.*;
import javax.servlet.http.HttpServletRequest;

import security.rest.exceptions.*;


@Path("/User")
@Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
public class UserREST implements RESTService<User> {

  private SessionManager session;
  private UserBusiness business;
  
  @Context 
  private HttpServletRequest request;

  public UserREST() {
    this.session = SessionManager.getInstance();
    this.business = new UserBusiness(session);
  }
  
  @POST
  public Response post(User entity) {
    try {
	    session.begin();
	    business.save(entity);
	    session.commit();
	    business.refresh(entity);
	    return Response.ok(entity).build();
    }
    
    catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }
  }

  @PUT
  public Response put(User entity) {
    try {
	    session.begin();
	    User updatedEntity = business.update(entity);
	    session.commit();
	    return Response.ok(updatedEntity).build();
    }
    
    catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }  
  }
  
  @PUT
  @Path("/{id}")
  public Response put2(User entity) {
    try {
	    session.begin();
	    User updatedEntity = business.update(entity);
	    session.commit();
	    return Response.ok(updatedEntity).build();
    }
    
    catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }  
  }
  
  @DELETE
  public Response delete(User entity) {  
		try {
			session.begin();
			User updatedEntity = business.update(entity);
			business.delete(updatedEntity);
			session.commit();
			return Response.ok().build();
		}

		catch (Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);
		}    
  } 
    
  @DELETE
  @Path("/{id}")
  public Response delete(@PathParam("id") java.lang.String id) {  
		try {
			session.begin();
			if (business.deleteById(id) > 0) {
				session.commit();
				return Response.ok().build();
			} else {
				return Response.status(404).build();
			}
		}

		catch (Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);
		}    
  }
  
  @GET
  	
  public List<User> list(@DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset){
      return business.list(limit, offset);
  }
  @GET
  @Path("/findByRole/{roleid}")	
  public List<User> findByRole(@PathParam("roleid")java.lang.String roleid, @DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset){
      return business.findByRole(roleid, limit, offset);
  }
	
  @GET
  @Path("/findByRole")	
  public List<User> findByRoleParams(@QueryParam("roleid")java.lang.String roleid, @DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset){
      return business.findByRole(roleid, limit, offset);	
  }
}
