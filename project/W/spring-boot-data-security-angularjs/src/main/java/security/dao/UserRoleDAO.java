package security.dao;

import security.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("UserRoleDAO")
public interface UserRoleDAO extends JpaRepository<UserRole, String> {


  @Query("select u from UserRole u")
  public List<UserRole> list ( Pageable pageable );
  

  @Query("select u from UserRole u where u.user = :user ")
  public List<UserRole> findByUser (@Param(value="user") User user , Pageable pageable );
  

  @Query("select u from UserRole u where u.user.email = :email")
  public List<UserRole> findByEmail (@Param(value="email") java.lang.String email , Pageable pageable );
  

  @Query("select u from UserRole u where u.user.login = :login")
  public List<UserRole> findByLogin (@Param(value="login") java.lang.String login , Pageable pageable );
  

  @Query("select u from UserRole u where u.role.id = :roleid")
  public List<UserRole> findByRole (@Param(value="roleid") java.lang.String roleid , Pageable pageable );
  







}