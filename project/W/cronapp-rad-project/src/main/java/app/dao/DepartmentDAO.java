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
@Repository("DepartmentDAO")
@Transactional(transactionManager="app-TransactionManager")
public interface DepartmentDAO extends JpaRepository<Department, java.lang.String> {

  /**
   * Obtém a instância de Department utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM Department entity WHERE entity.id = :id")
  public Department findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de Department utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM Department entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);



  /**
   * Foreign Key company
   * @generated
   */
  @Query("SELECT entity FROM Department entity WHERE entity.company.id = :id")
  public Page<Department> findDepartmentsByCompany(@Param(value="id") java.lang.String id, Pageable pageable);

}
