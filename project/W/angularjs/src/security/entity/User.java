/**
 * @modified 
 */
package security.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import util.Hash;

/**
 * Classe que representa a tabela USER
 * @generated
 */
@Entity
@Table(name = "\"USER\"")
@NamedQueries({
        @NamedQuery(name = "userList", query = "select u from User u"),
        @NamedQuery(name = "userFindByRole", query = "select u.user from UserRole u where u.role.id = :roleid"),
        @NamedQuery(name = "userFindByLogin", query = "select u from User u where u.login = :login")
})
@XmlRootElement
public class User implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = 2648042l;
	
	private static final String MASKED_PASSWORD = "******";
	
	/**
	 * @generated
	 */
	@Column(name = "email", nullable = true, unique = false)
	private java.lang.String email;
	
	/**
	 * @generated
	 */
	@Column(name = "name", nullable = false, unique = false)
	private java.lang.String name;
	
	/**
	 * @generated
	 */
	@Id
    
	@Column(name = "id")
	private java.lang.String id = UUID.randomUUID().toString().toUpperCase();
	
	/**
	 * @generated
	 */
	@Column(name = "login", nullable = false, unique = true)
	private java.lang.String login;
	
	/**
	 * @generated
	 */
	@Column(name = "picture", nullable = true, unique = false)
	private java.lang.String picture;
	
	/**
	 * @generated
	 */
	@Column(name = "password", nullable = false, unique = false)
	private java.lang.String password;
	
	
	/**
	 * Construtor
	 * @generated
	 */
	public User(){
  }

	
	/**
	 * Obtém email
	 * @param email email
	 * return email
	 * @generated
	 */
	public java.lang.String getEmail(){
    return this.email;
  }
	
	/**
	 * Define email
	 * @param email email
	 * @generated
	 */
	public void setEmail(java.lang.String email){
    this.email = email;
  }
	
	/**
	 * Obtém name
	 * @param name name
	 * return name
	 * @generated
	 */
	public java.lang.String getName(){
    return this.name;
  }
	
	/**
	 * Define name
	 * @param name name
	 * @generated
	 */
	public void setName(java.lang.String name){
    this.name = name;
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
	 * Obtém login
	 * @param login login
	 * return login
	 * @generated
	 */
	public java.lang.String getLogin(){
    return this.login;
  }
	
	/**
	 * Define login
	 * @param login login
	 * @generated
	 */
	public void setLogin(java.lang.String login){
    this.login = login;
  }
	
	/**
	 * Obtém picture
	 * @param picture picture
	 * return picture
	 * @generated
	 */
	public java.lang.String getPicture(){
    return this.picture;
  }
	
	/**
	 * Define picture
	 * @param picture picture
	 * @generated
	 */
	public void setPicture(java.lang.String picture){
    this.picture = picture;
  }
	
	/**
	 * Obtém password
	 * @param password password
	 * return password
	 */
	public java.lang.String getEncodedPassword(){
    return this.password;
  }
  
  /**
	 * Obtém password
	 * @param password password
	 * return password
	 */
	public java.lang.String getPassword(){
    return MASKED_PASSWORD;
  }
	
	/**
	 * Define password
	 * @param password password
	 */
	public void setPassword(java.lang.String password){
	  if (!MASKED_PASSWORD.equals(password))
		  this.password = Hash.md5(password);
	}
	
	/**
	 * @generated
	 */
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((email == null) ? 0 : email.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((login == null) ? 0 : login.hashCode());
        result = prime * result + ((picture == null) ? 0 : picture.hashCode());
        result = prime * result + ((password == null) ? 0 : password.hashCode());

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
      
      if(!(obj instanceof User))
        return false;
      
      User other = (User)obj;
      
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
  
    if(this.login == null && other.login != null)
      	return false;
      else if(!this.login.equals(other.login))
       	return false;
  
    if(this.picture == null && other.picture != null)
      	return false;
      else if(!this.picture.equals(other.picture))
       	return false;
  
    if(this.password == null && other.password != null)
      	return false;
      else if(!this.password.equals(other.password))
       	return false;
  
  

      return true;
      
  }
}