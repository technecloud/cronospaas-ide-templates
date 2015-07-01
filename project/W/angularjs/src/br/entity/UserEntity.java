package br.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 * Classe que representa a tabela USER
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 */
 
@Entity
@Table(name = "USER")
@NamedQueries({
        @NamedQuery(name = "UserEntity.findByPASSWORD", query = "SELECT e FROM UserEntity e where e.password like :PASSWORD"),
        @NamedQuery(name = "UserEntity.findByUSERROLES", query = "SELECT e FROM UserEntity e where e.userRoles like :USERROLES"),
        @NamedQuery(name = "UserEntity.findByEMAIL", query = "SELECT e FROM UserEntity e where e.email like :EMAIL"),
        @NamedQuery(name = "UserEntity.findByNAME", query = "SELECT e FROM UserEntity e where e.name like :NAME"),
        @NamedQuery(name = "UserEntity.findByID", query = "SELECT e FROM UserEntity e where e.id like :ID"),
})
@XmlRootElement
public class UserEntity implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 5315919335634517002l;
	
	@Column(name = "password", nullable = true, unique = false)
	private java.lang.String password;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy="user")	
	private List<UserRoleEntity> userRoles;
	
	@Column(name = "email", nullable = true, unique = false)
	private java.lang.String email;
	
	@Column(name = "name", nullable = false, unique = true)
	private java.lang.String name;
	
	@Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private java.lang.Integer id;
	
	
	/**
	 * Construtor
	 */
	public UserEntity(){
	}

	
	/**
	 * Obtém password
	 * @param password password
	 * return password
	 */
	public java.lang.String getPassword(){
		return this.password;
	}
	
	/**
	 * Define password
	 * @param password password
	 */
	public void setPassword(java.lang.String password){
		this.password = password;
	}
	
	/**
	 * Obtém userRoles
	 * @param userRoles userRoles
	 * return userRoles
	 */
	public List<UserRoleEntity> getUserRoles(){
		return this.userRoles;
	}
	
	/**
	 * Define userRoles
	 * @param userRoles userRoles
	 */
	public void setUserRoles(List<UserRoleEntity> userRoles){
		this.userRoles = userRoles;
	}
	
	/**
	 * Obtém email
	 * @param email email
	 * return email
	 */
	public java.lang.String getEmail(){
		return this.email;
	}
	
	/**
	 * Define email
	 * @param email email
	 */
	public void setEmail(java.lang.String email){
		this.email = email;
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

        result = prime * result + ((password == null) ? 0 : password.hashCode());
        //result = prime * result + ((userRoles == null) ? 0 : userRoles.hashCode());
        result = prime * result + ((email == null) ? 0 : email.hashCode());
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
	    
	    if(!(obj instanceof UserEntity))
	      return false;
	    
	    UserEntity other = (UserEntity)obj;
	    
		if(this.password == null && other.password != null)
	    	return false;
	    else if(!this.password.equals(other.password))
	     	return false;
	
		// if(this.userRoles == null && other.userRoles != null)
	 //   	return false;
	 //   else if(!this.userRoles.equals(other.userRoles))
	 //    	return false;
	
		if(this.email == null && other.email != null)
	    	return false;
	    else if(!this.email.equals(other.email))
	     	return false;
	
		if(this.name == null && other.name != null)
	    	return false;
	    else if(!this.name.equals(other.name))
	     	return false;
	
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
	

	    return true;
	    
	}
}