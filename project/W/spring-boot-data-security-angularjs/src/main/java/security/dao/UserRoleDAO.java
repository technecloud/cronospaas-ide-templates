package security.dao;

import security.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * Os métodos de create, edit, delete e outros estão abstraídos no JpaRepository
 * 
 * @see org.springframework.data.jpa.repository.JpaRepository
 * 
 * @generated
 */
@Repository("UserRoleDAO")
public interface UserRoleDAO extends JpaRepository<UserRole, String> {
  
  /**
   * Lista com paginação de UserRole
   * 
   * @generated
   */
  @Query("select u from UserRole u")
  public List<UserRole> list(Pageable pageable);
  
  /**
   * Lista com paginação de UserRole de um determinado User
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user = :user ")
  public List<UserRole> findByUser(@Param(value = "user") User user, Pageable pageable);
  
  /**
   * Lista com paginação de UserRole onde os usuários associados a ele possuam email igual ao informado
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user.email = :email")
  public List<UserRole> findByEmail(@Param(value = "email") java.lang.String email, Pageable pageable);
  
  /**
   * Lista com paginação de UserRole onde os usuários associados a ele possuam login igual ao informado
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.user.login = :login")
  public List<UserRole> findByLogin(@Param(value = "login") java.lang.String login, Pageable pageable);
  
  /**
   * Lista com paginação de UserRole onde as roles associadas a ele possuam id igual ao informado
   * 
   * @generated
   */
  @Query("select u from UserRole u where u.role.id = :roleid")
  public List<UserRole> findByRole(@Param(value = "roleid") java.lang.String roleid, Pageable pageable);
  
}