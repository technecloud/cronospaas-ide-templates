package br.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import javax.ws.rs.*;

/**
 * Classe que representa a tabela ROLE
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 */
 
@Entity
@Table(name = "ROLE")
@NamedQueries({
        // @NamedQuery(name = "RoleEntity.findByPERMISSIONS", query = "SELECT e FROM RoleEntity e where e.permissions like :PERMISSIONS"),
        // @NamedQuery(name = "RoleEntity.findByUSERROLES", query = "SELECT e FROM RoleEntity e where e.userRoles like :USERROLES"),
        @NamedQuery(name = "RoleEntity.findByNAME", query = "SELECT e FROM RoleEntity e where e.name like :NAME"),
        @NamedQuery(name = "RoleEntity.findByID", query = "SELECT e FROM RoleEntity e where e.id like :ID"),
})
@XmlRootElement
@XmlType(propOrder = {"id", "name", "enabled"})
public class RoleEntity implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -1381576613383169882l;
	
	@Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private java.lang.Integer id;


	@Column(name = "name", nullable = true, unique = true)
	private java.lang.String name;
	
  @Column(name = "enabled", nullable = false)
  @DefaultValue(value="true")
  @XmlSchemaType(name="boolean")
  private Boolean enabled = Boolean.TRUE;
	
	
	/**
	 * Construtor
	 */
	public RoleEntity(){
	}

	public RoleEntity(String name){
	  this.name = name;
	}
	
	public Boolean isEnabled(){
	  return enabled;
	}
	
	public void setEnabled(boolean enabled){
	  this.enabled = enabled;
	}

	
	/**
	 * Obtém name
	 * @param name name
	 * return name
	 */
	public java.lang.String getName(){
		return this.name;
	}
	
	/**
	 * Define name
	 * @param name name
	 */
	public void setName(java.lang.String name){
		this.name = name;
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
	
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

//        result = prime * result + ((permissions == null) ? 0 : permissions.hashCode());
        //result = prime * result + ((userRoles == null) ? 0 : userRoles.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());

        return result;
    }
	
	@Override
  	public boolean equals(Object obj) {
    
	    if(this == obj)
	      return true;
	    
	    if(obj == null)
	      return false;
	    
	    if(!(obj instanceof RoleEntity))
	      return false;
	    
	    RoleEntity other = (RoleEntity)obj;

	
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
		if(this.name == null && other.name != null)
	    	return false;
	    else if(!this.name.equals(other.name))
	     	return false;
	

	    return true;
	    
	}
}