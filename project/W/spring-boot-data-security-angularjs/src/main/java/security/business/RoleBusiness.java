package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import security.dao.*;
import security.entity.*;
import java.util.*;




@Service("RoleBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class RoleBusiness {

    @Autowired
    @Qualifier("RoleDAO")
    protected RoleDAO repository;


    public RoleDAO getRepository() {
        return repository;
    }

  /**
   * @generated modifiable
   */  
  public List<UserRole> findUserRole(java.lang.String id,  Pageable pageable) {
      // begin-user-code
      // end-user-code  
      List<UserRole> result = repository.findUserRole(id,  pageable );
      // begin-user-code  
      // end-user-code        
      return result;	  
  }

  /**
   * @generated modifiable
   */  
  public List<Permission> findPermission(java.lang.String id,  Pageable pageable) {
      // begin-user-code
      // end-user-code  
      List<Permission> result = repository.findPermission(id,  pageable );
      // begin-user-code  
      // end-user-code        
      return result;	  
  }



  /**
   * @generated modifiable
   */  
  public List<User> listUser(java.lang.String id,  Pageable pageable ) {
      // begin-user-code
      // end-user-code  
      List<User> result = repository.listUser(id,  pageable );
      // begin-user-code
      // end-user-code
      return result;        	  
  }
  
  /**
   * @generated modifiable
   */    
  public int deleteUser(java.lang.String instanceId, java.lang.String relationId) {
      // begin-user-code
      // end-user-code  
      int result = repository.deleteUser(instanceId, relationId);
      // begin-user-code
      // end-user-code  
      return result;  
  }


    
}
