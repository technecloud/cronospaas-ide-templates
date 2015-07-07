package br.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 * Classe que representa a tabela USERROLE
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 */
 
@Entity
@Table(name = "USERROLE")
@NamedQueries({
        @NamedQuery(name = "UserRoleEntity.findByID", query = "SELECT e FROM UserRoleEntity e where e.id like :ID"),
        @NamedQuery(name = "UserRoleEntity.findByROLE", query = "SELECT e FROM UserRoleEntity e where e.role like :ROLE"),
        @NamedQuery(name = "UserRoleEntity.findByUSER", query = "SELECT e FROM UserRoleEntity e where e.user like :USER"),
})
@XmlRootElement
public class UserRoleEntity implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -5904512891472805995l;
	
	@Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_userrole")
	private java.lang.Integer id;
	
	@ManyToOne
	@JoinColumn(name="fk_role", referencedColumnName = "id", nullable=false)
	private RoleEntity role;
	
	@ManyToOne
	@JoinColumn(name="fk_user", referencedColumnName = "id", nullable=false)
	private UserEntity user;
	
	
	/**
	 * Construtor
	 */
	public UserRoleEntity(){
	}

	public UserRoleEntity(UserEntity user, RoleEntity role){
	  this.user = user;
	  this.role = role;
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
	
	/**
	 * Obtém user
	 * @param user user
	 * return user
	 */
	public UserEntity getUser(){
		return this.user;
	}
	
	/**
	 * Define user
	 * @param user user
	 */
	public void setUser(UserEntity user){
		this.user = user;
	}
	
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((id == null) ? 0 : id.hashCode());
        // result = prime * result + ((role == null) ? 0 : role.hashCode());
        // result = prime * result + ((user == null) ? 0 : user.hashCode());

        return result;
    }
	
	@Override
  	public boolean equals(Object obj) {
    
	    if(this == obj)
	      return true;
	    
	    if(obj == null)
	      return false;
	    
	    if(!(obj instanceof UserRoleEntity))
	      return false;
	    
	    UserRoleEntity other = (UserRoleEntity)obj;
	    
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
		if(this.role == null && other.role != null)
	    	return false;
	    else if(!this.role.equals(other.role))
	     	return false;
	
		if(this.user == null && other.user != null)
	    	return false;
	    else if(!this.user.equals(other.user))
	     	return false;
	
	

	    return true;
	    
	}
}