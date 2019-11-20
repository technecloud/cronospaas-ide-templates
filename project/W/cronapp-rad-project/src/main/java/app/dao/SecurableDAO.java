package app.dao;

import app.entity.*;
import java.util.*;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;
import org.springframework.transaction.annotation.*; 


/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * Os métodos de create, edit, delete e outros estão abstraídos no JpaRepository
 * 
 * @see org.springframework.data.jpa.repository.JpaRepository
 * 
 * @generated
 */
@Repository("SecurableDAO")
@Transactional(transactionManager="app-TransactionManager")
public interface SecurableDAO extends JpaRepository<Securable, java.lang.String> {

  /**
   * Obtém a instância de Securable utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM Securable entity WHERE entity.id = :id")
  public Securable findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de Securable utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM Securable entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);



  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM RoleSecurable entity WHERE entity.securable.id = :id")
  public Page<RoleSecurable> findRoleSecurable(@Param(value="id") java.lang.String id, Pageable pageable);

  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM UserSecurable entity WHERE entity.securable.id = :id")
  public Page<UserSecurable> findUserSecurable(@Param(value="id") java.lang.String id, Pageable pageable);

  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM View entity WHERE entity.securable.id = :id")
  public Page<View> findView(@Param(value="id") java.lang.String id, Pageable pageable);
  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.role FROM RoleSecurable entity WHERE entity.securable.id = :id")
  public Page<Role> listRole(@Param(value="id") java.lang.String id, Pageable pageable);

  /**
   * ManyToOne Relation Delete
   * @generated
   */
  @Modifying
  @Query("DELETE FROM RoleSecurable entity WHERE entity.securable.id = :instanceId AND entity.role.id = :relationId")
  public int deleteRole(@Param(value="instanceId") java.lang.String instanceId, @Param(value="relationId") java.lang.String relationId);
  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.user FROM UserSecurable entity WHERE entity.securable.id = :id")
  public Page<User> listUser(@Param(value="id") java.lang.String id, Pageable pageable);

  /**
   * ManyToOne Relation Delete
   * @generated
   */
  @Modifying
  @Query("DELETE FROM UserSecurable entity WHERE entity.securable.id = :instanceId AND entity.user.id = :relationId")
  public int deleteUser(@Param(value="instanceId") java.lang.String instanceId, @Param(value="relationId") java.lang.String relationId);

}
