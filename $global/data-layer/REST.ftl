package ${restPackage};


import java.util.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.persistence.*;

import ${restPackage}.util.*;

import ${daoPackage}.*;
import ${entityPackage}.*;
import ${bussinessPackage}.*;
import ${exceptionPackage}.*;
<#if daoPackage != sessionManagerPackage>
import ${sessionManagerPackage}.*;
</#if>
import javax.servlet.http.HttpServletRequest;


/**
 * Publicando metodos de negocio via REST
 * @generated
 **/
@Path("/${clazz.name}")
@Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
public class ${clazz.name}REST implements RESTService<${clazz.name}> {
  /**
   * @generated
   */
  private SessionManager session;
  /**
   * @generated
   */  
  private ${clazz.name}Business business;
<#list clazz.allRelations as relation>
  /**
   * @generated
   */
  private ${relation.name}Business ${relation.name?uncap_first}Business;
</#list>   
  /**
   * @generated
   */  
  @Context 
  private HttpServletRequest request;

  /**
   * @generated
   */
  public ${clazz.name}REST() {
    this.session = SessionManager.getInstance();
    this.session.getEntityManager().clear();
    this.business = new ${clazz.name}Business(session);
<#list clazz.allRelations as relation>
    this.${relation.name?uncap_first}Business = new ${relation.name}Business(session);
</#list>
  }
  
  /**
   * @generated
   */  
  @POST
  public Response post(${clazz.name} entity) {
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

  /**
   * @generated
   */
  @PUT
  public Response put(${clazz.name} entity) {
    try {
	    session.begin();
	    ${clazz.name} updatedEntity = business.update(entity);
	    session.commit();
	    return Response.ok(updatedEntity).build();
    }
    
    catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }  
  }
  
  /**
   * @generated
   */  
  @PUT
  @Path("/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
  public Response putWithId(${clazz.name} entity) {
    try {
	    session.begin();
	    ${clazz.name} updatedEntity = business.update(entity);
	    session.commit();
	    return Response.ok(updatedEntity).build();
    }
    
    catch(Exception exception){
	    session.rollBack();
        throw new CustomWebApplicationException(exception);
    }  
  }
  
  /**
   * @generated
   */  
  @DELETE
  public Response delete(${clazz.name} entity) {  
		try {
			session.begin();
			${clazz.name} updatedEntity = business.update(entity);
			business.delete(updatedEntity);
			session.commit();
			return Response.ok().build();
		}

		catch (Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);
		}    
  } 
   
  /**
   * @generated
   */    
  @DELETE
  @Path("/<#list clazz.primaryKeys as field>{${field.name}}<#if field_has_next>/</#if></#list>")
  public Response delete(<#list clazz.primaryKeys as field>@PathParam("${field.name}") ${field.type} ${field.name}<#if field_has_next>, </#if></#list>) {  
		try {
			session.begin();
			if (business.deleteById(<#list clazz.primaryKeys as field>${field.name}<#if field_has_next>, </#if></#list>) > 0) {
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
  
<#list clazz.fields as field>
</#list> 
  
  
<#list clazz.oneToManyRelation as relation>
  /**
   * OneToMany Relationship GET
   * @generated
   */
  @GET
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public GenericEntity<List<${relation.clazz.name}>> find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathParam("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>@DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset) {
    return new GenericEntity<List<${relation.clazz.name}>>(this.business.find${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>limit, offset)){};
  }
  
  /**
   * OneToMany Relationship DELETE 
   * @generated
   */  
  @DELETE
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.clazz.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public Response delete${relation.relationName?cap_first}(<#list relation.clazz.primaryKeys as field>@PathParam("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
		try {
			session.begin();
			if (this.${relation.clazz.name?uncap_first}Business.deleteById(<#list relation.clazz.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) > 0) {
				session.commit();
				return Response.ok().build();
			} else {
				session.rollBack();
				return Response.status(404).build();
			}
		} catch(Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);	
		}
  }
  
  /**
   * OneToMany Relationship PUT
   * @generated
   */  
  @PUT
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.clazz.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public Response put${relation.relationName?cap_first}(${relation.clazz.name} entity, <#list relation.clazz.primaryKeys as field>@PathParam("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
		try {
			session.begin();
			${relation.clazz.name} updatedEntity = this.${relation.clazz.name?uncap_first}Business.update(entity);
			session.commit();
			return Response.ok(updatedEntity).build();
		} catch(Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);	
		}
  }  
  
  /**
   * OneToMany Relationship POST
   * @generated
   */  
  @POST
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public Response post${relation.relationName?cap_first}(${relation.clazz.name} entity, <#list clazz.primaryKeys as field>@PathParam("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
		try {
			session.begin();
			${clazz.name} ${relation.relationField.name} = this.business.findById(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);
			entity.set${relation.relationField.name?cap_first}(${relation.relationField.name});
			this.${relation.clazz.name?uncap_first}Business.save(entity);
			session.commit();
			this.${relation.clazz.name?uncap_first}Business.refresh(entity);
			return Response.ok(entity).build();
		} catch(Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);	
		}
  }   
  
</#list>    


<#list clazz.manyToManyRelation as relation>
  /**
   * ManyToMany Relationship GET
   * @generated
   */
  @GET
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public GenericEntity<List<${relation.relationClassField.type}>> list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathParam("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>@DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset) {
    return new GenericEntity<List<${relation.relationClassField.type}>>(this.business.list${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if>limit, offset)){};
  }
  
  /**
   * ManyToMany Relationship POST
   * @generated
   */  
  @POST
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}")
  public Response post${relation.relationName?cap_first}(${relation.relationClassField.type} entity, <#list clazz.primaryKeys as field>@PathParam("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
		try {
			session.begin();
			${relation.relationClassField.clazz.name} new${relation.relationClassField.clazz.name?cap_first} = new ${relation.relationClassField.clazz.name}();

			${clazz.name} instance = this.business.findById(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list>);


			new${relation.relationClassField.clazz.name?cap_first}.set${relation.relationClassField.name?cap_first}(entity);
			new${relation.relationClassField.clazz.name?cap_first}.set${relation.associativeClassField.name?cap_first}(instance);
			
			this.${relation.relationClassField.clazz.name?uncap_first}Business.save(new${relation.relationClassField.clazz.name?cap_first});
			session.commit();
			this.${relation.relationClassField.clazz.name?uncap_first}Business.refresh(new${relation.relationClassField.clazz.name?cap_first});
			return Response.ok(new${relation.relationClassField.clazz.name?cap_first}.get${relation.associativeClassField.name?cap_first}()).build();
		} catch(Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);	
		}
  }   
  
