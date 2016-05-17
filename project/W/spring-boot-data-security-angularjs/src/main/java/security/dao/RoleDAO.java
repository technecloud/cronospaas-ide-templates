package security.dao;

import security.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("RoleDAO")
public interface RoleDAO extends JpaRepository<Role, String> {


  @Query("select r from Role r")
  public List<Role> list ( Pageable pageable );
  

  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM UserRole entity WHERE entity.role.id = :id")
  public List<UserRole> findUserRole(@Param(value="id") java.lang.String id,  Pageable pageable );
  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM Permission entity WHERE entity.role.id = :id")
  public List<Permission> findPermission(@Param(value="id") java.lang.String id,  Pageable pageable );



  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.user FROM UserRole entity WHERE entity.role.id = :id")
  public List<User> listUser(@Param(value="id") java.lang.String id,  Pageable pageable);

    /**
     * ManyToOne Relation Delete
     * @generated
     */
    @Modifying
    @Query("DELETE FROM UserRole entity WHERE entity.role.id = :instanceId AND entity.user.id = :relationId")
    public int deleteUser(@Param(value="instanceId") java.lang.String instanceId, @Param(value="relationId") java.lang.String relationId);




}