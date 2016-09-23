package app.dao.codedata;

import app.entity.*;

import app.entity.codedata.*;



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
@Repository("CategoryDAO")
@Transactional(transactionManager="app-TransactionManager")
public interface CategoryDAO extends JpaRepository<Category, java.lang.String> {

  /**
   * Obtém a instância de Category utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM Category entity WHERE entity.id = :id")
  public Category findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de Category utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM Category entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);

  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select c from Category c")
  public Page<Category> list ( Pageable pageable );
  

  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM Product entity WHERE entity.category.id = :id")
  public Page<Product> findProduct(@Param(value="id") java.lang.String id,  Pageable pageable );






}