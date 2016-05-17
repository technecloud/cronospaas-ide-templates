package security.dao;

import security.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("UserDAO")
public interface UserDAO extends JpaRepository<User, String> {


  @Query("select u from User u")
  public List<User> list ( Pageable pageable );
  

  @Query("select u.user from UserRole u where u.role.id = :roleid")
  public List<User> findByRole (@Param(value="roleid") java.lang.String roleid , Pageable pageable );
  

  @Query("select u from User u where u.login = :login")
  public List<User> findByLogin (@Param(value="login") java.lang.String login , Pageable pageable );
  

  /**
   * OneToMany Relation
   * @generated
   */
  @Query("SELECT entity FROM UserRole entity WHERE entity.user.id = :id")
  public List<UserRole> findUserRole(@Param(value="id") java.lang.String id,  Pageable pageable );



  /**
   * ManyToOne Relation
   * @generated
   */
  @Query("SELECT entity.role FROM UserRole entity WHERE entity.user.id = :id")
  public List<Role> listRole(@Param(value="id") java.lang.String id,  Pageable pageable);

    /**
     * ManyToOne Relation Delete
     * @generated
     */
    @Modifying
    @Query("DELETE FROM UserRole entity WHERE entity.user.id = :instanceId AND entity.role.id = :relationId")
    public int deleteRole(@Param(value="instanceId") java.lang.String instanceId, @Param(value="relationId") java.lang.String relationId);




}