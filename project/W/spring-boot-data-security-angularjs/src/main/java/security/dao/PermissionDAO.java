package security.dao;

import security.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("PermissionDAO")
public interface PermissionDAO extends JpaRepository<Permission, String> {


  @Query("select p from Permission p")
  public List<Permission> list ( Pageable pageable );
  


}