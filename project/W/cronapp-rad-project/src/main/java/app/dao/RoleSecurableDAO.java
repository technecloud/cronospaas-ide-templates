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
@Repository("RoleSecurableDAO")
@Transactional(transactionManager="app-TransactionManager")
public interface RoleSecurableDAO extends JpaRepository<RoleSecurable, java.lang.String> {

  /**
   * Obtém a instância de RoleSecurable utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM RoleSecurable entity WHERE entity.id = :id")
  public RoleSecurable findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de RoleSecurable utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM RoleSecurable entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);



  /**
   * Foreign Key role
   * @generated
   */
  @Query("SELECT entity FROM RoleSecurable entity WHERE entity.role.id = :id")
  public Page<RoleSecurable> findRoleSecurablesByRole(@Param(value="id") java.lang.String id, Pageable pageable);

  /**
   * Foreign Key securable
   * @generated
   */
  @Query("SELECT entity FROM RoleSecurable entity WHERE entity.securable.id = :id")
  public Page<RoleSecurable> findRoleSecurablesBySecurable(@Param(value="id") java.lang.String id, Pageable pageable);

}