  /**
   * ManyToMany Relationship DELETE
   * @generated
   */  
  @DELETE
  @Path("/<#list clazz.primaryKeys as field>{instance${field.name?cap_first}}<#if field_has_next>/</#if></#list><#if clazz.primaryKeys?size gt 0>/</#if>${relation.relationName?cap_first}/<#list relation.relationClass.primaryKeys as field>{relation${field.name?cap_first}}<#if field_has_next>/</#if></#list>")
  public Response delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>@PathParam("instance${field.name?cap_first}") ${field.type} instance${field.name?cap_first}<#if field_has_next>, </#if></#list>, <#list relation.relationClass.primaryKeys as field>@PathParam("relation${field.name?cap_first}") ${field.type} relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) {
		try {
			session.begin();
			if (this.business.delete${relation.relationName?cap_first}(<#list clazz.primaryKeys as field>instance${field.name?cap_first}<#if field_has_next>, </#if></#list><#if clazz.primaryKeys?size gt 0>, </#if><#list relation.relationClass.primaryKeys as field>relation${field.name?cap_first}<#if field_has_next>, </#if></#list>) > 0) {
				session.commit();
				return Response.ok().build();
			} else {
				session.rollBack();
				return Response.status(404).build();
			}
		} catch(Exception exception) {
			session.rollBack();
			throw new CustomWebApplicationException(exception);	
		}
  }  
  
</#list>
  
<#list clazz.namedQueries as namedQuery><#if namedQuery.isRest()><#assign keys = namedQuery.params?keys>
  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  <#if namedQuery.queryType == "select">@GET</#if><#if namedQuery.queryType == "update">@PUT</#if><#if namedQuery.queryType == "delete">@DELETE</#if>
  <#if namedQuery.name != "list">@Path("/${namedQuery.name}<#if keys?size gt 0>/</#if><#list keys as key>{${key}}<#if key_has_next>/</#if></#list>")</#if>	
  public <#if !namedQuery.void>GenericEntity<List<${clazz.name}>><#else>Response</#if> ${namedQuery.name}(<#list keys as key>@PathParam("${key}")${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>@DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset</#if>){
      <#if !namedQuery.void>return new GenericEntity<List<${clazz.name}>>(business.${namedQuery.name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>limit, offset</#if>)){};</#if>
      <#if namedQuery.void>
      try {
      		session.begin();
      		business.${namedQuery.name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list>);
      		session.commit();
      		return Response.ok().build();
      } catch (Exception exception) {
      		session.rollBack();
      		throw new CustomWebApplicationException(exception);
      }
      </#if>

  }
  </#if>
	</#list>  
	
	<#list clazz.namedQueries as namedQuery><#assign keys = namedQuery.params?keys><#if namedQuery.isRest()>	
<#if namedQuery.name != "list">
<#if keys?size gt 0>	
  /**
   * NamedQuery ${namedQuery.name}
   * @generated
   */
  <#if namedQuery.queryType == "select">@GET</#if><#if namedQuery.queryType == "update">@PUT</#if><#if namedQuery.queryType == "delete">@DELETE</#if>
  @Path("/${namedQuery.name}")	
  public <#if !namedQuery.void>GenericEntity<List<${clazz.name}>><#else>int</#if> ${namedQuery.name}Params(<#list keys as key>@QueryParam("${key}")${namedQuery.params[key]} ${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>@DefaultValue("100") @QueryParam("limit") int limit, @DefaultValue("0") @QueryParam("offset") int offset</#if>){
      return new GenericEntity<List<${clazz.name}>>(business.${namedQuery.name}(<#list keys as key>${key}<#if key_has_next>, </#if></#list><#if !namedQuery.void><#if keys?size gt 0>, </#if>limit, offset</#if>)){};	
  }
</#if>  
</#if>
</#if>
</#list>  
}
