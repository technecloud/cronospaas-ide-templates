package diagram.contact.dao;

import diagram.contact.entity.*;
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
@Repository("ContactDAO")
@Transactional(transactionManager="diagram.contact-TransactionManager")
public interface ContactDAO extends JpaRepository<Contact, java.lang.String> {

  /**
   * Obtém a instância de Contact utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   * @generated
   */    
  @Query("SELECT entity FROM Contact entity WHERE entity.id = :id")
  public Contact findOne(@Param(value="id") java.lang.String id);

  /**
   * Remove a instância de Contact utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   * @generated
   */    
  @Modifying
  @Query("DELETE FROM Contact entity WHERE entity.id = :id")
  public void delete(@Param(value="id") java.lang.String id);

  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select c from Contact c")
  public List<Contact> list ( Pageable pageable );
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select c from Contact c where c.title LIKE CONCAT('%', COALESCE(:title, c.title),'%')")
  public List<Contact> listByTitle (@Param(value="title") java.lang.String title , Pageable pageable );
  







}