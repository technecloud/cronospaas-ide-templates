package br.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import javax.ws.rs.*;

/**
 * Classe que representa a tabela PERMISSION
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 */
 
@Entity
@Table(name = "PERMISSION")
@NamedQueries({
        @NamedQuery(name = "PermissionEntity.findByPATH", query = "SELECT e FROM PermissionEntity e where e.path like :PATH"),
        @NamedQuery(name = "PermissionEntity.findByID", query = "SELECT e FROM PermissionEntity e where e.id like :ID"),
        @NamedQuery(name = "PermissionEntity.findByROLE", query = "SELECT e FROM PermissionEntity e where e.role like :ROLE"),
})
@XmlRootElement
public class PermissionEntity implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -465920427622701460l;
	
	@Column(name = "verb", nullable = false)
	private java.lang.String verb;

  @Column(name = "enabled", nullable = false)
  @DefaultValue(value="true")
  @XmlSchemaType(name="boolean")
  private Boolean enabled = Boolean.TRUE;
	
	@Column(name = "path", nullable = false, unique = true)
	private java.lang.String path;
	
	@Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private java.lang.Integer id;
	
	@ManyToOne
	@JoinColumn(name="fk_role", referencedColumnName = "id", nullable=true)
	private RoleEntity role;
	
	
	/**
	 * Construtor
	 */
	public PermissionEntity(){
	}

	public PermissionEntity(String path, String verb, RoleEntity role){
	  this.path = path;
	  this.verb = verb;
	  this.role = role;
	}

  public String getVerb(){
    return verb;
  }
  public void setVerb(String verb){
    this.verb = verb;
  }
	public Boolean isEnabled(){
	  return enabled;
	}
	
	public void setEnabled(boolean enabled){
	  this.enabled = enabled;
	}

	/**
	 * Obtém path
	 * @param path path
	 * return path
	 */
	public java.lang.String getPath(){
		return this.path;
	}
	
	/**
	 * Define path
	 * @param path path
	 */
	public void setPath(java.lang.String path){
		this.path = path;
	}
	
	/**
	 * Obtém id
	 * @param id id
	 * return id
	 */
	public java.lang.Integer getId(){
		return this.id;
	}
	
	/**
	 * Define id
	 * @param id id
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	
	/**
	 * Obtém role
	 * @param role role
	 * return role
	 */
	public RoleEntity getRole(){
		return this.role;
	}
	
	/**
	 * Define role
	 * @param role role
	 */
	public void setRole(RoleEntity role){
		this.role = role;
	}
	
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((path == null) ? 0 : path.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((role == null) ? 0 : role.hashCode());

        return result;
    }
	
	@Override
  	public boolean equals(Object obj) {
    
	    if(this == obj)
	      return true;
	    
	    if(obj == null)
	      return false;
	    
	    if(!(obj instanceof PermissionEntity))
	      return false;
	    
	    PermissionEntity other = (PermissionEntity)obj;
	    
		if(this.path == null && other.path != null)
	    	return false;
	    else if(!this.path.equals(other.path))
	     	return false;

		if(this.enabled == null && other.enabled != null)
	    	return false;
	    else if(!this.enabled.equals(other.enabled))
	     	return false;
	
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
		if(this.role == null && other.role != null)
	    	return false;
	    else if(!this.role.equals(other.role))
	     	return false;

	    return true;
	    
	}
	
	public String toString(){
	  return String.format("id:%s, path:%s, enabled:%s", id,path,enabled);
	}
	
}