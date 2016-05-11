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
  


}