package security.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 * Classe que representa a tabela PERMISSION
 * @generated
 */
@Entity
@Table(name = "\"PERMISSION\"")
@NamedQueries({
        @NamedQuery(name = "permissionList", query = "select p from Permission p")
})
@XmlRootElement
public class Permission implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = 1475848671l;
	
	/**
	 * @generated
	 */
	@Column(name = "response", nullable = true, unique = true)
	private java.lang.Integer response;
	
	/**
	 * @generated
	 */
	@Column(name = "path", nullable = false, unique = false)
	private java.lang.String path;
	
	/**
	 * @generated
	 */
	@Column(name = "verb", nullable = false, unique = false)
	private java.lang.String verb;
	
	/**
	 * @generated
	 */
	@Id
    
	@Column(name = "id")
	private java.lang.String id = UUID.randomUUID().toString().toUpperCase();
	
	/**
	 * @generated
	 */
	@Column(name = "priority", nullable = false, unique = false)
	private java.lang.Integer priority;
	
	/**
	 * @generated
	 */
	@Column(name = "exclude", nullable = true, unique = false)
	private java.lang.String exclude;
	
	/**
	 * @generated
	 */
	@Column(name = "enabled", nullable = true, unique = false)
	private boolean enabled;
	
	/**
	 * @generated
	 */
	@ManyToOne
	@JoinColumn(name="fk_role", referencedColumnName = "id")
	private Role role;
	
	
	/**
	 * Construtor
	 * @generated
	 */
	public Permission(){
	}

	
	/**
	 * Obtém response
	 * @param response response
	 * return response
	 * @generated
	 */
	public java.lang.Integer getResponse(){
		return this.response;
	}
	
	/**
	 * Define response
	 * @param response response
	 * @generated
	 */
	public void setResponse(java.lang.Integer response){
		this.response = response;
	}
	
	/**
	 * Obtém path
	 * @param path path
	 * return path
	 * @generated
	 */
	public java.lang.String getPath(){
		return this.path;
	}
	
	/**
	 * Define path
	 * @param path path
	 * @generated
	 */
	public void setPath(java.lang.String path){
		this.path = path;
	}
	
	/**
	 * Obtém verb
	 * @param verb verb
	 * return verb
	 * @generated
	 */
	public java.lang.String getVerb(){
		return this.verb;
	}
	
	/**
	 * Define verb
	 * @param verb verb
	 * @generated
	 */
	public void setVerb(java.lang.String verb){
		this.verb = verb;
	}
	
	/**
	 * Obtém id
	 * @param id id
	 * return id
	 * @generated
	 */
	public java.lang.String getId(){
		return this.id;
	}
	
	/**
	 * Define id
	 * @param id id
	 * @generated
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	
	/**
	 * Obtém priority
	 * @param priority priority
	 * return priority
	 * @generated
	 */
	public java.lang.Integer getPriority(){
		return this.priority;
	}
	
	/**
	 * Define priority
	 * @param priority priority
	 * @generated
	 */
	public void setPriority(java.lang.Integer priority){
		this.priority = priority;
	}
	
	/**
	 * Obtém exclude
	 * @param exclude exclude
	 * return exclude
	 * @generated
	 */
	public java.lang.String getExclude(){
		return this.exclude;
	}
	
	/**
	 * Define exclude
	 * @param exclude exclude
	 * @generated
	 */
	public void setExclude(java.lang.String exclude){
		this.exclude = exclude;
	}
	
	/**
	 * Obtém enabled
	 * @param enabled enabled
	 * return enabled
	 * @generated
	 */
	public boolean getEnabled(){
		return this.enabled;
	}
	
	/**
	 * Define enabled
	 * @param enabled enabled
	 * @generated
	 */
	public void setEnabled(boolean enabled){
		this.enabled = enabled;
	}
	
	/**
	 * Obtém role
	 * @param role role
	 * return role
	 * @generated
	 */
	public Role getRole(){
		return this.role;
	}
	
	/**
	 * Define role
	 * @param role role
	 * @generated
	 */
	public void setRole(Role role){
		this.role = role;
	}
	
	/**
	 * @generated
	 */
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((response == null) ? 0 : response.hashCode());
        result = prime * result + ((path == null) ? 0 : path.hashCode());
        result = prime * result + ((verb == null) ? 0 : verb.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((priority == null) ? 0 : priority.hashCode());
        result = prime * result + ((exclude == null) ? 0 : exclude.hashCode());
        result = prime * result + ((role == null) ? 0 : role.hashCode());

        return result;
    }
	
	/**
	 * @generated
	 */	
	@Override
  	public boolean equals(Object obj) {
    
	    if(this == obj)
	      return true;
	    
	    if(obj == null)
	      return false;
	    
	    if(!(obj instanceof Permission))
	      return false;
	    
	    Permission other = (Permission)obj;
	    
		if(this.response == null && other.response != null)
	    	return false;
	    else if(!this.response.equals(other.response))
	     	return false;
	
		if(this.path == null && other.path != null)
	    	return false;
	    else if(!this.path.equals(other.path))
	     	return false;
	
		if(this.verb == null && other.verb != null)
	    	return false;
	    else if(!this.verb.equals(other.verb))
	     	return false;
	
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
		if(this.priority == null && other.priority != null)
	    	return false;
	    else if(!this.priority.equals(other.priority))
	     	return false;
	
		if(this.exclude == null && other.exclude != null)
	    	return false;
	    else if(!this.exclude.equals(other.exclude))
	     	return false;
	
		if(this.enabled != other.enabled)
			return false;
	
		if(this.role == null && other.role != null)
	    	return false;
	    else if(!this.role.equals(other.role))
	     	return false;
	
	

	    return true;
	    
	}
}