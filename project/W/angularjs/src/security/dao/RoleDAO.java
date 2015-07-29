package security.dao;

import javax.persistence.*;
import security.entity.*;
import java.util.List;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-07-29
 *
 */
public class RoleDAO extends BasicDAO<String, Role> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -405078088065574837l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public RoleDAO(EntityManager entitymanager) {
    super(entitymanager);
  }



  /**
   * Remove a instância de Role utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   */  
  public int deleteById(java.lang.String id){
      Query query = this.entityManager.createQuery("DELETE FROM Role entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return query.executeUpdate();	
  }
  
  /**
   * Obtém a instância de Role utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   */  
  public Role findById(java.lang.String id){
      Query query = this.entityManager.createQuery("SELECT entity FROM Role entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return (Role) query.getSingleResult();	
  }

  public List<Role> list(int limit, int offset){
      return this.entityManager.createNamedQuery("roleList").setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
}