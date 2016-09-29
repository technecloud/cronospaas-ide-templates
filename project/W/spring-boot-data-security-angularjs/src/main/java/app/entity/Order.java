package app.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;




/**
 * Classe que representa a tabela ORDER
 * @generated
 */
@Entity
@Table(name = "\"ORDER\""


)
@XmlRootElement
public class Order implements Serializable {

  /**
   * UID da classe, necessário na serialização 
   * @generated
   */
  private static final long serialVersionUID = 76455710l;
  
  /**
   * @generated
   */
  @Id
    
  @Column(name = "id", insertable=true, updatable=true)
  private java.lang.String id = UUID.randomUUID().toString().toUpperCase();
  
  /**
   * @generated
   */
  @ManyToOne
  @JoinColumn(name="fk_consumer", referencedColumnName = "id", insertable=true, updatable=true)
  private Consumer consumer;
  
  /**
   * @generated
   */
  @ManyToOne
  @JoinColumn(name="fk_product", referencedColumnName = "id", insertable=true, updatable=true)
  private Product product;
  
  /**
   * @generated
   */
  @Temporal(TemporalType.DATE)
  @Column(name = "dateOrder", nullable = false, unique = false, insertable=true, updatable=true)
  private java.util.Date dateOrder;
  
  /**
   * @generated
   */
  @Column(name = "valueOrder", nullable = false, unique = false, precision=2, insertable=true, updatable=true)
  private java.lang.Double valueOrder;
  
  
  /**
   * Construtor
   * @generated
   */
  public Order(){
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
  public Order setId(java.lang.String id){
    this.id = id;
    return this;
  }
  
  /**
   * Obtém consumer
   * @param consumer consumer
   * return consumer
   * @generated
   */
  public Consumer getConsumer(){
    return this.consumer;
  }
  
  /**
   * Define consumer
   * @param consumer consumer
   * @generated
   */
  public Order setConsumer(Consumer consumer){
    this.consumer = consumer;
    return this;
  }
  
  /**
   * Obtém product
   * @param product product
   * return product
   * @generated
   */
  public Product getProduct(){
    return this.product;
  }
  
  /**
   * Define product
   * @param product product
   * @generated
   */
  public Order setProduct(Product product){
    this.product = product;
    return this;
  }
  
  /**
   * Obtém dateOrder
   * @param dateOrder dateOrder
   * return dateOrder
   * @generated
   */
  public java.util.Date getDateOrder(){
    return this.dateOrder;
  }
  
  /**
   * Define dateOrder
   * @param dateOrder dateOrder
   * @generated
   */
  public Order setDateOrder(java.util.Date dateOrder){
    this.dateOrder = dateOrder;
    return this;
  }
  
  /**
   * Obtém valueOrder
   * @param valueOrder valueOrder
   * return valueOrder
   * @generated
   */
  public java.lang.Double getValueOrder(){
    return this.valueOrder;
  }
  
  /**
   * Define valueOrder
   * @param valueOrder valueOrder
   * @generated
   */
  public Order setValueOrder(java.lang.Double valueOrder){
    this.valueOrder = valueOrder;
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
      
      if(!(obj instanceof Order))
        return false;
      
      Order other = (Order)obj;
      
    if(this.id == null && other.id != null)
        return false;
      else if(!this.id.equals(other.id))
        return false;
  

      return true;
      
  }
}
