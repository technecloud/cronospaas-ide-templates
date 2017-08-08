package app.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonFilter;
import cronapi.rest.security.CronappSecurity;


/**
 * Classe que representa a tabela ROLE
 * @generated
 */
@Entity
@Table(name = "\"ROLE\"")
@XmlRootElement
@CronappSecurity(get = "Administrators", post = "Administrators", put = "Administrators", delete = "Administrators")
@JsonFilter("app.entity.Role")
public class Role implements Serializable {

  /**
   * UID da classe, necessário na serialização
   * @generated
   */
  private static final long serialVersionUID = 1L;

  /**
   * @generated
   */
  @Id
  @Column(name = "id", nullable = false, insertable=true, updatable=true)
  private java.lang.String id = UUID.randomUUID().toString().toUpperCase();

  /**
  * @generated
  */
  @Column(name = "name", nullable = true, unique = false, insertable=true, updatable=true)
  private java.lang.String name;

  /**
   * Construtor
   * @generated
   */
  public Role(){
  }


  /**
   * Obtém name
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
  public Role setName(java.lang.String name){
    this.name = name;
    return this;
  }

  /**
   * Obtém id
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
  public Role setId(java.lang.String id){
    this.id = id;
    return this;
  }

  /**
   * @generated
   */
  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    Role object = (Role)obj;
    if (id != null ? !id.equals(object.id) : object.id != null) return false;
    return true;
  }

  /**
   * @generated
   */
  @Override
  public int hashCode() {
    int result = 1;
    result = 31 * result + ((id == null) ? 0 : id.hashCode());
    return result;
  }

}