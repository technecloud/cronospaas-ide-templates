package diagram.contact.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Classe que representa a tabela CONTACT
 * @generated
 */
@Entity
@Table(name = "\"CONTACT\""


)
@XmlRootElement
public class Contact implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = -1678785505l;
	
	/**
	 * @generated
	 */
	@Id
    
	@Column(name = "id")
	private java.lang.String id = UUID.randomUUID().toString().toUpperCase();
	
	/**
	 * @generated
	 */
	@Column(name = "title", nullable = false, unique = false)
	private java.lang.String title;
	
	/**
	 * @generated
	 */
	@Column(name = "number", nullable = false, unique = false)
	private java.lang.String number;
	
	/**
	 * @generated
	 */
	@Column(name = "avatar", nullable = false, unique = false)
	private java.lang.String avatar;
	
	
	/**
	 * Construtor
	 * @generated
	 */
	public Contact(){
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
	public Contact setId(java.lang.String id){
		this.id = id;
		return this;
	}
	
	/**
	 * Obtém title
	 * @param title title
	 * return title
	 * @generated
	 */
	public java.lang.String getTitle(){
		return this.title;
	}
	
	/**
	 * Define title
	 * @param title title
	 * @generated
	 */
	public Contact setTitle(java.lang.String title){
		this.title = title;
		return this;
	}
	
	/**
	 * Obtém number
	 * @param number number
	 * return number
	 * @generated
	 */
	public java.lang.String getNumber(){
		return this.number;
	}
	
	/**
	 * Define number
	 * @param number number
	 * @generated
	 */
	public Contact setNumber(java.lang.String number){
		this.number = number;
		return this;
	}
	
	/**
	 * Obtém avatar
	 * @param avatar avatar
	 * return avatar
	 * @generated
	 */
	public java.lang.String getAvatar(){
		return this.avatar;
	}
	
	/**
	 * Define avatar
	 * @param avatar avatar
	 * @generated
	 */
	public Contact setAvatar(java.lang.String avatar){
		this.avatar = avatar;
		return this;
	}
	
	/**
	 * @generated
	 */
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((id == null) ? 0 : id.hashCode());

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
	    
	    if(!(obj instanceof Contact))
	      return false;
	    
	    Contact other = (Contact)obj;
	    
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	

	    return true;
	    
	}
}
