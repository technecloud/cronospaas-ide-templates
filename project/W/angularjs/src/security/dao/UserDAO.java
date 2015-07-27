package security.dao;

import javax.persistence.*;
import security.entity.*;
import java.util.List;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-07-27
 *
 */
public class UserDAO extends BasicDAO<String, User> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 4893045223282534005l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public UserDAO(EntityManager entitymanager) {
    super(entitymanager);
  }



  /**
   * Remove a instância de User utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   */  
  public int deleteById(java.lang.String id){
      Query query = this.entityManager.createQuery("DELETE FROM User entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return query.executeUpdate();	
  }
  
  /**
   * Obtém a instância de User utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   */  
  public User findById(java.lang.String id){
      Query query = this.entityManager.createQuery("SELECT entity FROM User entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return (User) query.getSingleResult();	
  }

  public List<User> list(int limit, int offset){
      return this.entityManager.createNamedQuery("userList").setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
}