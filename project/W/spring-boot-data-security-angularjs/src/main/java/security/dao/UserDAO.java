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
  


}