package sample.pessoa.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;

/**
 * Classe que representa a tabela CIDADE
 * @generated
 */
@Entity
@Table(name = "\"CIDADE\"")
@XmlRootElement
public class Cidade implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = 2018200409l;
	
	/**
	 * @generated
	 */
	@Id
    
	@Column(name = "id")
	private java.lang.String id = UUID.randomUUID().toString().toUpperCase();
	
	/**
	 * @generated
	 */
	@Column(name = "nome", nullable = true, unique = false)
	private java.lang.String nome;
	
	
	/**
	 * Construtor
	 * @generated
	 */
	public Cidade(){
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
	public Cidade setId(java.lang.String id){
		this.id = id;
		return this;
	}
	
	/**
	 * Obtém nome
	 * @param nome nome
	 * return nome
	 * @generated
	 */
	public java.lang.String getNome(){
		return this.nome;
	}
	
	/**
	 * Define nome
	 * @param nome nome
	 * @generated
	 */
	public Cidade setNome(java.lang.String nome){
		this.nome = nome;
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
	    
	    if(!(obj instanceof Cidade))
	      return false;
	    
	    Cidade other = (Cidade)obj;
	    
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	

	    return true;
	    
	}
}
