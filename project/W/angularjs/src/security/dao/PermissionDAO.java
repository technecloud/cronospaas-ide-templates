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
public class PermissionDAO extends BasicDAO<String, Permission> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = -7099653195043569333l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public PermissionDAO(EntityManager entitymanager) {
    super(entitymanager);
  }



  /**
   * Remove a instância de Permission utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   */  
  public int deleteById(java.lang.String id){
      Query query = this.entityManager.createQuery("DELETE FROM Permission entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return query.executeUpdate();	
  }
  
  /**
   * Obtém a instância de Permission utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   */  
  public Permission findById(java.lang.String id){
      Query query = this.entityManager.createQuery("SELECT entity FROM Permission entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return (Permission) query.getSingleResult();	
  }

  public List<Permission> list(int limit, int offset){
      return this.entityManager.createNamedQuery("permissionList").setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
}