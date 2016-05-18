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
@Repository("RoleDAO")
public interface RoleDAO extends JpaRepository<Role, String> {
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  @Query("select r from Role r")
  public List<Role> list(Pageable pageable);
  
  /**
   * OneToMany Relation
   * 
   * @generated
   */
  @Query("SELECT entity FROM UserRole entity WHERE entity.role.id = :id")
  public List<UserRole> findUserRole(@Param(value = "id") java.lang.String id, Pageable pageable);
  
  /**
   * OneToMany Relation
   * 
   * @generated
   */
  @Query("SELECT entity FROM Permission entity WHERE entity.role.id = :id")
  public List<Permission> findPermission(@Param(value = "id") java.lang.String id, Pageable pageable);
  
  /**
   * ManyToOne Relation
   * 
   * @generated
   */
  @Query("SELECT entity.user FROM UserRole entity WHERE entity.role.id = :id")
  public List<User> listUser(@Param(value = "id") java.lang.String id, Pageable pageable);
  
  /**
   * ManyToOne Relation Delete
   * 
   * @generated
   */
  @Modifying
  @Query("DELETE FROM UserRole entity WHERE entity.role.id = :instanceId AND entity.user.id = :relationId")
  public int deleteUser(@Param(value = "instanceId") java.lang.String instanceId,
                        @Param(value = "relationId") java.lang.String relationId);
  
}
