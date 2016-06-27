package security.dao;

import security.entity.*;
import java.util.List;
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
@Repository("UserRoleDAO")
@Transactional(transactionManager="security-TransactionManager")
public interface UserRoleDAO extends JpaRepository<UserRole, java.lang.String> {

  /**
   * Obtém a instância de UserRole utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM UserRole entity WHERE entity.id = :id")
  public UserRole findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de UserRole utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM UserRole entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);

  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select u from UserRole u")
  public List<UserRole> list ( Pageable pageable );
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user = :user ")
  public List<UserRole> findByUser (@Param(value="user") User user , Pageable pageable );
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user.email = :email")
  public List<UserRole> findByEmail (@Param(value="email") java.lang.String email , Pageable pageable );
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user.login = :login")
  public List<UserRole> findByLogin (@Param(value="login") java.lang.String login , Pageable pageable );
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.role.id = :roleid")
  public List<UserRole> findByRole (@Param(value="roleid") java.lang.String roleid , Pageable pageable );
  







}