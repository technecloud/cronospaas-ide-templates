package security.dao;

import javax.persistence.*;
import security.entity.*;
import java.util.List;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * @generated
 */
public class UserDAO extends BasicDAO<String, User> {

	/**
	 * UID da classe, necessário na serialização 
	 * @generated
	 */
	private static final long serialVersionUID = 2648042l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   * @generated
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
   * @generated
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
   * @generated
   */  
  public User findById(java.lang.String id){
      Query query = this.entityManager.createQuery("SELECT entity FROM User entity WHERE entity.id = :id");
      query.setParameter("id", id);
           
      return (User) query.getSingleResult();	
  }

  /**
   * OneToMany Relation
   * @generated
   */
  public List<UserRole> findUserRole(java.lang.String id, int limit, int offset) {
      Query query = this.entityManager.createQuery("SELECT entity FROM UserRole entity WHERE entity.user.id = :id");
      query.setParameter("id", id);

      return (List<UserRole>) query.setFirstResult(offset).setMaxResults(limit).getResultList();	  
  }

  /**
   * ManyToOne Relation
   * @generated
   */
  public List<Role> listRole(java.lang.String id, int limit, int offset) {
      Query query = this.entityManager.createQuery("SELECT entity.role FROM UserRole entity WHERE entity.user.id = :id");
      query.setParameter("id", id);

      return (List<Role>) query.setFirstResult(offset).setMaxResults(limit).getResultList();	  
  }
  
    /**
     * ManyToOne Relation Delete
     * @generated
     */
    public int deleteRole(java.lang.String instanceId, java.lang.String relationId) {
      Query query = this.entityManager.createQuery("DELETE FROM UserRole entity WHERE entity.user.id = :instanceId AND entity.role.id = :relationId");
      query.setParameter("instanceId", instanceId);
      query.setParameter("relationId", relationId);

      return query.executeUpdate();	  
  }
  

  /**
   * NamedQuery list
   * @generated
   */
  public List<User> list(int limit, int offset){
      return this.entityManager.createNamedQuery("userList").setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
  /**
   * NamedQuery findByRole
   * @generated
   */
  public List<User> findByRole(java.lang.String roleid, int limit, int offset){
      return this.entityManager.createNamedQuery("userFindByRole").setParameter("roleid", roleid).setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
  /**
   * NamedQuery findByLogin
   * @generated
   */
  public List<User> findByLogin(java.lang.String login, int limit, int offset){
      return this.entityManager.createNamedQuery("userFindByLogin").setParameter("login", login).setFirstResult(offset).setMaxResults(limit).getResultList();		
  }
  
}