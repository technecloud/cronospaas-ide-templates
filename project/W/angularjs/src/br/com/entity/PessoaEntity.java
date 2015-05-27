package br.com.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;

import javax.xml.bind.annotation.*;
/**
 * Classe que representa a tabela PESSOA
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-05-27
 *
 */
 
@Entity
@Table(name = "PESSOA")
@NamedQueries({
        @NamedQuery(name = "PessoaEntity.findByID", query = "SELECT e FROM PessoaEntity e where e.id like :ID"),
        @NamedQuery(name = "PessoaEntity.findByNOME", query = "SELECT e FROM PessoaEntity e where e.nome like :NOME"),
        @NamedQuery(name = "PessoaEntity.findBySOBRENOME", query = "SELECT e FROM PessoaEntity e where e.sobrenome like :SOBRENOME"),
})
@XmlRootElement
public class PessoaEntity implements Serializable {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -8154845282810301688l;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private java.lang.Integer id;
	
	@Column(name = "nome", nullable = true, unique = false)
	private java.lang.String nome;
	
	@Column(name = "sobrenome", nullable = true, unique = false)
	private java.lang.String sobrenome;
	
	
	/**
	 * Construtor
	 */
	public PessoaEntity(){
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
	 * Obtém nome
	 * @param nome nome
	 * return nome
	 */
	public java.lang.String getNome(){
		return this.nome;
	}
	
	/**
	 * Define nome
	 * @param nome nome
	 */
	public void setNome(java.lang.String nome){
		this.nome = nome;
	}
	
	/**
	 * Obtém sobrenome
	 * @param sobrenome sobrenome
	 * return sobrenome
	 */
	public java.lang.String getSobrenome(){
		return this.sobrenome;
	}
	
	/**
	 * Define sobrenome
	 * @param sobrenome sobrenome
	 */
	public void setSobrenome(java.lang.String sobrenome){
		this.sobrenome = sobrenome;
	}
	
	@Override
	public int hashCode() {
        final int prime = 31;
        int result = 1;

        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((sobrenome == null) ? 0 : sobrenome.hashCode());

        return result;
    }
	
	@Override
  	public boolean equals(Object obj) {
    
	    if(this == obj)
	      return true;
	    
	    if(obj == null)
	      return false;
	    
	    if(!(obj instanceof PessoaEntity))
	      return false;
	    
	    PessoaEntity other = (PessoaEntity)obj;
	    
		if(this.id == null && other.id != null)
	    	return false;
	    else if(!this.id.equals(other.id))
	     	return false;
	
		if(this.nome == null && other.nome != null)
	    	return false;
	    else if(!this.nome.equals(other.nome))
	     	return false;
	
		if(this.sobrenome == null && other.sobrenome != null)
	    	return false;
	    else if(!this.sobrenome.equals(other.sobrenome))
	     	return false;
	
	

	    return true;
	    
	}
}